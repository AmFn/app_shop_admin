package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.UserBillDao;
import io.renren.modules.app.entity.UserBillEntity;
import io.renren.modules.app.service.UserBillService;


@Service("userBillService")
public class UserBillServiceImpl extends ServiceImpl<UserBillDao, UserBillEntity> implements UserBillService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserBillEntity> page = this.page(
                new Query<UserBillEntity>().getPage(params),
                new QueryWrapper<UserBillEntity>()
        );

        return new PageUtils(page);
    }

}