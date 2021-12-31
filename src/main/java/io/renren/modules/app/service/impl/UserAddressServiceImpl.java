package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.UserAddressDao;
import io.renren.modules.app.entity.UserAddressEntity;
import io.renren.modules.app.service.UserAddressService;


@Service("userAddressService")
public class UserAddressServiceImpl extends ServiceImpl<UserAddressDao, UserAddressEntity> implements UserAddressService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserAddressEntity> page = this.page(
                new Query<UserAddressEntity>().getPage(params),
                new QueryWrapper<UserAddressEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public String getAddressStringById(Integer id) {
        UserAddressEntity userAddressEntity = baseMapper.selectById(id);
        StringBuilder sb = new StringBuilder();
        sb.append(userAddressEntity.getProvince());
        sb.append(userAddressEntity.getCity());
        sb.append(userAddressEntity.getDistrict());
        sb.append(userAddressEntity.getDetail());
        return sb.toString();
    }

    @Override
    public UserAddressEntity getUserAddr(Long uid) {
        UserAddressEntity userAddressEntity = baseMapper.selectOne(new LambdaQueryWrapper<UserAddressEntity>().eq(UserAddressEntity::getUid, uid));
        return userAddressEntity;
    }
}