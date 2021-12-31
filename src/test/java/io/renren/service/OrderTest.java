package io.renren.service;

import io.renren.modules.app.service.StoreOrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderTest {
    @Autowired
    StoreOrderService orderService;
    @Test
    public  void selectOrderTest(){
        long uid = 2L;
        orderService.getByUSerID(uid).forEach(System.out::println);
    }
}
