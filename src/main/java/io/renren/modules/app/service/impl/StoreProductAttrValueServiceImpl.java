package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreProductAttrValueDao;
import io.renren.modules.app.entity.StoreProductAttrValueEntity;
import io.renren.modules.app.service.StoreProductAttrValueService;


@Service("storeProductAttrValueService")
public class StoreProductAttrValueServiceImpl extends ServiceImpl<StoreProductAttrValueDao, StoreProductAttrValueEntity> implements StoreProductAttrValueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreProductAttrValueEntity> page = this.page(
                new Query<StoreProductAttrValueEntity>().getPage(params),
                new QueryWrapper<StoreProductAttrValueEntity>()
        );

        return new PageUtils(page);
    }

}