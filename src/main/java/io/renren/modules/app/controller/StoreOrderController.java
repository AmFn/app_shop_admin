package io.renren.modules.app.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.modules.app.vo.*;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.app.entity.StoreOrderEntity;
import io.renren.modules.app.service.StoreOrderService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 订单表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@RestController
@RequestMapping("app/storeorder")
public class StoreOrderController {
    @Autowired
    private StoreOrderService storeOrderService;

    /**
     * 列表
     */
    @RequestMapping("/list")
//    @RequiresPermissions("app:storeorder:list")
    public R list(@RequestParam Map<String, Object> params){
//        PageUtils page = storeOrderService.queryPage(params);
        PageUtils page = storeOrderService.queryPageByCondition(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
//    @RequiresPermissions("app:storeorder:info")
    public R info(@PathVariable("id") Long id){
		StoreOrderEntity storeOrder = storeOrderService.getById(id);

        return R.ok().put("storeOrder", storeOrder);
    }

    @GetMapping("/getUserOrder{uid}")
    @ApiOperation("获取用户所有订单")
    public R getUserOrder(@PathVariable("uid") Long uid){
        List<UserOrderVo> list = storeOrderService.getByUSerID(uid);
        return R.ok().put("storeOrder", list);
    }

    @PostMapping("/create")
    @ApiOperation("创建订单")
    public R create(@RequestBody CreateOrderVo createOrderVo){
        SubmitOrderResponseVo orderResponseVo = storeOrderService.create(createOrderVo);

        return R.ok();
    }



    @RequestMapping("/delivery")
//    @ApiOperation("发货")
    public R delivery(@RequestBody DeliveryVo deliveryVo){ ;

        storeOrderService.delivery(deliveryVo);
        return R.ok();
    }

    /**@Valid
     * 根据商品分类统计订单占比
     */
    @GetMapping("/orderCount")
    @ApiOperation(value = "根据商品分类统计订单占比")
    public R orderCount() {
        OrderCountVo orderCountDto = storeOrderService.getOrderCount();
        return R.ok().put("data",orderCountDto);
    }
    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("app:storeorder:save")
    public R save(@RequestBody StoreOrderEntity storeOrder){
		storeOrderService.save(storeOrder);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("app:storeorder:update")
    public R update(@RequestBody StoreOrderEntity storeOrder){
		storeOrderService.updateById(storeOrder);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("app:storeorder:delete")
    public R delete(@RequestBody Long[] ids){
		storeOrderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
