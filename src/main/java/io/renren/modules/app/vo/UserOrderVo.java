package io.renren.modules.app.vo;

import lombok.Data;

@Data
public class UserOrderVo {
    private  String oid;
    private Integer status;
    private  Long cid;
    private  Long uid;
    private  Long pid;
    private  String storeName;
    private  Integer num;
    private  String image;
    private  Double totalPrice;
}
