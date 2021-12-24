package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.UserSignEntity;
import io.renren.modules.app.vo.IntegralSettingVo;

import java.util.Map;

/**
 * 签到记录表
 *
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
public interface UserSignService extends IService<UserSignEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void setIntegral(IntegralSettingVo settingVo);
}

