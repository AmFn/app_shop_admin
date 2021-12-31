package io.renren.modules.pay;

import cn.hutool.log.Log;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service("PayService")
public class PayServiceImpl implements PayService {


    @Override
    public String order(PayVo payVo) {
        //这里你可以做一些存表操作..具体根据你们自己的业务来操作...
        String orderString = "";//这个字符串是用来返回给前端的
        String orderNo = IdWorker.getIdStr();//这行代码是生成一个商户的订单号..根据你们自己的业务需求去生成就可以了..
        System.out.println("==================支付宝下单,商户订单号为：" + orderNo);
        try {
            AppPayConfig appPayConfig = new AppPayConfig(); //实例化上面的那个配置类..
            //实例化客户端（参数：网关地址、商户appid、商户私钥、格式、编码、支付宝公钥、加密类型），为了取得预付订单信息
            AlipayClient alipayClient = new DefaultAlipayClient(AppPayConfig.URL, appPayConfig.getAPPID(),
                    AppPayConfig.RSA_PRIVATE_KEY, AppPayConfig.FORMAT, AppPayConfig.CHARSET,
                    AppPayConfig.ALIPAY_PUBLIC_KEY, AppPayConfig.SIGNTYPE);
            //实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
            AlipayTradeAppPayRequest ali_request = new AlipayTradeAppPayRequest();
            //SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式
            AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
            //业务参数传入,可以传很多，参考API
            //model.setPassbackParams(URLEncoder.encode(request.getBody().toString())); //公用参数（附加数据）
            //对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。
            model.setBody("具体描述信息.例如QQ币充值");
            //商品名称
            model.setSubject("例:QQ币");
            //商户订单号(根据业务需求自己生成)
            model.setOutTradeNo(orderNo);
            //交易超时时间 这里的30m就是30分钟
            model.setTimeoutExpress("30m");
            //支付金额 后面保留2位小数点..不能超过2位
            model.setTotalAmount("10.00");
            //销售产品码（固定值） //这个不做多解释..看文档api接口参数解释
            model.setProductCode("QUICK_MSECURITY_PAY");
            ali_request.setBizModel(model);
            //异步回调地址（后台）//这里我在上面的aliPayConfig有讲..自己去看
            ali_request.setNotifyUrl(AppPayConfig.notify_url);
            System.out.println("====================异步通知的地址为：" + ali_request.getNotifyUrl());
            //同步回调地址（APP）同上
            ali_request.setReturnUrl(AppPayConfig.return_url);
            System.out.println("====================同步通知的地址为：" + ali_request.getReturnUrl());
            // 这里和普通的接口调用不同，使用的是sdkExecute
            //返回支付宝订单信息(预处理)
            AlipayTradeAppPayResponse alipayTradeAppPayResponse = alipayClient.sdkExecute(ali_request);
            //就是orderString 可以直接给APP请求，无需再做处理。
            orderString = alipayTradeAppPayResponse.getBody();
            System.out.println(orderString);
        } catch (AlipayApiException e) {
            e.printStackTrace();
            System.out.println("与支付宝交互出错，未能生成订单，请检查代码！");
        }
        return orderString;
    }

    /**
     * 支付宝异步请求逻辑处理
     *

     */
    @Override
    public String aliNotify(Map<String, String> conversionParams) {
        Logger log = LoggerFactory.getLogger("test");
        log.info("=支付宝异步请求逻辑处理=");
        //签名验证(对支付宝返回的数据验证，确定是支付宝返回的)
        boolean signVerified = false;
        try {
            //调用SDK验证签名
            String alipayPublicKey = AppPayConfig.ALIPAY_PUBLIC_KEY;
            String charset = AppPayConfig.CHARSET;
            String signType = AppPayConfig.SIGNTYPE;
            signVerified = AlipaySignature.rsaCheckV1(conversionParams, alipayPublicKey, charset, signType);
            if (signVerified) {
                log.info("+支付宝回调签名认证成功+");
                // 按照支付结果异步通知中的描述，对支付结果中的业务内容进行1\2\3\4二次校验，校验成功后在response中返回success，校验失败返回failure 支付宝官方建议校验的值（out_trade_no、total_amount、sellerId、app_id）
//                this.check(conversionParams);
                //验签通过 获取交易状态
                String tradeStatus = conversionParams.get("trade_status");
                //只处理支付成功的订单: 修改交易表状态,支付成功
                //只有交易通知状态为TRADE_SUCCESS或TRADE_FINISHED时，支付宝才会认定为买家付款成功。
                if (tradeStatus.equals("TRADE_SUCCESS") || tradeStatus.equals("TRADE_FINISHED")) {
                    //TODO 获取支付宝通知完成充值后续业务
                    //交易成功 获取商户订单号
                    /**修改订单信息*/
                    /**余额到账*/
                    //这里就主要是做你们自己的业务需求了,修改一些表什么的..

                return "success";
            } else {
                return "fail";
            }
        } else {
                log.info("++验签不通过 ！++");
                return "fail";
            }//验签不通过


    } catch(AlipayApiException e)

    {
        log.info("+++验签失败 ！+++");
        e.printStackTrace();
    }
        return  "fail";
}




}
