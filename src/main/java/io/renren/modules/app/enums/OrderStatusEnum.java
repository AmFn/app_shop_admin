package io.renren.modules.app.enums;

public enum OrderStatusEnum {

    CREATE_NEW(0,"待付款"),
    PAYED(1,"已付款"),
    SENDED(2,"已发货"),
    EVALUATE(3,"待评价"),
    RECIEVED(4,"已完成"),
    CANCLED(-1,"申请退款"),
    CANCLED_OK(-2,"退款完成");


    private String msg;
    private Integer code;

    public String getMsg() {
        return msg;
    }

    public Integer getCode() {
        return code;
    }

    OrderStatusEnum(Integer code, String msg){
        this.msg = msg;
        this.code = code;
    }
}