package io.renren.modules.app.schedule;

import io.renren.modules.app.service.StoreSeckillService;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Slf4j

@Component
public class SecKillScheduled {
    private final String upload_lock = "seckill:upload:lock";

    @Autowired
    private RedissonClient redissonClient;

    @Autowired
    private StoreSeckillService secKillService;
    /**
     * 定时任务
     * 每天三点上架最近三天的秒杀商品
     */
    @Scheduled(cron = "0 0 3 * * ?")
    @Async
    public void uploadSecKillProduct(){
        RLock lock = redissonClient.getLock(upload_lock);
        try {
            lock.lock(10, TimeUnit.SECONDS);
            secKillService.uploadSeckill();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            lock.unlock();
        }
        log.info("test");
    }
}
