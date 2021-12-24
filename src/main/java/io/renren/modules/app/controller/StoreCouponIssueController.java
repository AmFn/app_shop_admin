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

import io.renren.modules.app.entity.StoreCouponIssueEntity;
import io.renren.modules.app.service.StoreCouponIssueService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 优惠券前台领取表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:05
 */
@RestController
@RequestMapping("app/storecouponissue")
public class StoreCouponIssueController {
    @Autowired
    private StoreCouponIssueService storeCouponIssueService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:storecouponissue:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeCouponIssueService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storecouponissue:info")
    public R info(@PathVariable("id") Integer id){
		StoreCouponIssueEntity storeCouponIssue = storeCouponIssueService.getById(id);

        return R.ok().put("storeCouponIssue", storeCouponIssue);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storecouponissue:save")
    public R save(@RequestBody StoreCouponIssueEntity storeCouponIssue){
		storeCouponIssueService.save(storeCouponIssue);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storecouponissue:update")
    public R update(@RequestBody StoreCouponIssueEntity storeCouponIssue){
		storeCouponIssueService.updateById(storeCouponIssue);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storecouponissue:delete")
    public R delete(@RequestBody Integer[] ids){
		storeCouponIssueService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
