package io.renren.modules.pay;

import lombok.Data;

@Data
public class AppPayConfig {
    /**
     * 1.商户appid
     */
    public String APPID = "2021000118668981";

    /**
     * 私钥 pkcs8格式的
     */
    public static String RSA_PRIVATE_KEY ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCYMW9gZ8S23cM6SQhwH1mxUZNaCMICpyQ9+cXVbTWBKTET0x3Ck0NRkKiecLqEzSCw8aQaqXnmdYrgN2In0zQuNCLrjhveTM04uKj5L83NHUz9XtzieU/VkFHT3QtT54pIPzdLVx1hks9b4gW6/BevXEJcAFJKvhMUqUbOx5c/tj7PhN1om2Fv42qTwMRmWdRicuOlzVCTahPdOUJqWNRbdpb++fc62dVl1RJPTB8hONbE1VVJdj5xO3+ek1bzvejRRfgNz37yt6YWjmv3yfYfQv8H+q+/oZV87LAd+ILSd2/sSDVEMjOu+qGn0mwjyVWixaAmUJSVXGO1EvIOJ/4FAgMBAAECggEARDrdaMX8rdLLxGSbkNCtQE6HFfUZLWFLYTGKHL3CH+6cnvuluuaUZovI3IdDR2hDALDEVmOmT8hgg1aw/ZO1MAWVpi7mlYmu83/t2REyXYOGUYzmz+18+gyicq4Fdw81smAM5QzgEi9kIRg6Y3LDF43v/hjyy6ldGoUtRmS6jQftGcRiC00S2nQn5wEqeYmt4AF5hSuAt0CSR7XtAeVHEbHzvx8ToX0E+6C4KpSJFikVchkfYKpPVAJPN1168JNExruR0GZmGTXn3SZ+X53zvI6XyntXq3cdfn70GEpoNkh67hxPXaTOBrGKz4lhCERYvgaGu2DIJyiaG6yCJESTXQKBgQD0rhqA0EiI5TpRTIXbLxhUUi1hrEIdz1W/9qIvi/AbYWaAl7m0P4k53E61E9cqWJ0dyRycjiKQIXuLSl+OA230RxgvdObbS5aK/bhrLetBGcF9QvXaG8tnka47R4yg9l/Rq3pM1wtnAFp+tY2WIShQB7gtaqPM90HzA0/gKYzrlwKBgQCfO/OPXnwlCcatObugKuzrH9SAtKzSvafEM5y9XB6QyJA+rvPpKXimIHBHOqG35icpd88Mlq6nktFcescjcPxbykc4msn2+tGZGMxIjH3vqkAllY6xLWI7/DsLXzaCk2j/Lm9blodVwt6u/daXu2VfMM+qZK/7RzWj5iGS7W0GwwKBgE7cqrgn6akN0O0RL/eER2AuGGhpv+mhwO6dTIrsnJgGnaYGwRkCfXVDt66PVYNVilZmUq129lbkI9CySPgZzN+15mqtUBcQVtY3jrAk3bVe2slHwrvox3d7Md/zYLUkk5+dmE6Z5RfuujwqwhbIWxjoVAl3XJIcg4oS4DTMz5nDAoGAbXZNDHWradq6lUJm1MgtbcTH1GJfm898kMfaK+IzsNvvLOggDFzR74HFLXIE0eKJcVxHHSRIlDG9cpGEa7yz/nWjWCowRHRPuaruY8EQobyrtCqHmQzVxt6xyDN/yWuEdkd5jcCA8FextSISbuQH39QyLbRhtZ9SJIWC9vn4RPkCgYEApWDZE2PabO0zq9rJFY4M2805ypnZe2SvZL014Ktrs+ASHhCJsydVPChXZolzmuTZ+PQcZotbHfe8tztPnL0nOTblLpai9vHBZ5NnQ6FmF22Zbvi9/up1YEyfkM7mxqbxy2xSnWcR8mTRRJdmU20XgHEKqfKxXjKzP+3aQ0ujIms=";

    /**
     * 3.支付宝公钥
     */
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiZppi4FpmBwF+sQuuyjAVmBKN5EQjExIKAybjlbAReZAPg8GRbpoDPRYXu09EE+AJR6xhnLq5F/MFrtrw/iaDpgsQ2YWHBn229LDb/no5liUpg1z7MdcMx68dTUw+i4nSHIrtRO872FfFZRt1He6yktyycANNlAdpVLwK7GQCrjtPvpbCVYum6x6zCl3Y/RWZBHViKmvLOtdBZaO6jmwgPEtOdtU0GLtF95CgBBsi9qdhBKpwnNCS7OO0AHQRDFc3Ycrxhxe7M9YxYuU2X1UGSDqtD2VfQgvwOnnHXj7OIEmj617CyCFXWgbb1wMqXYywq3oCZBLzfWKais4mNJZTQIDAQAB";

    /**
     * 4.服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
     */
//这个着重讲一下..支付完成后,支付宝会通过这个url请求到你的服务端..
//这个url一定是要公网可以访问才行...如果需要测试的话..我后面有讲到..
//这里你可以先写你本地项目的url 例如:localhost:8080/项目名/访问路径
    public static String notify_url = "http://localhost:8080/renren-fast/pay/aliNotify";

    /**
     * 5.页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
     */
    //这里同上..不做详细说明了..
    public static String return_url = "localhost:8080/renren-fast/pay/returnUrl";

    /**
     * 正式环境支付宝网关，如果是沙箱环境需更改成https://openapi.alipaydev.com/gateway.do
     */
    public static String URL = "https://openapi.alipaydev.com/gateway.do";

    /**
     * 7.编码
     */
    public static String CHARSET = "UTF-8";

    /**
     * 私钥 pkcs8格式的
     */
    // 8.返回格式
    public static String FORMAT = "json";

    /**
     * //签名方式 加密类型
     */
    public static String SIGNTYPE = "RSA2";

}
