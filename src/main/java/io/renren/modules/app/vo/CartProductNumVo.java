package io.renren.modules.app.vo;

import io.renren.modules.app.entity.StoreProductEntity;
import lombok.Data;

@Data
public class CartProductNumVo {
    StoreProductEntity productEntity;
    Integer num;
}
