package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 商品分类表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_category")
public class StoreCategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@TableField(exist = false)
	private List<StoreCategoryEntity> childrens;

	public Integer getSort() {
		return sort == null ? 0 : sort;
	}
	/**
	 * 商品分类表ID
	 */
	@TableId
	private Integer id;
	/**
	 * 父id
	 */
	private Integer pid;
	/**
	 * 分类名称
	 */
	private String cateName;
	/**
	 * 排序
	 */
	private Integer sort;
	/**
	 * 图标
	 */
	private String pic;
	/**
	 * 是否推荐
	 */
	private Integer isShow;
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
	 * 删除状态
	 */
	private Integer isDel;

}
