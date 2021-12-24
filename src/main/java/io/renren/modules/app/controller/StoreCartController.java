package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.modules.app.annotation.Login;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.vo.CartVo;
import io.renren.modules.app.vo.addCartVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.app.entity.StoreCartEntity;
import io.renren.modules.app.service.StoreCartService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 购物车表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storecart")
public class StoreCartController {
    @Autowired
    private StoreCartService storeCartService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:storecart:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeCartService.queryPage(params);

        return R.ok().put("page", page);
    }


    @Login
    @RequestMapping("/getUserCart/{id}")
    @ApiOperation("获取用户购物车商品")
    public R list(@PathVariable("id") Long id){
        if(null==id){
            return R.error("请传用户id");
        }
        CartVo cartByUid = storeCartService.getCartByUid(id);
        return R.ok().put("data", cartByUid);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storecart:info")
    public R info(@PathVariable("id") Long id){
		StoreCartEntity storeCart = storeCartService.getById(id);

        return R.ok().put("storeCart", storeCart);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @ApiOperation("加入购物车")
    public R save(@RequestBody StoreCartEntity storeCart){
		storeCartService.save(storeCart);

        return R.ok();
    }
    /**
     * 购物车加数量
     */
//    @RequestMapping("/add")
//
//    public R save(@RequestBody addCartVo storeCart){
//        storeCartService.save(storeCart);
//
//        return R.ok();
//    }
    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storecart:update")
    public R update(@RequestBody StoreCartEntity storeCart){
		storeCartService.updateById(storeCart);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storecart:delete")
    public R delete(@RequestBody Long[] ids){
		storeCartService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
