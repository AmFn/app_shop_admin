package io.renren.modules.app.vo;

import io.renren.modules.app.entity.StoreCartEntity;
import io.renren.modules.app.entity.StoreCouponEntity;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.entity.UserAddressEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class CreateOrderVo {
    private  long uid;
    private List<StoreCartEntity> products;
    private StoreProductEntity product;
    private UserAddressEntity address;
    private StoreCouponEntity coupon;
    private  BigDecimal integral;
    private  Integer num;
    private  boolean isSecKill;

}
