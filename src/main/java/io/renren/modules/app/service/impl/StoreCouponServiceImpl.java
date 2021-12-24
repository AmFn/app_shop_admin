package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreCouponDao;
import io.renren.modules.app.entity.StoreCouponEntity;
import io.renren.modules.app.service.StoreCouponService;


@Service("storeCouponService")
public class StoreCouponServiceImpl extends ServiceImpl<StoreCouponDao, StoreCouponEntity> implements StoreCouponService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreCouponEntity> page = this.page(
                new Query<StoreCouponEntity>().getPage(params),
                new QueryWrapper<StoreCouponEntity>()
        );

        return new PageUtils(page);
    }

}