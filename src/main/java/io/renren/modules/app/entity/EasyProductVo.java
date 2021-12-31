package io.renren.modules.app.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
public class EasyProductVo {
    @ExcelProperty(value = "商品名称",index = 0)
    String name;
    @ExcelProperty(value = "分类id",index = 1)
    String cateId;
    @ExcelProperty(value = "价格",index = 2)
    String price ;
    @ExcelProperty(value = "关键字",index = 3)
    String keyword;
    @ExcelProperty(value = "详细信息",index = 4)
    String info ;
    @ExcelProperty(value = "描述",index = 5)
    String description;
    @ExcelProperty(value = "图片地址",index = 6)
    String img ;

}
