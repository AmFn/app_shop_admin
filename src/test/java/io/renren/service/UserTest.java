package io.renren.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.entity.StoreProductRelationEntity;
import io.renren.modules.app.service.StoreProductRelationService;
import io.renren.modules.app.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserTest {
    @Autowired
    UserService userService;
    @Autowired
    StoreProductRelationService relationService;
    @Test
    public  void testAddHistory(){
        userService.addRecentHistory(1L, 1L);
        userService.addRecentHistory(1L, 14L);
        userService.addRecentHistory(1L, 15L);
        userService.addRecentHistory(1L, 16L);
        List<StoreProductEntity> historySkuList = userService.getHistorySkuList(1L);
        historySkuList.forEach(System.out::println);
    }
    @Test
    public  void likeTest(){
       userService.getUserLike(2L).forEach(System.out::println);
    }

}
