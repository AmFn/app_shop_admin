package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreCouponIssueUserEntity;

import java.util.Map;

/**
 * 优惠券前台用户领取记录表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:06
 */
public interface StoreCouponIssueUserService extends IService<StoreCouponIssueUserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

