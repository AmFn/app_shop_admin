package io.renren.modules.app.dao;

import io.renren.modules.app.entity.UserBillEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户账单表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Mapper
public interface UserBillDao extends BaseMapper<UserBillEntity> {
	
}
