package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 快递公司表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_express")
public class ExpressEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 快递公司id
	 */
	@TableId
	private Integer id;
	/**
	 * 快递公司简称
	 */
	private String code;
	/**
	 * 快递公司全称
	 */
	private String name;
	/**
	 * 排序
	 */
	private Integer sort;
	/**
	 * 是否显示
	 */
	private Integer isShow;
	/**
	 * 
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
