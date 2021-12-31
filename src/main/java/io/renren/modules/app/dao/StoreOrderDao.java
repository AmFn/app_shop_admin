package io.renren.modules.app.dao;

import io.renren.modules.app.entity.StoreOrderEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.app.vo.ChartDataVo;
import io.renren.modules.app.vo.UserOrderVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 订单表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Mapper
@Repository
public interface StoreOrderDao extends BaseMapper<StoreOrderEntity> {
    @Select("select IFNULL(sum(pay_price),0)  from app_store_order ")
    Double sumTotalPrice();
    @Select("SELECT IFNULL(sum(pay_price),0) as num," +
            "create_time as time " +
            " FROM app_store_order where  create_time >= ${time}" +
            " GROUP BY create_time " +
            " ORDER BY create_time ASC")
    List<ChartDataVo> chartList(@Param("time") int time);

    @Select("SELECT count(id) as num," +
            "create_time as time " +
            " FROM app_store_order where create_time >= ${time}" +
            " GROUP BY create_time " +
            " ORDER BY create_time ASC")
    List<ChartDataVo> chartListT(@Param("time") int time);

    @Select("select app_store_order.order_id as oid,app_store_order.`status`,app_store_cart.id as cid,app_store_order.uid,app_store_product.id as pid,app_store_product.store_name ,app_store_cart.cart_num as num,app_store_product.image,app_store_order.total_price from app_store_order " +
            " left join app_store_cart on  app_store_order.cart_id = app_store_cart.id" +
            " left join app_store_product on app_store_cart.product_id = app_store_product.id" +
            " where app_store_order.uid = ${uid}")
    List<UserOrderVo> getByUSerID(@Param("uid") long uid);
}
