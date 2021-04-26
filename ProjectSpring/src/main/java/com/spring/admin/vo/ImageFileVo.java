package com.spring.admin.vo;

import lombok.Data;

@Data
public class ImageFileVo {
	private int     img_idx;
	private int     goods_idx;
	private String  img_name;
	private String  filename;
	private boolean filetype;
	private String  uploadpath;
	private String  img_regdate;
	
}
