package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.app.entity.StoreOrderEntity;
import io.renren.modules.app.vo.*;

import java.util.List;
import java.util.Map;

/**
 * 订单表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface StoreOrderService extends IService<StoreOrderEntity> {
    OrderCountVo getOrderCount();
    PageUtils queryPage(Map<String, Object> params);
    PageUtils queryPageByCondition(Map<String, Object> params);
    void closeOrder(StoreOrderEntity orderEntity);

    SubmitOrderResponseVo create(CreateOrderVo createOrderVo);
    Map<String, Object> chartCount();
    void delivery(DeliveryVo deliveryVo);

    Map<String, Object> cateCount();

    Map<String, Object> dataCount();

    List<UserOrderVo> getByUSerID(Long uid);
}

