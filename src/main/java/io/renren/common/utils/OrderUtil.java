package io.renren.common.utils;

import cn.hutool.core.date.DateTime;

public class OrderUtil {
    /**
     * 获取精确到秒的时间戳
     *
     * @return
     **/
    public static int dateToTimestampT(DateTime date) {
        String timestamp = String.valueOf(date.getTime() / 1000);
        return Integer.valueOf(timestamp);
    }
}
