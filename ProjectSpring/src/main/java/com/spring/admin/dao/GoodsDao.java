package com.spring.admin.dao;

import java.util.List;

import com.spring.admin.vo.Criteria;
import com.spring.admin.vo.GoodsVo;
import com.spring.admin.vo.ShoppingVo;

public interface GoodsDao {

	void insertSelectKey(GoodsVo goodsVo);

	List<GoodsVo> getGoodsList(Criteria cri);

	int goodsListCount();

	GoodsVo goodsInfo(int goods_idx);

	int updateGoods(GoodsVo goodsVo);

	int delete(int goods_idx);

	List<ShoppingVo> getShoppingList(Criteria cri);

}
