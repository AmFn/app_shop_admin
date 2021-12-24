package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 购物车表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_cart")
public class StoreCartEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 购物车表ID
	 */
	@TableId
	private Long id;
	/**
	 * 用户ID
	 */
	private Long uid;
	/**
	 * 类型
	 */
	private String type;
	/**
	 * 商品ID
	 */
	private Long productId;
	/**
	 * 商品属性
	 */
	private String productAttrUnique;
	/**
	 * 商品数量
	 */
	private Integer cartNum;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;
	/**
	 * 0 = 未购买 1 = 已购买
	 */
	private Integer isPay;
	/**
	 * 是否删除
	 */
	private Integer isDel;
	/**
	 * 是否为立即购买
	 */
	private Integer isNew;
	/**
	 * 秒杀产品ID
	 */
	private Integer seckillId;
	/**
	 * 砍价id
	 */
	private Integer bargainId;

}
