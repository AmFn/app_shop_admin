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

import io.renren.modules.app.entity.StoreProductReplyEntity;
import io.renren.modules.app.service.StoreProductReplyService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 评论表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storeproductreply")
public class StoreProductReplyController {
    @Autowired
    private StoreProductReplyService storeProductReplyService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeProductReplyService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storeproductreply:info")
    public R info(@PathVariable("id") Long id){
		StoreProductReplyEntity storeProductReply = storeProductReplyService.getById(id);

        return R.ok().put("storeProductReply", storeProductReply);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storeproductreply:save")
    public R save(@RequestBody StoreProductReplyEntity storeProductReply){
		storeProductReplyService.save(storeProductReply);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storeproductreply:update")
    public R update(@RequestBody StoreProductReplyEntity storeProductReply){
		storeProductReplyService.updateById(storeProductReply);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storeproductreply:delete")
    public R delete(@RequestBody Long[] ids){
		storeProductReplyService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
