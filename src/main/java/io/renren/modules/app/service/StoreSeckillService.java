package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.app.entity.StoreSeckillEntity;
import io.renren.modules.app.vo.SeckillSessionVo;

import java.util.List;
import java.util.Map;

/**
 * 商品秒杀产品表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface StoreSeckillService extends IService<StoreSeckillEntity> {

    PageUtils queryPage(Map<String, Object> params);
    void open(Long id);
    void close(Long id);
    void AutoUploadSeckillProduct();
    List<StoreSeckillEntity> getSeckillSessionsIn3Days();
    void uploadSeckill();

    String kill(Integer uid,Integer addid,String killId,  Integer num) throws InterruptedException;
}

