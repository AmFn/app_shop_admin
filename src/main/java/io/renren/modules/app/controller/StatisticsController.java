package io.renren.modules.app.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.app.service.StoreCategoryService;
import io.renren.modules.app.service.StoreOrderService;
import io.renren.modules.app.service.StoreProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Locale;
import java.util.Map;
@RestController
@RequestMapping("app/orderdata")
public class StatisticsController {


    @Autowired
    StoreOrderService orderService;
    @Autowired
    StoreProductService productService;
    @Autowired
    StoreCategoryService categoryService;
    @RequestMapping("/orderData")
    public R orderData(){
        Map<String, Object> map = orderService.chartCount();
        return R.ok().put("data",map);
    }

    @RequestMapping("/cateCount")
    public R cateCount(){
        Map<String, Object> map = orderService.cateCount();
        return R.ok().put("data",map);
    }

    @RequestMapping("/count")
    public R count(){
        Map<String, Object> map = orderService.dataCount();
        return R.ok().put("data",map);
    }
}
