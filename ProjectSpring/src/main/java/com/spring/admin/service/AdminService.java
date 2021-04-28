package com.spring.admin.service;

import java.util.List;

import com.spring.admin.vo.Criteria;
import com.spring.admin.vo.GoodsVo;
import com.spring.admin.vo.ImageFileVo;
import com.spring.admin.vo.ShoppingVo;
import com.spring.member.vo.MemberVo;

public interface AdminService {

	//List<MemberVo> getMemberList(HashMap<String, Object> map);

	List<MemberVo> getMemberList(Criteria vo);
	
	int listCount();

	void deleteMember(String mem_id);

	void updateMember(MemberVo vo);

	MemberVo read(String mem_id);

	void insertGoods(GoodsVo goodsVo);

	List<GoodsVo> getGoodsList(Criteria cri);

	int goodsListCount();

	GoodsVo goodsInfo(int goods_idx);

	boolean updateGoods(GoodsVo goodsVo);

	List<ImageFileVo> getImageList(int goods_idx);

	boolean delete(int goods_idx);

	List<ShoppingVo>  getShoppingList(Criteria cri);


}
