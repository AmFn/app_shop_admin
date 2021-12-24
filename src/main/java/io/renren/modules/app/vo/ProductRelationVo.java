package io.renren.modules.app.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import io.renren.modules.app.entity.StoreProductEntity;
import io.renren.modules.app.entity.UserEntity;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class ProductRelationVo implements Serializable {
    private static final long serialVersionUID = 1L;


    private Long id;

    private Long uid;
    private UserEntity userEntity;
    private StoreProductEntity storeProductEntity;
    /**
     * 商品ID
     */
    private Long productId;
    /**
     * 类型(收藏(collect）、点赞(like))
     */
    private String type;
    /**
     * 某种类型的商品(普通商品、秒杀商品)
     */
    private String category;
    /**
     * 添加时间
     */
    private Date createTime;
    /**
     *
     */
    private Date updateTime;
    /**
     *
     */
    private Integer isDel;
}
