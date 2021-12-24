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

import io.renren.modules.app.entity.ExpressEntity;
import io.renren.modules.app.service.ExpressService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 快递公司表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/express")
public class ExpressController {
    @Autowired
    private ExpressService expressService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = expressService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:express:info")
    public R info(@PathVariable("id") Integer id){
		ExpressEntity express = expressService.getById(id);

        return R.ok().put("express", express);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:express:save")
    public R save(@RequestBody ExpressEntity express){
		expressService.save(express);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:express:update")
    public R update(@RequestBody ExpressEntity express){
		expressService.updateById(express);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:express:delete")
    public R delete(@RequestBody Integer[] ids){
		expressService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
