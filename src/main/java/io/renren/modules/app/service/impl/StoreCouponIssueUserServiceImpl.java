package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreCouponIssueUserDao;
import io.renren.modules.app.entity.StoreCouponIssueUserEntity;
import io.renren.modules.app.service.StoreCouponIssueUserService;


@Service("storeCouponIssueUserService")
public class StoreCouponIssueUserServiceImpl extends ServiceImpl<StoreCouponIssueUserDao, StoreCouponIssueUserEntity> implements StoreCouponIssueUserService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreCouponIssueUserEntity> page = this.page(
                new Query<StoreCouponIssueUserEntity>().getPage(params),
                new QueryWrapper<StoreCouponIssueUserEntity>()
        );

        return new PageUtils(page);
    }

}