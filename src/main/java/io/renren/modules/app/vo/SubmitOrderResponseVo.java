package io.renren.modules.app.vo;

import io.renren.modules.app.entity.StoreOrderEntity;
import lombok.Data;

import java.util.List;

@Data
public class SubmitOrderResponseVo {

    private List<StoreOrderEntity> order;

    /** 错误状态码 **/
    private Integer code;
}