package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.modules.app.entity.StoreProductAttrValueEntity;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.service.StoreProductService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 商品表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storeproduct")
@Api("商品管理接口")
public class StoreProductController {
    @Autowired
    private StoreProductService storeProductService;
    @GetMapping("/list")
    @ApiOperation("获取商品列表")
//    @RequiresPermissions("app:storeproduct:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeProductService.queryPage(params);
        return R.ok().put("page", page);
    }



    @GetMapping("/getByCategoryId/{cid}")
    @ApiOperation("获取分类数据下的商品")
    public R getProductsInCategory(@PathVariable("cid") Long cid){
       List<StoreProductEntity> productEntities = storeProductService.getProductsInCategory(cid);
        return R.ok().put("products",productEntities);
    }
    @GetMapping("/sku/{id}")
    public R infoWithSku(@PathVariable("id") Long id){
        List<StoreProductAttrValueEntity> skuById = storeProductService.getSkuById(id);
        return R.ok().put("sku", skuById);
    }
    /**
     * 信息
     */


    @GetMapping("/info/{id}")
//    @RequiresPermissions("app:storeproduct:info")
    @ApiOperation("获取商品详情")
    public R info(@PathVariable("id") Long id){
		StoreProductEntity storeProduct = storeProductService.getById(id);

        return R.ok().put("storeProduct", storeProduct);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @RequiresPermissions("app:storeproduct:save")

    @ApiOperation("保存商品")
    @CacheEvict ( value = {"storeproduct"},allEntries = true)
    public R save(@RequestBody StoreProductEntity storeProduct){
		storeProductService.save(storeProduct);

        return R.ok();
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    @RequiresPermissions("app:storeproduct:update")
    @ApiOperation("更新商品")
    @CacheEvict ( value = {"storeproduct"},allEntries = true)
    public R update(@RequestBody StoreProductEntity storeProduct){
		storeProductService.updateById(storeProduct);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    @RequiresPermissions("app:storeproduct:delete")
    @ApiOperation("删除商品")
    @CacheEvict ( value = {"storeproduct"},allEntries = true)
    public R delete(@RequestBody Long[] ids){
		storeProductService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
