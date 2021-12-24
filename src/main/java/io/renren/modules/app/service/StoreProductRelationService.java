package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreProductRelationEntity;

import java.util.Map;

/**
 * 商品点赞和收藏表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface StoreProductRelationService extends IService<StoreProductRelationEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

