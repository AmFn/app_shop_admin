package io.renren;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.core.AmqpAdmin;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RabbitTest {
    @Autowired
    AmqpAdmin amqpAdmin;
    @Test
    public void createExchange(){
        DirectExchange exchange = new DirectExchange("hello",true,true);
        amqpAdmin.declareExchange(exchange);
    }
}
