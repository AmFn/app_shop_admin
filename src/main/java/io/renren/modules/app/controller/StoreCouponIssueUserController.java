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

import io.renren.modules.app.entity.StoreCouponIssueUserEntity;
import io.renren.modules.app.service.StoreCouponIssueUserService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 优惠券前台用户领取记录表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:06
 */
@RestController
@RequestMapping("app/storecouponissueuser")
public class StoreCouponIssueUserController {
    @Autowired
    private StoreCouponIssueUserService storeCouponIssueUserService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:storecouponissueuser:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeCouponIssueUserService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storecouponissueuser:info")
    public R info(@PathVariable("id") Long id){
		StoreCouponIssueUserEntity storeCouponIssueUser = storeCouponIssueUserService.getById(id);

        return R.ok().put("storeCouponIssueUser", storeCouponIssueUser);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storecouponissueuser:save")
    public R save(@RequestBody StoreCouponIssueUserEntity storeCouponIssueUser){
		storeCouponIssueUserService.save(storeCouponIssueUser);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storecouponissueuser:update")
    public R update(@RequestBody StoreCouponIssueUserEntity storeCouponIssueUser){
		storeCouponIssueUserService.updateById(storeCouponIssueUser);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storecouponissueuser:delete")
    public R delete(@RequestBody Long[] ids){
		storeCouponIssueUserService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
