package io.renren;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.app.service.StoreCategoryService;
import io.renren.modules.app.service.StoreProductService;
import io.renren.modules.app.service.StoreSeckillService;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisTest {
	@Autowired
	private RedisUtils redisUtils;

	@Test
	public void contextLoads() {
		SysUserEntity user = new SysUserEntity();
		user.setEmail("qqq@qq.com");
		redisUtils.set("user", user);

		System.out.println(ToStringBuilder.reflectionToString(redisUtils.get("user", SysUserEntity.class)));
	}

	@Autowired
	private StoreProductService storeProductService;
	@Test
	public void testCache() {
		Map<String,Object> map = new HashMap<>();
		PageUtils pageUtils = storeProductService.queryPage(map);
		pageUtils.getList().forEach(System.out::println);

	}
}
