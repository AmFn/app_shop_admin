package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户账单表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_user_bill")
public class UserBillEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户账单id
	 */
	@TableId
	private Long id;
	/**
	 * 用户uid
	 */
	private Long uid;
	/**
	 * 关联id
	 */
	private String linkId;
	/**
	 * 0 = 支出 1 = 获得
	 */
	private Integer pm;
	/**
	 * 账单标题
	 */
	private String title;
	/**
	 * 明细种类
	 */
	private String category;
	/**
	 * 明细类型
	 */
	private String type;
	/**
	 * 明细数字
	 */
	private BigDecimal number;
	/**
	 * 剩余
	 */
	private BigDecimal balance;
	/**
	 * 备注
	 */
	private String mark;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;
	/**
	 * 0 = 带确定 1 = 有效 -1 = 无效
	 */
	private Integer status;
	/**
	 * 
	 */
	private Integer isDel;

}
