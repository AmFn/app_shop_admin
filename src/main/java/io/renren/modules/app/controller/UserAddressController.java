package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.app.entity.UserAddressEntity;
import io.renren.modules.app.service.UserAddressService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 用户地址表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/useraddress")
public class UserAddressController {
    @Autowired
    private UserAddressService userAddressService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:useraddress:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userAddressService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:useraddress:info")
    public R info(@PathVariable("id") Long id){
		UserAddressEntity userAddress = userAddressService.getById(id);

        return R.ok().put("userAddress", userAddress);
    }

    @GetMapping("/getUserAddr/{uid}")
    @ApiOperation("获取用户地址")
    public R getUserAddr(@PathVariable("uid") Long uid){
        UserAddressEntity userAddress = userAddressService.getUserAddr(uid);

        return R.ok().put("userAddress", userAddress);
    }

    @PostMapping("/saveAddr")
    @ApiOperation("保存收获地址")
    public R saveAddr(@RequestBody UserAddressEntity userAddress){
        userAddressService.save(userAddress);

        return R.ok();
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:useraddress:save")
    public R save(@RequestBody UserAddressEntity userAddress){
		userAddressService.save(userAddress);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:useraddress:update")
    public R update(@RequestBody UserAddressEntity userAddress){
		userAddressService.updateById(userAddress);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:useraddress:delete")
    public R delete(@RequestBody Long[] ids){
		userAddressService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
