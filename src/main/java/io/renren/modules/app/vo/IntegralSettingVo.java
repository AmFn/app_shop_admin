package io.renren.modules.app.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class IntegralSettingVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private  int proportion;
    private  int reach;
    private  int max;
}
