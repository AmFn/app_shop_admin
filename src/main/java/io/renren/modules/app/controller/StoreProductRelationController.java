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

import io.renren.modules.app.entity.StoreProductRelationEntity;
import io.renren.modules.app.service.StoreProductRelationService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 商品点赞和收藏表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storeproductrelation")
public class StoreProductRelationController {
    @Autowired
    private StoreProductRelationService storeProductRelationService;

    /**
     * 列表
     */
    @RequestMapping("/list")
//    @RequiresPermissions("app:storeproductrelation:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeProductRelationService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storeproductrelation:info")
    public R info(@PathVariable("id") Long id){
		StoreProductRelationEntity storeProductRelation = storeProductRelationService.getById(id);

        return R.ok().put("storeProductRelation", storeProductRelation);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storeproductrelation:save")
    public R save(@RequestBody StoreProductRelationEntity storeProductRelation){
		storeProductRelationService.save(storeProductRelation);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storeproductrelation:update")
    public R update(@RequestBody StoreProductRelationEntity storeProductRelation){
		storeProductRelationService.updateById(storeProductRelation);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storeproductrelation:delete")
    public R delete(@RequestBody Long[] ids){
		storeProductRelationService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
