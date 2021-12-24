package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 订单操作记录表
 * 
 * @author chenyufeng
 * @email chenyufengkkk@163.com
 * @date 2021-09-22 09:32:22
 */
@Data
@TableName("app_store_order_status")
public class StoreOrderStatusEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 订单id
	 */
	private Long oid;
	/**
	 * 操作类型
	 */
	private String changeType;
	/**
	 * 操作备注
	 */
	private String changeMessage;
	/**
	 * 操作时间
	 */
	private Date changeTime;

}
