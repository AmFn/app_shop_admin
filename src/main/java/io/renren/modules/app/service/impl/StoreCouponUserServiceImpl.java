package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreCouponUserDao;
import io.renren.modules.app.entity.StoreCouponUserEntity;
import io.renren.modules.app.service.StoreCouponUserService;


@Service("storeCouponUserService")
public class StoreCouponUserServiceImpl extends ServiceImpl<StoreCouponUserDao, StoreCouponUserEntity> implements StoreCouponUserService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreCouponUserEntity> page = this.page(
                new Query<StoreCouponUserEntity>().getPage(params),
                new QueryWrapper<StoreCouponUserEntity>()
        );

        return new PageUtils(page);
    }

}