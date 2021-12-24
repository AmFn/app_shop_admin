package io.renren.modules.app.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.ExpressDao;
import io.renren.modules.app.entity.ExpressEntity;
import io.renren.modules.app.service.ExpressService;


@Service("expressService")
public class ExpressServiceImpl extends ServiceImpl<ExpressDao, ExpressEntity> implements ExpressService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ExpressEntity> page = this.page(
                new Query<ExpressEntity>().getPage(params),
                new QueryWrapper<ExpressEntity>()
        );

        return new PageUtils(page);
    }

}