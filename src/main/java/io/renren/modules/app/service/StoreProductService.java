package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreProductEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface StoreProductService extends IService<StoreProductEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<StoreProductEntity> getProductsInCategory(Long cid);

    Integer getCountByCategoryId(Long cid);
}

