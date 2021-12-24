package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreProductReplyDao;
import io.renren.modules.app.entity.StoreProductReplyEntity;
import io.renren.modules.app.service.StoreProductReplyService;


@Service("storeProductReplyService")
public class StoreProductReplyServiceImpl extends ServiceImpl<StoreProductReplyDao, StoreProductReplyEntity> implements StoreProductReplyService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreProductReplyEntity> page = this.page(
                new Query<StoreProductReplyEntity>().getPage(params),
                new QueryWrapper<StoreProductReplyEntity>()
        );

        return new PageUtils(page);
    }

}