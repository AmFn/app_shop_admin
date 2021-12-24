package io.renren.modules.app.dao;

import io.renren.modules.app.entity.StoreCartEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.app.vo.CountVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 购物车表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Mapper
@Repository
public interface StoreCartDao extends BaseMapper<StoreCartEntity> {
    @Select("SELECT t.cate_name as catename from app_store_cart c  " +
            "LEFT JOIN app_store_product p on c.product_id = p.id  " +
            "LEFT JOIN app_store_category t on p.cate_id = t.id " +
            "WHERE c.is_pay = 1")
    List<CountVo> findCateName();
}
