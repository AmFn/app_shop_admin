package io.renren.modules.app.vo;




import lombok.Data;

import java.util.List;

@Data
public class OrderCountVo {

    private List<String> column;

    private List<OrderCountData> orderCountDatas;

    @Data
    public static class OrderCountData {
        private String name;

        private Integer value;
    }
}
