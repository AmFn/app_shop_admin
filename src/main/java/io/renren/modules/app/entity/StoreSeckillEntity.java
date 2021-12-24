package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

/**
 * 商品秒杀产品表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_seckill")
public class StoreSeckillEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 商品秒杀产品表id
	 */
	@TableId
	private Long id;
	/**
	 * 商品id
	 */
	private Long productId;
	/**
	 * 推荐图
	 */
	private String image;
	/**
	 * 轮播图
	 */
	private String images;
	/**
	 * 活动标题
	 */
	private String title;
	/**
	 * 简介
	 */
	private String info;
	/**
	 * 价格
	 */
	private BigDecimal price;
	/**
	 * 成本
	 */
	private BigDecimal cost;
	/**
	 * 原价
	 */
	private BigDecimal otPrice;
	/**
	 * 返多少积分
	 */
	private BigDecimal giveIntegral;
	/**
	 * 排序
	 */
	private Integer sort;
	/**
	 * 库存
	 */
	private Integer stock;
	/**
	 * 销量
	 */
	private Integer sales;
	/**
	 * 单位名
	 */
	private String unitName;
	/**
	 * 内容
	 */
	private String description;
	/**
	 * 开始时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")

	private Date startTime;
	/**
	 * 结束时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")

	private Date stopTime;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;
	/**
	 * 产品状态
	 */
	private Integer status;
	/**
	 * 删除 0未删除1已删除
	 */
	private Integer isDel;
	/**
	 * 最多秒杀几个
	 */
	private Integer num;
	/**
	 * 显示
	 */
	private Integer isShow;
	/**
	 * 时间段id
	 */
	private Integer timeId;
	/**
	 * 规格 0单 1多
	 */
	private Integer specType;

}
