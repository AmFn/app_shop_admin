package io.renren.modules.app.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.sun.xml.bind.v2.TODO;
import io.renren.common.utils.OrderUtil;
import io.renren.common.utils.R;
import io.renren.modules.app.entity.*;
import io.renren.modules.app.enums.OrderStatusEnum;
import io.renren.modules.app.service.*;
import io.renren.modules.app.vo.*;
import org.joda.time.DateTime;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreOrderDao;
import org.springframework.util.StringUtils;

@Service("storeOrderService")
public class StoreOrderServiceImpl extends ServiceImpl<StoreOrderDao, StoreOrderEntity> implements StoreOrderService {

    @Autowired
    UserService userService;
    @Autowired
    StoreCartService storeCartService;
    @Autowired
    StoreProductService productService;
    @Autowired
    StoreCategoryService categoryService;
    @Autowired
    UserAddressService addressService;
    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    StoreOrderDao storeOrderDao;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreOrderEntity> page = this.page(
                new Query<StoreOrderEntity>().getPage(params),
                new QueryWrapper<StoreOrderEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public Map<String, Object> chartCount() {
        Map<String, Object> map = new LinkedHashMap<>();

        int nowMonth = OrderUtil.dateToTimestampT(DateUtil
                .beginOfMonth(new Date()));
        List<ChartDataVo> chart = storeOrderDao.chartList(nowMonth);
        chart.stream().forEach(chartDataVo -> {
chartDataVo.setTime(DateUtil.format(DateUtil.parseDate(chartDataVo.getTime()),"MM-dd"));
        });
        map.put("chart",chart );

        List<ChartDataVo> chartT =  storeOrderDao.chartListT(nowMonth);
       chartT.stream().forEach(chartDataVo -> {
            chartDataVo.setTime(DateUtil.format(DateUtil.parseDate(chartDataVo.getTime()),"MM-dd"));
        });
        map.put("chartT", chartT);


        return map;
    }
    @Override
    public PageUtils queryPageByCondition(Map<String, Object> params) {

        QueryWrapper<StoreOrderEntity> wrapper = new QueryWrapper<>();

        String key = (String) params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.and((w)->{
                w.eq("id",key).or().like("real_name",key);
            });
        }

        String status = (String) params.get("status");
        if(!StringUtils.isEmpty(status)){
            wrapper.eq("status",status);
        }


        IPage<StoreOrderEntity> page = this.page(
                new Query<StoreOrderEntity>().getPage(params),
                wrapper
        );

        return new PageUtils(page);
    }
@Override
    public OrderCountVo getOrderCount() {
        //获取所有订单转态为已支付的
        List<CountVo> nameList = storeCartService.findCateName();
        Map<String, Integer> childrenMap = new HashMap<>();
        nameList.forEach(i -> {
            if (i != null) {
                if (childrenMap.containsKey(i.getCatename())) {
                    childrenMap.put(i.getCatename(), childrenMap.get(i.getCatename()) + 1);
                } else {
                    childrenMap.put(i.getCatename(), 1);
                }
            }

        });
        List<OrderCountVo.OrderCountData> list = new ArrayList<>();
        List<String> columns = new ArrayList<>();
        childrenMap.forEach((k, v) -> {
            OrderCountVo.OrderCountData orderCountData = new OrderCountVo.OrderCountData();
            orderCountData.setName(k);
            orderCountData.setValue(v);
            columns.add(k);
            list.add(orderCountData);
        });
        OrderCountVo orderCountDto = new OrderCountVo();
        orderCountDto.setColumn(columns);
        orderCountDto.setOrderCountDatas(list);
        return orderCountDto;
    }



    @Override
    public void closeOrder(StoreOrderEntity orderEntity) {
        StoreOrderEntity newOrderEntity = this.getById(orderEntity.getId());

        if (OrderStatusEnum.CREATE_NEW.getCode().equals(newOrderEntity.getStatus())) {
            StoreOrderEntity updateOrder = new StoreOrderEntity();
            updateOrder.setId(newOrderEntity.getId());
            updateOrder.setStatus(OrderStatusEnum.CANCLED.getCode());
            this.updateById(updateOrder);
        }
    }
    @Override
    public SubmitOrderResponseVo create(CreateOrderVo createOrderVo) {
        SubmitOrderResponseVo orderResponseVo = new SubmitOrderResponseVo();
        List<StoreCartEntity>  storeCartEntity =  createOrderVo.getProducts();
        List<StoreOrderEntity> orderEntities = new ArrayList<>();
        if(createOrderVo.getProduct() ==null){
            if(createOrderVo.getProducts()== null){
                return null;
            }
            //购物车结算

            for (StoreCartEntity cartEntity : storeCartEntity) {
                StoreProductEntity pro = productService.getById(cartEntity.getProductId());
                Integer num = cartEntity.getCartNum();
                orderEntities.add(createOrderEveryProduct(pro, createOrderVo, num,cartEntity.getId()));
            }
            orderResponseVo.setOrder(orderEntities);
        }else {
            //立即结算

            orderEntities.add( createOrderEveryProduct(createOrderVo.getProduct(), createOrderVo, createOrderVo.getNum()));
            orderResponseVo.setOrder(orderEntities);
        }

        return orderResponseVo;
    }

