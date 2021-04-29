package com.spring.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.admin.dao.AdminDao;
import com.spring.admin.dao.GoodsDao;
import com.spring.admin.dao.ImageFileDao;
import com.spring.admin.service.AdminService;
import com.spring.admin.vo.Criteria;
import com.spring.admin.vo.GoodsVo;
import com.spring.admin.vo.ImageFileVo;
import com.spring.admin.vo.ShoppingVo;
import com.spring.member.vo.MemberVo;
import com.spring.qna.vo.PostVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	GoodsDao goodsDao;
	
	@Autowired
	ImageFileDao imageFileDao;

//	@Override
//	public List<MemberVo> getMemberList(HashMap<String, Object> map) {
//		List<MemberVo> memberList = adminDao.getMemberList(map);
//		return memberList;
//	}

	@Override
	public void deleteMember(String mem_id) {
		adminDao.deleteMember(mem_id);
	}

	@Override
	public List<MemberVo> getMemberList(Criteria vo) {
		//List<MemberVo> lists = (List<MemberVo>) adminDao.getMemberList(vo);
		return adminDao.getMemberList(vo);
	}

	@Override
	public int listCount() {
		//int count = adminDao.listCount();
		return adminDao.listCount();
	}

	@Override
	public void updateMember(MemberVo vo) {
		adminDao.updateMember(vo);
	}

	@Override
	public MemberVo read(String mem_id) {
		return adminDao.read(mem_id);
	}

	@Transactional
	public void insertGoods(GoodsVo goodsVo) {
		goodsDao.insertSelectKey(goodsVo);

		if (goodsVo.getAttachList() == null || goodsVo.getAttachList().size() <= 0) {
			return;
		}

		goodsVo.getAttachList().forEach(attach -> {
			attach.setGoods_idx(goodsVo.getGoods_idx());
			imageFileDao.insert(attach);
		});
	}

	@Override
	public List<GoodsVo> getGoodsList(Criteria cri) {
		return goodsDao.getGoodsList(cri);
	}

	@Override
	public int goodsListCount() {
		return goodsDao.goodsListCount();
	}

	@Override
	public GoodsVo goodsInfo(int goods_idx) {
		return goodsDao.goodsInfo(goods_idx);
	}
	
	@Transactional
	public boolean updateGoods(GoodsVo goodsVo) 
	{
		imageFileDao.deleteList(goodsVo.getGoods_idx());
		boolean result = (goodsDao.updateGoods(goodsVo) == 1);

		if (result && goodsVo.getAttachList() != null && goodsVo.getAttachList().size() > 0) {
			goodsVo.getAttachList().forEach(attach -> {
				attach.setGoods_idx(goodsVo.getGoods_idx());
				imageFileDao.insert(attach);
			});
		}

		return result;
	}
	
	@Transactional
	public boolean delete(int goods_idx) {
		imageFileDao.deleteList(goods_idx);
		return (goodsDao.delete(goods_idx) == 1);
	}

	@Override
	public List<ImageFileVo> getImageList(int goods_idx) {
		return imageFileDao.getImageList(goods_idx);
	}

	@Override
	public List<ShoppingVo> getShoppingList(Criteria cri) {
		return goodsDao.getShoppingList(cri);
	}



}
