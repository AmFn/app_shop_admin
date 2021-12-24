package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 评论表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_product_reply")
public class StoreProductReplyEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 评论ID
	 */
	@TableId
	private Long id;
	/**
	 * 用户ID
	 */
	private Long uid;
	/**
	 * 订单ID
	 */
	private Long oid;
	/**
	 * 唯一id
	 */
//	private String unique;
	/**
	 * 产品id
	 */
	private Long productId;
	/**
	 * 某种商品类型(普通商品、秒杀商品）
	 */
	private String replyType;
	/**
	 * 商品分数
	 */
	private Integer productScore;
	/**
	 * 服务分数
	 */
	private Integer serviceScore;
	/**
	 * 评论内容
	 */
	private String comment;
	/**
	 * 评论图片
	 */
	private String pics;
	/**
	 * 评论时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;
	/**
	 * 管理员回复内容
	 */
	private String merchantReplyContent;
	/**
	 * 管理员回复时间
	 */
	private Date merchantReplyTime;
	/**
	 * 0未删除1已删除
	 */
	private Integer isDel;
	/**
	 * 0未回复1已回复
	 */
	private Integer isReply;

}
