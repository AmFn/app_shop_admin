package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreCouponIssueDao;
import io.renren.modules.app.entity.StoreCouponIssueEntity;
import io.renren.modules.app.service.StoreCouponIssueService;


@Service("storeCouponIssueService")
public class StoreCouponIssueServiceImpl extends ServiceImpl<StoreCouponIssueDao, StoreCouponIssueEntity> implements StoreCouponIssueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreCouponIssueEntity> page = this.page(
                new Query<StoreCouponIssueEntity>().getPage(params),
                new QueryWrapper<StoreCouponIssueEntity>()
        );

        return new PageUtils(page);
    }

}