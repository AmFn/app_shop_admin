package io.renren.modules.app.service.impl;

import com.sun.org.apache.bcel.internal.generic.NEW;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.service.StoreProductService;
import io.renren.modules.app.vo.CartProductNumVo;
import io.renren.modules.app.vo.CartVo;
import io.renren.modules.app.vo.CountVo;
import io.renren.modules.app.vo.addCartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.app.dao.StoreCartDao;
import io.renren.modules.app.entity.StoreCartEntity;
import io.renren.modules.app.service.StoreCartService;


@Service("storeCartService")
public class StoreCartServiceImpl extends ServiceImpl<StoreCartDao, StoreCartEntity> implements StoreCartService {

    @Autowired
    StoreCartDao cartDao;
    @Autowired
    StoreProductService productService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StoreCartEntity> page = this.page(
                new Query<StoreCartEntity>().getPage(params),
                new QueryWrapper<StoreCartEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<CountVo> findCateName() {
        return cartDao.findCateName();
    }

    @Override
    public CartVo getCartByUid(Long uid) {
        List<CartVo> res= new ArrayList<>();
        List<StoreCartEntity> cartEntities = baseMapper.selectList(new QueryWrapper<StoreCartEntity>()
                .eq("uid", uid)

        );
        CartVo cartVo = new CartVo();

        List<CartProductNumVo>  productNumVos= new ArrayList<>();

        cartEntities.forEach(cart->{
            CartProductNumVo productNumVo =  new CartProductNumVo();
            productNumVo.setNum(cart.getCartNum());
            productNumVo.setProductEntity(productService.getById(cart.getProductId()));
            productNumVos.add(productNumVo);


        });
        cartVo.setCartProductNumVos(productNumVos);
        cartVo.setTotalPrice(computePrice(productNumVos));

        return cartVo;
    }

    @Override
    public boolean add(addCartVo addCartVo) {
        if (addCartVo.getUid()!=null&&addCartVo.getNum()!=null&&addCartVo.getProductId()!=null){
            StoreCartEntity storeCartEntity = new StoreCartEntity();
            storeCartEntity.setProductId(addCartVo.getUid());
            storeCartEntity.setUid(addCartVo.getUid());
            storeCartEntity.setIsPay(0);
            storeCartEntity.setType("product");
            storeCartEntity.setCartNum(addCartVo.getNum());
            baseMapper.insert(storeCartEntity);
            return true;
        }
        else {
            return false;
        }

    }

    private BigDecimal computePrice(List<CartProductNumVo> productNumVos) {
        BigDecimal  total = BigDecimal.ZERO;
        for (CartProductNumVo productNumVo : productNumVos) {
            BigDecimal itemnum =new BigDecimal(productNumVo.getNum());
            BigDecimal itemPrice = productNumVo.getProductEntity().getPrice();
            itemnum.multiply(itemnum);
            total =  total.add(itemPrice.multiply(itemnum));

        }

        return total;
    }
}