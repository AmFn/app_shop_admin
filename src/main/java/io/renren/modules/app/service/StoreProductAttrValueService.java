package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreProductAttrValueEntity;

import java.util.Map;

/**
 * 商品属性值表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface StoreProductAttrValueService extends IService<StoreProductAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

