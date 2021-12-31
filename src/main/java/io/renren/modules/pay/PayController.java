package io.renren.modules.pay;

import com.alipay.api.AlipayApiException;
import io.renren.common.utils.R;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
@RestController
@RequestMapping("pay")
public class PayController {
    @Autowired
    PayService payService;


    @PostMapping(value = "/pay")
    @ApiOperation("支付接口")
    public R charge(@RequestBody PayVo payVo){
        //payDto就是你前端传过来的值,比如充值金额是多少 用户id是多少..
        //这个实体类根据你们自己的业务需求去写就好
        String orderString = payService.order(payVo);
        return R.ok().put("orderString",orderString);


        }

    /**
     * 支付宝支付成功后.异步请求该接口
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value="/aliNotify",method= RequestMethod.POST)
    @ResponseBody
    public String aliNotify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("=支付宝异步返回支付结果开始");
        //1.从支付宝回调的request域中取值
        //获取支付宝返回的参数集合
        Map<String, String[]> aliParams = request.getParameterMap();
        //用以存放转化后的参数集合
        Map<String, String> conversionParams = new HashMap<String, String>();
        for (Iterator<String> iter = aliParams.keySet().iterator(); iter.hasNext();) {
            String key = iter.next();
            String[] values = aliParams.get(key);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
            conversionParams.put(key, valueStr);
        }
        System.out.println("==返回参数集合："+conversionParams);
        String status=payService.aliNotify(conversionParams);
        return status;
    }


}
