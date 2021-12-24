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

import io.renren.modules.app.entity.StoreCouponUserEntity;
import io.renren.modules.app.service.StoreCouponUserService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 优惠券发放记录表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:06
 */
@RestController
@RequestMapping("app/storecouponuser")
public class StoreCouponUserController {
    @Autowired
    private StoreCouponUserService storeCouponUserService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:storecouponuser:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeCouponUserService.queryPage(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storecouponuser:info")
    public R info(@PathVariable("id") Long id){
		StoreCouponUserEntity storeCouponUser = storeCouponUserService.getById(id);

        return R.ok().put("storeCouponUser", storeCouponUser);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storecouponuser:save")
    public R save(@RequestBody StoreCouponUserEntity storeCouponUser){
		storeCouponUserService.save(storeCouponUser);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storecouponuser:update")
    public R update(@RequestBody StoreCouponUserEntity storeCouponUser){
		storeCouponUserService.updateById(storeCouponUser);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storecouponuser:delete")
    public R delete(@RequestBody Long[] ids){
		storeCouponUserService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
