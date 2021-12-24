package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.swagger.models.auth.In;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreCategoryDao;
import io.renren.modules.app.entity.StoreCategoryEntity;
import io.renren.modules.app.service.StoreCategoryService;


@Service("storeCategoryService")
public class StoreCategoryServiceImpl extends ServiceImpl<StoreCategoryDao, StoreCategoryEntity> implements StoreCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreCategoryEntity> page = this.page(
                new Query<StoreCategoryEntity>().getPage(params),
                new QueryWrapper<StoreCategoryEntity>()
        );

        return new PageUtils(page);
    }

    @Override
//    @Cacheable(value= {"storeCategory"},key = "#root.method.name")
    public List<StoreCategoryEntity> queryAll() {
        return listWithTree();

    }

    @Override
    @CacheEvict(value = {"storeCategory"},allEntries = true)
    public void saveByParentId(StoreCategoryEntity storeCategory) {
        baseMapper.insert(storeCategory);
    }


    @Override
    @CacheEvict(value = {"storeCategory"},allEntries = true)
    public void fresh() {
        System.out.println("fresh");
    }

    @Override
    public void removeByIdsAll(List<Integer> asList) {
        asList.stream().forEach(id->{
            removeChildren(id);
            baseMapper.deleteById(id);
        });
    }
    public void removeChildren(Integer id){
        LambdaQueryWrapper<StoreCategoryEntity> wrapper = new LambdaQueryWrapper<StoreCategoryEntity>().eq(StoreCategoryEntity::getPid, id);
        baseMapper.delete(wrapper);
    }
    public List<StoreCategoryEntity> listWithTree() {
        //所有分类数据
        List<StoreCategoryEntity> categories = baseMapper.selectList(null);
        return categories.stream()
                .filter(o -> o.getPid() == 0)
                .peek(o -> o.setChildrens(getChildCategoryList(o, categories)))
                .sorted(Comparator.comparingInt(StoreCategoryEntity::getSort))
                .collect(Collectors.toList());
    }

    // 递归找出子类的子类
    private List<StoreCategoryEntity> getChildCategoryList(StoreCategoryEntity currMenu, List<StoreCategoryEntity> categories) {
        return categories.stream().filter(o -> o.getPid().equals(currMenu.getId()))
                .peek(o -> o.setChildrens(getChildCategoryList(o, categories)))
                .sorted(Comparator.comparingInt(StoreCategoryEntity::getSort))
                .collect(Collectors.toList());
    }

}