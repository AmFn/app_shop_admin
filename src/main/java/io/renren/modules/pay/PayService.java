package io.renren.modules.pay;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Map;

@Component
public interface PayService {
     String order(PayVo payVo);
    String aliNotify( Map<String, String> conversionParams);
}
