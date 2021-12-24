package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreCategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品分类表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface StoreCategoryService extends IService<StoreCategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<StoreCategoryEntity> queryAll();

    void saveByParentId(StoreCategoryEntity storeCategory);

    void fresh();

    void removeByIdsAll(List<Integer> asList);

}

