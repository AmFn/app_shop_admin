package io.renren.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.app.entity.StoreOrderEntity;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.service.StoreProductService;
import io.swagger.annotations.ApiOperation;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Map;
@RunWith(SpringRunner.class)
@SpringBootTest
public class Insert {
    @Autowired
    StoreProductService productService;
    @Test
    public void insertProduct(){

//        StoreProductEntity storeProductEntity = new StoreProductEntity();
//        storeProductEntity.setCategory();
//
//        storeProductEntity.setCost();
//        storeProductEntity.setFicti();
//        storeProductEntity.setIsDel();
//        storeProductEntity.setIsGood();
//
//        storeProductEntity.setVipPrice();
//        storeProductEntity.setPostage();
//        storeProductEntity.setKeyword();
//        storeProductEntity.setStoreName();
//        storeProductEntity.setStoreInfo();
//        storeProductEntity.setOtPrice();
//        storeProductEntity.setStock();


    }
}
