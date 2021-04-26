package com.spring.admin.dao;

import java.util.List;

import com.spring.admin.vo.ImageFileVo;

public interface ImageFileDao {

	void insert(ImageFileVo attach);

	List<ImageFileVo> getImageList(int goods_idx);

	void deleteList(int goods_idx);

}
