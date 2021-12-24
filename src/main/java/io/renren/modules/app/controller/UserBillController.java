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

import io.renren.modules.app.entity.UserBillEntity;
import io.renren.modules.app.service.UserBillService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 用户账单表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/userbill")
public class UserBillController {
    @Autowired
    private UserBillService userBillService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:userbill:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userBillService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:userbill:info")
    public R info(@PathVariable("id") Long id){
		UserBillEntity userBill = userBillService.getById(id);

        return R.ok().put("userBill", userBill);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:userbill:save")
    public R save(@RequestBody UserBillEntity userBill){
		userBillService.save(userBill);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:userbill:update")
    public R update(@RequestBody UserBillEntity userBill){
		userBillService.updateById(userBill);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:userbill:delete")
    public R delete(@RequestBody Long[] ids){
		userBillService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
