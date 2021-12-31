package io.renren.service;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.app.entity.EasyProductVo;
import io.renren.modules.app.entity.StoreOrderEntity;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.service.StoreProductService;
import io.swagger.annotations.ApiOperation;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
@RunWith(SpringRunner.class)
@SpringBootTest
public class Insert {
    @Autowired
    StoreProductService productService;
    @Test
    public  void  insertProduct(){

        List<EasyProductVo> voList = getVoList();
        voList.forEach(p->{
            StoreProductEntity product = createProduct(p);
            productService.getBaseMapper().insert(product);
        });
    }

    public List<EasyProductVo> getVoList(){
        String fileName = "src\\test\\java\\io\\renren\\service\\product.xlsx";
        ExcelListener listener =   new ExcelListener();
        EasyExcel.read(fileName,EasyProductVo.class,listener).sheet().doRead();
       return  listener.getList();

    }
    public StoreProductEntity createProduct(EasyProductVo easyProductVo){
         String name  = easyProductVo.getName();
         String cateId = easyProductVo.getCateId();
         String price = easyProductVo.getPrice();
         String keyword = easyProductVo.getKeyword();
         String info = easyProductVo.getInfo();
         String description = easyProductVo.getDescription();
         String img = easyProductVo.getImg();


        StoreProductEntity storeProductEntity = new StoreProductEntity();
        storeProductEntity.setCateId(cateId);
        storeProductEntity.setSliderImage(img);
        storeProductEntity.setCost(new BigDecimal(price).subtract(new BigDecimal(20)));
        storeProductEntity.setImage(img);
        storeProductEntity.setFicti(0);
        storeProductEntity.setIsDel(1);
        storeProductEntity.setIsGood(1);
        storeProductEntity.setIsHot(1);
        storeProductEntity.setIsShow(1);
        storeProductEntity.setIsBenefit(1);
        storeProductEntity.setIsBest(1);
        storeProductEntity.setIsNew(1);
        storeProductEntity.setDescription(description);
        storeProductEntity.setPrice(new BigDecimal(price));
        storeProductEntity.setVipPrice(new BigDecimal(price).subtract(new BigDecimal(10)));
        storeProductEntity.setPostage(new BigDecimal(0));
        storeProductEntity.setKeyword(keyword);
        storeProductEntity.setStoreName(name);
        storeProductEntity.setStoreInfo(info);
        storeProductEntity.setIsPostage(1);
        storeProductEntity.setOtPrice(new BigDecimal(price));
        storeProductEntity.setStock((int)(1+Math.random()*(100-10+1)));
        System.out.println(storeProductEntity.toString());

        storeProductEntity.setGiveIntegral(new BigDecimal(10));
        storeProductEntity.setBrowse(1);
//        productService.getBaseMapper().insert(storeProductEntity);
//        System.out.println(storeProductEntity.toString());
        return storeProductEntity;

    }
}
