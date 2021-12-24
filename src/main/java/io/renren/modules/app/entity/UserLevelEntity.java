package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户等级记录表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_user_level")
public class UserLevelEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 用户uid
	 */
	private Long uid;
	/**
	 * 等级vip
	 */
	private Integer levelId;
	/**
	 * 会员等级
	 */
	private Integer grade;
	/**
	 * 过期时间
	 */
	private Integer validTime;
	/**
	 * 是否永久
	 */
	private Integer isForever;
	/**
	 * 商户id
	 */
	private Integer merId;
	/**
	 * 0:禁止,1:正常
	 */
	private Integer status;
	/**
	 * 备注
	 */
	private String mark;
	/**
	 * 是否已通知
	 */
	private Integer remind;
	/**
	 * 是否删除,0=未删除,1=删除
	 */
	private Integer isDel;
	/**
	 * 添加时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
	/**
	 * 
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date updateTime;
	/**
	 * 享受折扣
	 */
	private Integer discount;

}
