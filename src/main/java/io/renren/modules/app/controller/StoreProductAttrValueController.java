package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.app.entity.StoreProductAttrValueEntity;
import io.renren.modules.app.service.StoreProductAttrValueService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 商品属性值表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storeproductattrvalue")
public class StoreProductAttrValueController {
    @Autowired
    private StoreProductAttrValueService storeProductAttrValueService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:storeproductattrvalue:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeProductAttrValueService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storeproductattrvalue:info")
    public R info(@PathVariable("id") Long id){
		StoreProductAttrValueEntity storeProductAttrValue = storeProductAttrValueService.getById(id);

        return R.ok().put("storeProductAttrValue", storeProductAttrValue);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storeproductattrvalue:save")
    public R save(@RequestBody StoreProductAttrValueEntity storeProductAttrValue){
		storeProductAttrValueService.save(storeProductAttrValue);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storeproductattrvalue:update")
    public R update(@RequestBody StoreProductAttrValueEntity storeProductAttrValue){
		storeProductAttrValueService.updateById(storeProductAttrValue);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storeproductattrvalue:delete")
    public R delete(@RequestBody Long[] ids){
		storeProductAttrValueService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
