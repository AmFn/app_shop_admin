package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户地址表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_user_address")
public class UserAddressEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户地址id
	 */
	@TableId
	private Long id;
	/**
	 * 用户id
	 */
	private Long uid;
	/**
	 * 收货人姓名
	 */
	private String realName;
	/**
	 * 收货人电话
	 */
	private String phone;
	/**
	 * 收货人所在省
	 */
	private String province;
	/**
	 * 收货人所在市
	 */
	private String city;
	/**
	 * 
	 */
	private Integer cityId;
	/**
	 * 收货人所在区
	 */
	private String district;
	/**
	 * 收货人详细地址
	 */
	private String detail;
	/**
	 * 邮编
	 */
	private String postCode;
	/**
	 * 经度
	 */
	private String longitude;
	/**
	 * 纬度
	 */
	private String latitude;
	/**
	 * 是否默认
	 */
	private Integer isDefault;
	/**
	 * 是否删除
	 */
	private Integer isDel;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;

}
