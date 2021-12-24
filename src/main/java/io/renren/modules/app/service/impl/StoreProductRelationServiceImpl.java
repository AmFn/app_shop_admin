package io.renren.modules.app.service.impl;

import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.service.StoreProductService;
import io.renren.modules.app.service.UserService;
import io.renren.modules.app.vo.ProductRelationVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreProductRelationDao;
import io.renren.modules.app.entity.StoreProductRelationEntity;
import io.renren.modules.app.service.StoreProductRelationService;


@Service("storeProductRelationService")
public class StoreProductRelationServiceImpl extends ServiceImpl<StoreProductRelationDao, StoreProductRelationEntity> implements StoreProductRelationService {
    @Autowired
    private StoreProductService productService;
    @Autowired
    private UserService userService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        IPage<StoreProductRelationEntity> page = this.page(
                new Query<StoreProductRelationEntity>().getPage(params),
                new QueryWrapper<StoreProductRelationEntity>()
        );
        ArrayList<ProductRelationVo> list= new ArrayList<>();
        for (StoreProductRelationEntity record : page.getRecords()) {
            ProductRelationVo vo = new ProductRelationVo();
            BeanUtils.copyProperties(record,vo);
            if (vo.getUid()!=null){
                vo.setUserEntity(userService.getById(vo.getUid()));
            }
            if (vo.getProductId()!= null){
                vo.setStoreProductEntity(productService.getById(vo.getProductId()));
            }
            list.add(vo);
        }
        return  new PageUtils(list,(int)page.getTotal(),(int)page.getSize(),(int)page.getCurrent());
    }

}