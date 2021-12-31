/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.app.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.RRException;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.common.validator.Assert;
import io.renren.modules.app.dao.UserDao;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.entity.StoreProductRelationEntity;
import io.renren.modules.app.entity.UserEntity;
import io.renren.modules.app.form.LoginForm;
import io.renren.modules.app.service.StoreProductRelationService;
import io.renren.modules.app.service.StoreProductService;
import io.renren.modules.app.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements UserService {

	@Autowired
	RedisTemplate redisTemplate;
	private final  String KEY_HISTORY = "user:history:";

	@Autowired
	StoreProductService productService;
	@Autowired
	StoreProductRelationService relationService;

	@Override
	public UserEntity queryByMobile(String mobile) {
		return baseMapper.selectOne(new QueryWrapper<UserEntity>().eq("phone", mobile));
	}

	@Override
	public long login(LoginForm form) {
		UserEntity user = queryByMobile(form.getMobile());
		Assert.isNull(user, "手机号或密码错误");

		//密码错误
		if(!user.getPassword().equals(DigestUtils.sha256Hex(form.getPassword()))){
			throw new RRException("手机号或密码错误");
		}

		return user.getUid();
	}
	@Override
	public PageUtils queryPage(Map<String, Object> params) {
		IPage<UserEntity> page = this.page(
				new Query<UserEntity>().getPage(params),
				new QueryWrapper<UserEntity>()
		);

		return new PageUtils(page);
	}

	@Override
	public void addRecentHistory(Long userId, Long skuId) {
		ZSetOperations zSetOperations = redisTemplate.opsForZSet();
		zSetOperations.add(KEY_HISTORY + userId, skuId.toString(), System.currentTimeMillis());
		 //只保留8个历史记录
		zSetOperations.removeRange(KEY_HISTORY + userId, 0, -9);
	}

	@Override
	public  List<StoreProductEntity> getHistorySkuList(Long uid){
		List<Long> recentHistorySkuId = this.getRecentHistorySkuId(uid);
		if(recentHistorySkuId.size()>0){
			return productService.getBaseMapper().selectBatchIds(recentHistorySkuId);
		}else{
			return null;
		}


	}

	@Override
	public List<StoreProductEntity> getUserLike(Long uid) {

		List<StoreProductRelationEntity> like = relationService.getBaseMapper().selectList(
				new LambdaQueryWrapper<StoreProductRelationEntity>()
						.select(StoreProductRelationEntity::getProductId)
						.eq(StoreProductRelationEntity::getUid, uid)
						.eq(StoreProductRelationEntity::getType, "like")
		);
		List<Long> likeIds = like.stream()
				.map(StoreProductRelationEntity::getProductId)
				.collect(Collectors.toList());
		List<StoreProductEntity> productEntities = productService.getBaseMapper().selectBatchIds(likeIds);
		return productEntities;
	}

	@Override
	public List<StoreProductEntity> getUserCollect(Long uid) {
		List<StoreProductRelationEntity> collect = relationService.getBaseMapper().selectList(
				new LambdaQueryWrapper<StoreProductRelationEntity>()
						.select(StoreProductRelationEntity::getProductId)
						.eq(StoreProductRelationEntity::getUid, uid)
						.eq(StoreProductRelationEntity::getType, "collect")
		);
		List<Long> likeIds = collect.stream().map(StoreProductRelationEntity::getProductId).collect(Collectors.toList());
		List<StoreProductEntity> productEntities = productService.getBaseMapper().selectBatchIds(likeIds);
		return productEntities;
	}

	public List<Long> getRecentHistorySkuId(long userId) {
		if (userId <= 0) {
			return Collections.emptyList();
		}
		// 获取用户最近浏览的SkuId
		Set<String> skuIds = this.redisTemplate.opsForZSet().reverseRange(KEY_HISTORY + userId, 0, 7);
		List<Long> skuId = new ArrayList<>();
		skuIds.forEach(item -> {
			skuId.add(Long.valueOf(item));
		});
		return skuId;
	}

}
