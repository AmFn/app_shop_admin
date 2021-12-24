package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.modules.app.vo.IntegralSettingVo;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.app.entity.UserSignEntity;
import io.renren.modules.app.service.UserSignService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.http.HttpServletResponse;

/**
 * 签到记录表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/usersign")

public class UserSignController {
    @Autowired
    private UserSignService userSignService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:usersign:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userSignService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:usersign:info")
    public R info(@PathVariable("id") Long id){
		UserSignEntity userSign = userSignService.getById(id);

        return R.ok().put("userSign", userSign);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:usersign:save")
    public R save(@RequestBody UserSignEntity userSign){
		userSignService.save(userSign);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:usersign:update")
    public R update(@RequestBody UserSignEntity userSign){
		userSignService.updateById(userSign);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:usersign:delete")
    public R delete(@RequestBody Long[] ints){
		userSignService.removeByIds(Arrays.asList(ints));

        return R.ok();
    }
    @RequestMapping("/setting")
//    @RequiresPermissions("app:usersign:update")
    @ApiOperation("设置积分")

    public R setting(@RequestBody IntegralSettingVo settingVo){

        userSignService.setIntegral(settingVo);

        return R.ok();
    }


}
