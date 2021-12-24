package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 优惠券表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_coupon")
public class StoreCouponEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 优惠券表ID
	 */
	@TableId
	private Integer id;
	/**
	 * 优惠券名称
	 */
	private String title;
	/**
	 * 兑换消耗积分值
	 */
	private Integer integral;
	/**
	 * 兑换的优惠券面值
	 */
	private BigDecimal couponPrice;
	/**
	 * 最低消费多少金额可用优惠券
	 */
	private BigDecimal useMinPrice;
	/**
	 * 优惠券有效期限（单位：天）
	 */
	private Integer couponTime;
	/**
	 * 排序
	 */
	private Integer sort;
	/**
	 * 状态（0：关闭，1：开启）
	 */
	private Integer status;
	/**
	 * 商品ids
	 */
	private String productId;
	/**
	 * 优惠券类型 0-通用 1-商品券
	 */
	private Integer type;
	/**
	 * 兑换项目添加时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
	/**
	 * 
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date updateTime;
	/**
	 * 是否删除
	 */
	private Integer isDel;

}
