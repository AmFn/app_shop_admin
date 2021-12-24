package io.renren.service;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.annotation.TableLogic;
import io.renren.common.utils.OrderUtil;
import org.junit.Test;

import java.util.Date;

public class CreateStr {
    @Test
    public  void   create(){
        String s= "storecouponissue";
        String name = "app:str:list,app:str:info,app:str:update,app:str:save,app:str:delete";
        System.out.println(name.replace("str",s));

    }


    @Test
    public  void   print(){
        int nowMonth = OrderUtil.dateToTimestampT(DateUtil
                .beginOfMonth(new Date()));
        System.out.println(nowMonth);

    }
}
