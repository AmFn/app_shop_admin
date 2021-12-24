package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.app.entity.StoreSeckillEntity;
import io.renren.modules.app.service.StoreSeckillService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 商品秒杀产品表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storeseckill")
public class StoreSeckillController {
    @Autowired
    private StoreSeckillService storeSeckillService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("app:storeseckill:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = storeSeckillService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("app:storeseckill:info")
    public R info(@PathVariable("id") Long id){
		StoreSeckillEntity storeSeckill = storeSeckillService.getById(id);

        return R.ok().put("storeSeckill", storeSeckill);
    }


    @GetMapping("/kill")
    public String kill(@RequestParam("uid") Integer uid,
                       @RequestParam("addId") Integer addId,
                       @RequestParam("killId") String killId,

                       @RequestParam("num")Integer num,
                       Model model) {
        String orderSn= null;
        try {
            orderSn = storeSeckillService.kill(uid,addId,killId,  num);
            model.addAttribute("orderSn", orderSn);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "success";
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storeseckill:save")
    public R save(@RequestBody StoreSeckillEntity storeSeckill){
		storeSeckillService.save(storeSeckill);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storeseckill:update")
    public R update(@RequestBody StoreSeckillEntity storeSeckill){
		storeSeckillService.updateById(storeSeckill);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storeseckill:delete")
    public R delete(@RequestBody Long[] ids){
		storeSeckillService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }
    @RequestMapping("/close")
    @RequiresPermissions("app:storeseckill:update")
    public R close(@RequestBody Long id){
        storeSeckillService.close(id);
        return R.ok();
    }
    @RequestMapping("/open")
    @RequiresPermissions("app:storeseckill:update")
    public R open(@RequestBody Long id){
        storeSeckillService.open(id);
        return R.ok();
    }



}
