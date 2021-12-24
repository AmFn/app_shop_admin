package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.UserBillEntity;

import java.util.Map;

/**
 * 用户账单表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface UserBillService extends IService<UserBillEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

