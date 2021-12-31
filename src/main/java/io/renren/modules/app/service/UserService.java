/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.app.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.entity.UserEntity;
import io.renren.modules.app.form.LoginForm;

import java.util.List;
import java.util.Map;

/**
 * 用户
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface UserService extends IService<UserEntity> {

	UserEntity queryByMobile(String mobile);

	/**
	 * 用户登录
	 * @param form    登录表单
	 * @return        返回用户ID
	 */
	long login(LoginForm form);

	PageUtils queryPage(Map<String, Object> params);

	/**
	 * 添加历史记录
	 * @param userId
	 * @param skuId
	 */
	public void addRecentHistory(Long userId, Long skuId);

	/**
	 * 获取历史记录
	 * @param uid
	 * @return
	 */
	List<StoreProductEntity> getHistorySkuList(Long uid);

	List<StoreProductEntity> getUserLike(Long uid);

	List<StoreProductEntity> getUserCollect(Long uid);
}
