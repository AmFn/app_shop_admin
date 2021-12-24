package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 商品属性值表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_product_attr_value")
public class StoreProductAttrValueEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 商品ID
	 */
	private Long productId;
	/**
	 * 商品属性索引值 (attr_value|attr_value[|....])
	 */
	private String sku;
	/**
	 * 属性对应的库存
	 */
	private Integer stock;
	/**
	 * 销量
	 */
	private Integer sales;
	/**
	 * 属性金额
	 */
	private BigDecimal price;
	/**
	 * 图片
	 */
	private String image;
	/**
	 * 唯一值
	 */
//	private String unique;
	/**
	 * 成本价
	 */
	private BigDecimal cost;
	/**
	 * 商品条码
	 */
	private String barCode;
	/**
	 * 原价
	 */
	private BigDecimal otPrice;
	/**
	 * 重量
	 */
	private BigDecimal weight;
	/**
	 * 体积
	 */
	private BigDecimal volume;
	/**
	 * 秒杀价
	 */
	private BigDecimal seckillPrice;
	/**
	 * 秒杀库存
	 */
	private Integer seckillStock;

}
