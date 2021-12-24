package io.renren.modules.app.dao;

import io.renren.modules.app.entity.UserSignEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 签到记录表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Mapper
public interface UserSignDao extends BaseMapper<UserSignEntity> {
	
}
