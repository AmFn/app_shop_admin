package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.modules.app.vo.IntegralSettingVo;
import io.renren.modules.sys.entity.SysConfigEntity;
import io.renren.modules.sys.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.UserSignDao;
import io.renren.modules.app.entity.UserSignEntity;
import io.renren.modules.app.service.UserSignService;


@Service("userSignService")
public class UserSignServiceImpl extends ServiceImpl<UserSignDao, UserSignEntity> implements UserSignService {

    @Autowired
    private SysConfigService configService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserSignEntity> page = this.page(
                new Query<UserSignEntity>().getPage(params),
                new QueryWrapper<UserSignEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void setIntegral(IntegralSettingVo settingVo) {
        SysConfigEntity prop = configService.getOne(new QueryWrapper<SysConfigEntity>().eq("param_key", "proportion"));
        SysConfigEntity proportion = new SysConfigEntity();
        proportion.setParamKey("proportion");
        proportion.setParamValue(String.valueOf(settingVo.getProportion()));
        proportion.setRemark("积分抵用比例");
        if (null== prop){
            configService.saveConfig(proportion);
        }else {
            proportion.setId(prop.getId());
            configService.update(proportion);
        }
        SysConfigEntity re = configService.getOne(new QueryWrapper<SysConfigEntity>().eq("param_key", "reach"));
        SysConfigEntity reach = new SysConfigEntity();

        reach.setParamKey("reach");
        reach.setParamValue(String.valueOf(settingVo.getReach()));
        reach.setRemark("满多少可以抵扣");
        if (null==re){
            configService.saveConfig(reach);
        }else {
            reach.setId(re.getId());
            configService.update(reach);
        }

        SysConfigEntity ma = configService.getOne(new QueryWrapper<SysConfigEntity>().eq("param_key", "max"));
        SysConfigEntity max = new SysConfigEntity();
        max.setParamKey("max");
        max.setParamValue(String.valueOf(settingVo.getMax()));
        max.setRemark("单次最大抵扣积分");
        if (null==ma){

            configService.saveConfig(max);
        }else {
          max.setId(ma.getId());
          configService.update(max);

        }

    }
}