package io.renren.modules.app.vo;

import io.renren.modules.app.entity.StoreProductEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
@Data
public class CartVo {
    BigDecimal totalPrice;
    List<CartProductNumVo> cartProductNumVos;
}