    @Override
    public void delivery(DeliveryVo deliveryVo) {
      if (!StringUtils.isEmpty(deliveryVo.getOrderId())&&!StringUtils.isEmpty(deliveryVo.getDeliveryId())&&!StringUtils.isEmpty(deliveryVo.getDeliverySn())){
          StoreOrderEntity order = baseMapper.selectOne(new LambdaQueryWrapper<StoreOrderEntity>().eq(StoreOrderEntity::getOrderId, deliveryVo.getOrderId()));
          order.setDeliveryId(deliveryVo.getDeliveryId());
          order.setDeliverySn(deliveryVo.getDeliverySn());
          order.setStatus(OrderStatusEnum.SENDED.getCode());
          baseMapper.updateById(order);
      }
    }

    @Override
    public Map<String, Object> cateCount() {
        Map<String, Object> map = new LinkedHashMap<>();
        List<CatChartVo> chartDataVos = new ArrayList<>();
        List<StoreCategoryEntity> categoryEntities = categoryService.list().stream()
                .filter(o -> o.getPid() == 0)
                .collect(Collectors.toList());
        categoryEntities.stream().forEach(category->{
            Integer count = productService.getCountByCategoryId(Long.valueOf(category.getId()));
            String cateName = category.getCateName();
            CatChartVo catChartVo = new CatChartVo();
            catChartVo.setName(cateName);
            catChartVo.setValue(count);
            chartDataVos.add(catChartVo);

            map.put("pieChart",chartDataVos);
        });

        return map;
    }

    @Override
    public Map<String, Object> dataCount() {
        LinkedHashMap<String, Object> map = new LinkedHashMap<>();
        Integer orderNum = baseMapper.selectCount(null);
        Integer productNum = productService.count();
        Integer userNum = userService.count();
        Double totalPrice = baseMapper.sumTotalPrice();
        map.put("orderNum",orderNum);
        map.put("productNum",productNum);
        map.put("userNum",userNum);
        map.put("totalPrice",totalPrice);

        return map;
    }

    @Override
    public List<UserOrderVo> getByUSerID(Long uid) {
//        List<StoreOrderEntity> orderEntities = baseMapper.selectList(new LambdaQueryWrapper<StoreOrderEntity>().eq(StoreOrderEntity::getUid, uid));
        if(null!=uid){
            List<UserOrderVo> orderEntities = storeOrderDao.getByUSerID(uid);
            return orderEntities;

        }else{
            return null;
        }
    }

    private StoreOrderEntity createOrderEveryProduct(StoreProductEntity product, CreateOrderVo createOrderVo,Integer num) {
        StoreOrderEntity order = new StoreOrderEntity();
        UserAddressEntity address = createOrderVo.getAddress();
        long uid = createOrderVo.getUid();
        UserEntity userEntity = userService.getById(uid);
        order.setOrderId(IdWorker.getIdStr());
        order.setUid(uid);
        order.setPid(Math.toIntExact(product.getId()));
        order.setRealName(userEntity.getRealName());
        order.setUserPhone(userEntity.getPhone());
        order.setUserAddress(addressService.getAddressStringById(Math.toIntExact(address.getId())));
       order.setCartId("none");
        order.setTotalNum(num);
       order.setFreightPrice(product.getPostage());

     if(createOrderVo.isSecKill()){
         //秒杀修改价格
         //TODO

     }else{
         if(null!=createOrderVo.getCoupon()){
             order.setCouponId(createOrderVo.getCoupon().getId());
             order.setCouponPrice(createOrderVo.getCoupon().getCouponPrice());
         }

         order.setTotalPrice(computePrice(order));
         order.setPayPrice(computePayPrice(order));
         order.setDeductionPrice(new BigDecimal(String.valueOf(order.getTotalPrice())).subtract(order.getPayPrice()));

     }
        order.setStatus(0);
        order.setRefundStatus(0);

        rabbitTemplate.convertAndSend("order-event-exchange","order.create.order",order);
        baseMapper.insert(order);
        return order;

    }

    private BigDecimal computePayPrice(StoreOrderEntity order) {

        BigDecimal price = productService.getById(order.getPid()).getPrice();
        BigDecimal totalNum = BigDecimal.ZERO;
        if (order.getTotalNum()  > 0) {
            BigDecimal itemPrice =price.multiply(new BigDecimal(order.getTotalNum().toString())); totalNum = totalNum.add(itemPrice).add(order.getFreightPrice());
            if(null!=order.getCouponPrice()){
                totalNum.subtract(order.getCouponPrice());
            }

        }
        return totalNum;
    }

    private BigDecimal computePrice(StoreOrderEntity order) {

        BigDecimal price = productService.getById(order.getPid()).getPrice();
        BigDecimal totalNum = BigDecimal.ZERO;
        if (order.getTotalNum()  > 0) {
            BigDecimal itemPrice =price.multiply(new BigDecimal(order.getTotalNum().toString())); totalNum = totalNum.add(itemPrice).add(order.getFreightPrice());

        }
        return totalNum;
    }

    private StoreOrderEntity createOrderEveryProduct(StoreProductEntity product, CreateOrderVo createOrderVo,Integer num,long id){
        StoreOrderEntity order = createOrderEveryProduct(product, createOrderVo, num);
        order.setCartId(String.valueOf(id));
        return order;
    }
}