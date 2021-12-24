package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreCouponIssueEntity;

import java.util.Map;

/**
 * 优惠券前台领取表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:05
 */
public interface StoreCouponIssueService extends IService<StoreCouponIssueEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

