package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.modules.app.entity.StoreProductAttrValueEntity;
import io.renren.modules.app.service.StoreCategoryService;
import io.renren.modules.app.service.StoreProductAttrValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreProductDao;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.service.StoreProductService;
import org.springframework.util.StringUtils;

@Service("storeProductService")
public class StoreProductServiceImpl extends ServiceImpl<StoreProductDao, StoreProductEntity> implements StoreProductService {
    @Autowired
    StoreProductAttrValueService productAttrValueService;
    @Autowired
    private StoreCategoryService categoryService;
    @CachePut(value = {"storeproduct"},key = "#root.method.name")
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<StoreProductEntity> wrapper = new QueryWrapper<>();
        String key = (String) params.get("key");
        if(!StringUtils.isEmpty(key)){
            wrapper.and((w)->{
                w.eq("keyword",key).or().like("keyword",key);
            });
        }
        IPage<StoreProductEntity> page = this.page(
                new Query<StoreProductEntity>().getPage(params),
                wrapper
        );



        page.getRecords().forEach(storeProductEntity -> storeProductEntity.setCategory(categoryService.getById(storeProductEntity.getCateId())));




        return new PageUtils(page);
    }

    @Override
    public List<StoreProductEntity> getProductsInCategory(Long cid) {
        if(null==cid){
            return baseMapper.selectList(new LambdaQueryWrapper<StoreProductEntity>()
                    .eq(StoreProductEntity::getCateId, cid));
        }else {
            return null;
        }

    }

    @Override
    public Integer getCountByCategoryId(Long cid) {

        Integer integer = baseMapper.selectCount(
                new QueryWrapper<StoreProductEntity>()
                        .select("id")
                .eq("cate_id",cid)
        );
        return integer;
    }

    @Override
    public List<StoreProductAttrValueEntity> getSkuById(Long id) {
        List<StoreProductAttrValueEntity> storeProductAttrValueEntities = productAttrValueService.getBaseMapper().selectList(
                new LambdaQueryWrapper<StoreProductAttrValueEntity>()
                        .eq(StoreProductAttrValueEntity::getProductId, id)
        );
        return storeProductAttrValueEntities;
    }
}