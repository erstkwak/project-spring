package com.spring.admin.vo;

import lombok.Data;

@Data
public class ShoppingVo {

	private int    goods_idx;
	private String goods_name;
	private int    goods_price;
	private int    goods_point;
	private int    delivery_price;
	private String delivery_date;
	private String goods_info;
	private String goods_regdate;
	
	private int     img_idx;
	private String  img_name;
	private String  filename;
	private boolean filetype;
	private String  uploadpath;
	private String  img_regdate;
	
	
}
