package io.renren.modules.app.dao;

import io.renren.modules.app.entity.StoreCouponUserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 优惠券发放记录表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:06
 */
@Mapper
public interface StoreCouponUserDao extends BaseMapper<StoreCouponUserEntity> {
	
}
