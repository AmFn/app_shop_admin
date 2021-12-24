package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 优惠券前台领取表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-10-29 18:14:05
 */
@Data
@TableName("app_store_coupon_issue")
public class StoreCouponIssueEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	private String cname;
	/**
	 * 优惠券ID
	 */
	private Integer cid;
	/**
	 * 优惠券类型 0-通用 1-商品券
	 */
	private Integer ctype;
	/**
	 * 优惠券领取开启时间
	 */
	private Date startTime;
	/**
	 * 优惠券领取结束时间
	 */
	private Date endTime;
	/**
	 * 优惠券领取数量
	 */
	private Integer totalCount;
	/**
	 * 优惠券剩余领取数量
	 */
	private Integer remainCount;
	/**
	 * 1 正常 0 未开启 -1 已无效
	 */
	private Integer status;
	/**
	 * 
	 */
	private Integer isDel;
	/**
	 * 优惠券添加时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;

}
