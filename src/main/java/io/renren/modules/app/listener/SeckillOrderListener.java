package io.renren.modules.app.listener;

import com.rabbitmq.client.Channel;
import io.renren.modules.app.service.StoreOrderService;
import io.renren.modules.app.vo.CreateOrderVo;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;


@Component
@RabbitListener(queues = "order.seckill.order.queue")
public class SeckillOrderListener {
    @Autowired
    private StoreOrderService orderService;

    @RabbitHandler
    public void createOrder(CreateOrderVo createOrderVo, Message message, Channel channel) throws IOException {
        System.out.println("接收到秒杀消息");
        long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            orderService.create(createOrderVo);
            channel.basicAck(deliveryTag, false);
        } catch (Exception e) {
            channel.basicReject(deliveryTag,true);
        }
    }
}