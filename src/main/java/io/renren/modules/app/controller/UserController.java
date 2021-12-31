package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.modules.app.entity.StoreProductEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.app.entity.UserEntity;
import io.renren.modules.app.service.UserService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 用户表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:48:26
 */
@RestController
@RequestMapping("app/user")
@Api("用户管理接口")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:user:list")
//    @ApiOperation("获取用户列表")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{uid}")
    @RequiresPermissions("app:user:info")
    @ApiOperation(value = "获取用户信息",httpMethod = "GET")
    public R info(@PathVariable("uid") Long uid){
		UserEntity user = userService.getById(uid);

        return R.ok().put("user", user);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:user:save")
//    @ApiOperation("保存用户")
    public R save(@RequestBody UserEntity user){
		userService.save(user);

        return R.ok();
    }

    /**
     * 修改
     */
    @PostMapping("/update")

    @ApiOperation("更新用户")
    public R update(@RequestBody UserEntity user){
		userService.updateById(user);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:user:delete")
//    @ApiOperation("删除用户")
    public R delete(@RequestBody Long[] uids){
		userService.removeByIds(Arrays.asList(uids));
        return R.ok();
    }

    @GetMapping("/history/{uid}")
    @ApiOperation("查询历史记录")
    public R history(@PathVariable("uid") Long uid){
        List<StoreProductEntity> historySkuList = userService.getHistorySkuList(uid);

        return R.ok().put("user", historySkuList);
    }


    @PostMapping("/addHistory/{uid}")
    @ApiOperation("查询历史记录")
    public R addHistory(@PathVariable("uid") Long uid,@PathVariable("pid") Long pid){
        userService.addRecentHistory(uid,pid);
        return R.ok().put("data","添加成功");
    }


    @GetMapping("/like/{uid}")
    @ApiOperation("查询点赞商品")
    public R getUserLike(@PathVariable("uid") Long uid){
        List<StoreProductEntity> list = userService.getUserLike(uid);
        return R.ok().put("user", list);
    }

    @GetMapping("/collect/{uid}")
    @ApiOperation("查询收藏商品")
    public R getUserCollect(@PathVariable("uid") Long uid){
        List<StoreProductEntity> list = userService.getUserCollect(uid);
        return R.ok().put("user", list);
    }

}
