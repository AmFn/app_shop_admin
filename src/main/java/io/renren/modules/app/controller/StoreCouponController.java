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

import io.renren.modules.app.entity.StoreCouponEntity;
import io.renren.modules.app.service.StoreCouponService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 优惠券表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storecoupon")
public class StoreCouponController {
    @Autowired
    private StoreCouponService storeCouponService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:storecoupon:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeCouponService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storecoupon:info")
    public R info(@PathVariable("id") Integer id){
		StoreCouponEntity storeCoupon = storeCouponService.getById(id);

        return R.ok().put("storeCoupon", storeCoupon);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storecoupon:save")
    public R save(@RequestBody StoreCouponEntity storeCoupon){
		storeCouponService.save(storeCoupon);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storecoupon:update")
    public R update(@RequestBody StoreCouponEntity storeCoupon){
		storeCouponService.updateById(storeCoupon);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storecoupon:delete")
    public R delete(@RequestBody Integer[] ids){
		storeCouponService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
