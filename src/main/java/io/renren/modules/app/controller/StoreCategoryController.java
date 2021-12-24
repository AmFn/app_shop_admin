package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.app.entity.StoreCategoryEntity;
import io.renren.modules.app.service.StoreCategoryService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 商品分类表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storecategory")
public class StoreCategoryController {
    @Autowired
    private StoreCategoryService storeCategoryService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeCategoryService.queryPage(params);

        return R.ok().put("page", page);
    }

    @ApiOperation(value = "查询商品分类")
    @GetMapping(value = "/categoryTree")
    @Cacheable(value = {"storeCategory"},key = "#root.method.name")
    public R getStoreCategorys() {

        List<StoreCategoryEntity> categorylist = storeCategoryService.queryAll();
        return R.ok().put("categorylist", categorylist);
    }
    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		StoreCategoryEntity storeCategory = storeCategoryService.getById(id);
        return R.ok().put("storeCategory", storeCategory);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storecategory:save")
    public R save(@RequestBody StoreCategoryEntity storeCategory){
		storeCategoryService.saveByParentId(storeCategory);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storecategory:update")
    public R update(@RequestBody StoreCategoryEntity storeCategory){
		storeCategoryService.updateById(storeCategory);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storecategory:delete")
    @CacheEvict(value = {"storeCategory"},allEntries = true)
    public R delete(@RequestBody Integer[] ids){
		storeCategoryService.removeByIdsAll(Arrays.asList(ids));

        return R.ok();
    }

    /**
     * 刷新
     */
    @RequestMapping("/fresh")
    public R fresh(){
        storeCategoryService.fresh();

        return R.ok();
    }

}
