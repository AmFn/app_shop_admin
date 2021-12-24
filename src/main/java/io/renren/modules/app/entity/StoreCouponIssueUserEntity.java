package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 优惠券前台用户领取记录表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:06
 */
@Data
@TableName("app_store_coupon_issue_user")
public class StoreCouponIssueUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 领取优惠券用户ID
	 */
	private Long uid;
	/**
	 * 优惠券前台领取ID
	 */
	private Integer issueCouponId;
	/**
	 * 领取时间
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
