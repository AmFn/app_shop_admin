package io.renren.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreCategoryEntity;
import io.renren.modules.app.entity.StoreOrderEntity;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.service.*;
import io.renren.modules.app.vo.CreateOrderVo;
import io.renren.modules.app.vo.IntegralSettingVo;
import io.renren.modules.sys.entity.SysConfigEntity;
import io.renren.modules.sys.service.SysConfigService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.junit.Test;

import javax.security.auth.login.Configuration;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Test1 {
    @Autowired
    UserSignService signService;
    @Autowired
    SysConfigService configService;
    @Autowired
    StoreProductService productService;
    @Autowired
    StoreOrderService orderService;
    @Autowired
    UserService userService;
    @Autowired
    StoreCategoryService categoryService;
    @Autowired
    UserAddressService addressService;
    @Test
    public  void testSetting(){

        IntegralSettingVo vo = new IntegralSettingVo();
        vo.setMax(0);
        vo.setProportion(1);
        vo.setReach(0);
        signService.setIntegral(vo);
        List<SysConfigEntity> list = configService.list();
        list.forEach(System.out::println);

    }

    @Test
    public  void configObj(){
        SysConfigEntity sysConfigEntity = configService.getOne(new QueryWrapper<SysConfigEntity>().eq("param_key", "max"));
        System.out.println(sysConfigEntity);
    }
    @Autowired
    StoreProductAttrValueService storeProductAttrValueService;
    @Test
    public  void testSKU(){
        PageUtils pageUtils = storeProductAttrValueService.queryPage(new HashMap<>());
        pageUtils.getList().forEach(System.out::println);

    }
    @Test
    public  void testget(){
        BigDecimal price = productService.getById(1).getPrice();
        System.out.println(price.toString());

    }
    @Test
    public  void testOrder(){
        StoreProductEntity pro = productService.getById(1);
        CreateOrderVo createOrderVo = new CreateOrderVo();
        createOrderVo.setProduct(pro);
        createOrderVo.setUid(2);
        createOrderVo.setAddress(addressService.getById(1));
        createOrderVo.setNum(2);
        orderService.create(createOrderVo);

    }

    @Test
    public  void testOrderData(){
        Map<String, Object> map = orderService.chartCount();
        map.forEach((k,v)-> System.out.println("key : " + k + " value : " + v));

    }

    @Test
    public void getChild(){
        List<StoreCategoryEntity> categoryEntities = categoryService.queryAll();
        categoryEntities.forEach(System.out::println);

    }
    @Test
    public void getSum(){
        Map<String, Object> map = orderService.getMap(new QueryWrapper<StoreOrderEntity>().select("ifnull(sum(pay_price),0) as total"));
        System.out.println(map.toString());
    }
}
