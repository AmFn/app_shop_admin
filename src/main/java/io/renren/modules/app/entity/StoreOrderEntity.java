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
 * 订单表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_order")
public class StoreOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 订单ID
	 */
	@TableId
	private Long id;
	/**
	 * 订单号
	 */
	private String orderId;
	/**
	 * 额外订单号
	 */
	private String extendOrderId;
	/**
	 * 用户id
	 */
	private Long uid;
	/**
	 * 用户姓名
	 */
	private String realName;
	/**
	 * 用户电话
	 */
	private String userPhone;
	/**
	 * 详细地址
	 */
	private String userAddress;
	/**
	 * 购物车id
	 */
	private String cartId;
	/**
	 * 运费金额
	 */
	private BigDecimal freightPrice;
	/**
	 * 订单商品总数
	 */
	private Integer totalNum;
	/**
	 * 订单总价
	 */
	private BigDecimal totalPrice;
	/**
	 * 邮费
	 */
	private BigDecimal totalPostage;
	/**
	 * 实际支付金额
	 */
	private BigDecimal payPrice;
	/**
	 * 支付邮费
	 */
	private BigDecimal payPostage;
	/**
	 * 抵扣金额
	 */
	private BigDecimal deductionPrice;
	/**
	 * 优惠券id
	 */
	private Integer couponId;
	/**
	 * 优惠券金额
	 */
	private BigDecimal couponPrice;
	/**
	 * 支付状态
	 */
	private Integer paid;

	/**
	商品id
	 */
	private Integer pid;
	/**
	 * 支付时间
	 */
	private Date payTime;
	/**
	 * 支付方式
	 */
	private String payType;
	/**
	 * 创建时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
	/**
	 * 
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date updateTime;
	/**
	 * 订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：已完成；-1：已退款）
	 */
	private Integer status;
	/**
	 * 0 未退款 1 申请中 2 已退款
	 */
	private Integer refundStatus;
	/**
	 * 退款图片
	 */
	private String refundReasonWapImg;
	/**
	 * 退款用户说明
	 */
	private String refundReasonWapExplain;
	/**
	 * 退款时间
	 */
	private Date refundReasonTime;
	/**
	 * 前台退款原因
	 */
	private String refundReasonWap;
	/**
	 * 不退款的理由
	 */
	private String refundReason;
	/**
	 * 退款金额
	 */
	private BigDecimal refundPrice;
	/**
	 * 快递公司编号
	 */
	private String deliverySn;
	/**
	 * 快递名称/送货人姓名
	 */
	private String deliveryName;
	/**
	 * 发货类型
	 */
	private String deliveryType;
	/**
	 * 快递单号/手机号
	 */
	private String deliveryId;
	/**
	 * 消费赚取积分
	 */
	private BigDecimal gainIntegral;
	/**
	 * 使用积分
	 */
	private BigDecimal useIntegral;
	/**
	 * 给用户退了多少积分
	 */
	private BigDecimal backIntegral;
	/**
	 * 备注
	 */
	private String mark;
	/**
	 * 是否删除
	 */
	private Integer isDel;
	/**
	 * 唯一id(md5加密)类似id
	 */
//	private String unique;
	/**
	 * 管理员备注
	 */
	private String remark;
	/**
	 * 成本价
	 */
	private BigDecimal cost;
	/**
	 * 秒杀产品ID
	 */
	private Long seckillId;
	/**
	 * 砍价id
	 */
	private Integer bargainId;
	/**
	 * 核销码
	 */
	private String verifyCode;
	/**
	 * 配送方式 1=快递 ，2=门店自提
	 */
	private Integer shippingType;

}
