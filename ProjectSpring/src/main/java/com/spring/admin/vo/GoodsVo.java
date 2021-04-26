package com.spring.admin.vo;

import java.util.List;

import lombok.Data;

@Data
public class GoodsVo {

	private int    goods_idx;
	private String goods_name;
	private int    goods_price;
	private int    goods_point;
	private int    delivery_price;
	private String delivery_date;
	private String goods_info;
	private String goods_regdate;
	
	private List<ImageFileVo> attachList;
	
	
}
