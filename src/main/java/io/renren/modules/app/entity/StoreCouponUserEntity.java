package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 优惠券发放记录表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:06
 */
@Data
@TableName("app_store_coupon_user")
public class StoreCouponUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 优惠券发放记录id
	 */
	@TableId
	private Long id;
	/**
	 * 兑换的项目id
	 */
	private Integer cid;
	/**
	 * 优惠券所属用户
	 */
	private Long uid;
	/**
	 * 优惠券名称
	 */
	private String couponTitle;
	/**
	 * 优惠券的面值
	 */
	private BigDecimal couponPrice;
	/**
	 * 最低消费多少金额可用优惠券
	 */
	private BigDecimal useMinPrice;
	/**
	 * 优惠券创建时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;
	/**
	 * 优惠券结束时间
	 */
	private Date endTime;
	/**
	 * 使用时间
	 */
	private Date useTime;
	/**
	 * 获取方式
	 */
	private String type;
	/**
	 * 状态（0：未使用，1：已使用, 2:已过期）
	 */
	private Integer status;
	/**
	 * 是否有效
	 */
	private Integer isFail;
	/**
	 * 
	 */
	private Integer isDel;

}
