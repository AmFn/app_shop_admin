package io.renren.service;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import io.renren.modules.app.entity.EasyProductVo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ExcelListener extends AnalysisEventListener<EasyProductVo> {
    //创建list集合封装最终的数据
    List<EasyProductVo> list = new ArrayList<>();
    //一行一行去读取excle内容
    @Override
    public void invoke(EasyProductVo data, AnalysisContext analysisContext) {
        list.add(data);
    }
    //读取excel表头信息
    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
        System.out.println("表头信息："+headMap);
    }
    //读取完成后执行
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
//        System.out.println(list.toString());

    }


    public List<EasyProductVo> getList() {
        return list;
    }
}
