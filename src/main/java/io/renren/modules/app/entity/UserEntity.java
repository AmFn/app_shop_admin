package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:48:26
 */
@Data
@TableName("app_user")
public class UserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
	@TableId
	private Long uid;
	/**
	 * 用户账户(跟accout一样)
	 */
	private String username;
	/**
	 * 用户密码（跟pwd）
	 */
	private String password;
	/**
	 * 真实姓名
	 */
	private String realName;
	/**
	 * 生日
	 */
	private Integer birthday;
	/**
	 * 身份证号码
	 */
	private String cardId;
	/**
	 * 用户备注
	 */
	private String mark;
	/**
	 * 用户昵称
	 */
	private String nickname;
	/**
	 * 用户头像
	 */
	private String avatar;
	/**
	 * 手机号码
	 */
	private String phone;
	/**
	 * 添加ip
	 */
	private String addIp;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 最后一次登录时间
	 */
	private Date updateTime;
	/**
	 * 最后一次登录ip
	 */
	private String lastIp;
	/**
	 * 用户余额
	 */
	private BigDecimal nowMoney;
	/**
	 * 佣金金额
	 */
	private BigDecimal brokeragePrice;
	/**
	 * 用户剩余积分
	 */
	private BigDecimal integral;
	/**
	 * 连续签到天数
	 */
	private Integer signNum;
	/**
	 * 1为正常，0为禁止
	 */
	private Integer status;
	/**
	 * 等级
	 */
	private Integer level;
	/**
	 * 用户类型
	 */
	private String userType;
	/**
	 * 用户购买次数
	 */
	private Integer payCount;
	/**
	 * 详细地址
	 */
	private String addres;
	/**
	 * 管理员编号 
	 */
	private Integer adminid;
	/**
	 * 
	 */
	private Integer isDel;

}
