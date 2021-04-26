package com.spring.admin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.dao.ImageFileDao;
import com.spring.admin.vo.ImageFileVo;

@Repository("imageFileDao")
public class ImageFileDaoImpl implements ImageFileDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insert(ImageFileVo attach) {
		sqlSession.insert("AdminImage.InsertImage", attach);
		
	}

	@Override
	public List<ImageFileVo> getImageList(int goods_idx) {
		return sqlSession.selectList("AdminImage.readImage", goods_idx);
	}

	@Override
	public void deleteList(int goods_idx) {
		sqlSession.delete("AdminImage.deleteList", goods_idx);
		
	}

}
