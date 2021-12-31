package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.StoreCartEntity;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.vo.CartVo;
import io.renren.modules.app.vo.CountVo;
import io.renren.modules.app.vo.addCartVo;

import java.util.List;
import java.util.Map;

/**
 * 购物车表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface StoreCartService extends IService<StoreCartEntity> {

    PageUtils queryPage(Map<String, Object> params);
    List<CountVo> findCateName();
    CartVo getCartByUid(Long uid);

    boolean add(addCartVo addCartVo);
}

