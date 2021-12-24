package io.renren.modules.app.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import io.lettuce.core.RedisClient;
import io.renren.common.utils.R;
import io.renren.modules.app.entity.UserEntity;
import io.renren.modules.app.service.StoreProductService;
import io.renren.modules.app.service.UserAddressService;
import io.renren.modules.app.service.UserService;
import io.renren.modules.app.vo.CreateOrderVo;
import io.renren.modules.app.vo.SeckillSessionVo;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreSeckillDao;
import io.renren.modules.app.entity.StoreSeckillEntity;
import io.renren.modules.app.service.StoreSeckillService;
import org.springframework.util.StringUtils;

@Service("storeSeckillService")
public class StoreSeckillServiceImpl extends ServiceImpl<StoreSeckillDao, StoreSeckillEntity> implements StoreSeckillService {
    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    RedissonClient redissonClient;
    @Autowired
    UserService userService;
    @Autowired
    UserAddressService addressService;
    @Autowired
    StoreProductService productService;


    //K: SESSION_CACHE_PREFIX + startTime + "_" + endTime
    //V: sessionId+"-"+skuId的List
    private final String SESSION_CACHE_PREFIX = "seckill:sessions:";

    //K: 固定值SECKILL_CHARE_PREFIX
    //V: hash，k为sessionId+"-"+skuId，v为对应的商品信息SeckillSkuRedisTo
    private final String SECKILL_CHARE_PREFIX = "seckill:skus";

    //K: SKU_STOCK_SEMAPHORE+商品随机码
    //V: 秒杀的库存件数
    private final String SKU_STOCK_SEMAPHORE = "seckill:stock:";

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreSeckillEntity> page = this.page(
                new Query<StoreSeckillEntity>().getPage(params),
                new QueryWrapper<StoreSeckillEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void close(Long id) {
        StoreSeckillEntity storeSeckillEntity = baseMapper.selectById(id);
        if (storeSeckillEntity!=null){
            storeSeckillEntity.setStatus(0);
            baseMapper.updateById(storeSeckillEntity);
        }
    }

    @Override
    public String kill(Integer uid ,Integer addId,String killId , Integer num) throws InterruptedException {
        BoundHashOperations<String, String, String> ops = redisTemplate.boundHashOps(SECKILL_CHARE_PREFIX);
        String json = ops.get(killId);
        String orderSn = null;
        if (!StringUtils.isEmpty(json)){
            StoreSeckillEntity redisSeckill = JSON.parseObject(json, StoreSeckillEntity.class);
            //验证时效
            long current = System.currentTimeMillis();
            if (current >= redisSeckill.getStartTime().getTime() && current <= redisSeckill.getStopTime().getTime()) {

                UserEntity userEntity = userService.getById(uid);

                    long ttl = redisSeckill.getStopTime().getTime() - System.currentTimeMillis();
                    Boolean occupy = redisTemplate.opsForValue().setIfAbsent(userEntity.getUid()+"-"+redisSeckill.getId(), num.toString(), ttl, TimeUnit.MILLISECONDS);
                    //未秒杀过该商品
                    if (occupy){
                        // 校验库存和购买量
                        if (num <= redisSeckill.getNum()) {
                            RSemaphore semaphore = redissonClient.getSemaphore(SKU_STOCK_SEMAPHORE);
                            boolean acquire = semaphore.tryAcquire(num,100,TimeUnit.MILLISECONDS);
                            // 获取库存成功
                            if (acquire) {
                                orderSn = IdWorker.getTimeId();
                                CreateOrderVo orderVo = new CreateOrderVo();
                                orderVo.setNum(num);
                                orderVo.setAddress(addressService.getById(addId));
                                orderVo.setUid(uid);
                                orderVo.setSecKill(true);
                                orderVo.setProduct(productService.getById(redisSeckill.getProductId()));

                               //发送创建订单的消息
                                rabbitTemplate.convertAndSend("order-event-exchange", "order.seckill.order", orderVo);
                            }
                        }
                    }

            }
            return orderSn;
        }
        return null;
    }


    @Override
    public void AutoUploadSeckillProduct() {

    }

    @Override
    public void uploadSeckill() {
        List<StoreSeckillEntity> sessions = getSeckillSessionsIn3Days();
        if (sessions!=null) {
            //在redis中分别保存秒杀场次信息和场次对应的秒杀商品信息
            saveSecKillSession(sessions);
            saveSecKill(sessions);
        }
    }

    private void saveSecKill(List<StoreSeckillEntity> sessions) {
        BoundHashOperations<String, Object, Object> ops = redisTemplate.boundHashOps(SECKILL_CHARE_PREFIX);
        sessions.stream().forEach(session->{
                String key = session.getId().toString();
                if (!ops.hasKey(key)){
                    String jsonString = JSON.toJSONString(session);
                    ops.put(key,jsonString);
                    // 使用库存作为Redisson信号量限制库存
                    RSemaphore semaphore = redissonClient.getSemaphore(SKU_STOCK_SEMAPHORE );
                    semaphore.trySetPermits(session.getStock());
                }
            });

    }


    private void saveSecKillSession(List<StoreSeckillEntity> sessions) {
        sessions.stream().forEach(session->{
            String key = SESSION_CACHE_PREFIX + session.getStartTime().getTime() + "_" + session.getStopTime().getTime();
            if (!redisTemplate.hasKey(key)){
                String values = session.getId().toString();

                redisTemplate.opsForList().leftPushAll(key,values);
            }
        });
    }

    @Override
    public List<StoreSeckillEntity> getSeckillSessionsIn3Days() {
        QueryWrapper<StoreSeckillEntity> queryWrapper = new QueryWrapper<StoreSeckillEntity>()
                .between("start_time", getStartTime(), getEndTime());
        List<StoreSeckillEntity> seckillSessionEntities = this.list(queryWrapper);

        return seckillSessionEntities;
    }

    @Override
    public void open(Long id) {
        StoreSeckillEntity storeSeckillEntity = baseMapper.selectById(id);
        if (storeSeckillEntity!=null){
            storeSeckillEntity.setStatus(1);
            baseMapper.updateById(storeSeckillEntity);
        }
    }

    //当前天数的 00:00:00
    private String getStartTime() {
        LocalDate now = LocalDate.now();
        LocalDateTime time = now.atTime(LocalTime.MIN);
        String format = time.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return format;
    }

    //当前天数+2 23:59:59..
    private String getEndTime() {
        LocalDate now = LocalDate.now();
        LocalDateTime time = now.plusDays(2).atTime(LocalTime.MAX);
        String format = time.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return format;
    }
}