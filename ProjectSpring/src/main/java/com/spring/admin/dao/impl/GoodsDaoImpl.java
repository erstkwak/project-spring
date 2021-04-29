package com.spring.admin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.dao.GoodsDao;
import com.spring.admin.vo.Criteria;
import com.spring.admin.vo.GoodsVo;
import com.spring.admin.vo.ShoppingVo;

@Repository("goodsDao")
public class GoodsDaoImpl implements GoodsDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertSelectKey(GoodsVo goodsVo) {
		sqlSession.insert("AdminGoods.InsertSelectKey", goodsVo);
		
	}

	@Override
	public List<GoodsVo> getGoodsList(Criteria cri) {
		return sqlSession.selectList("AdminGoods.GoodsList", cri ); 
	}

	@Override
	public int goodsListCount() {
		return sqlSession.selectOne("AdminGoods.GoodsListCount");
	}

	@Override
	public GoodsVo goodsInfo(int goods_idx) {
		return sqlSession.selectOne("AdminGoods.GoodsInfo", goods_idx);
	}

	@Override
	public int updateGoods(GoodsVo goodsVo) {
		return sqlSession.update("AdminGoods.UpdateGoods", goodsVo);
	}

	@Override
	public int delete(int goods_idx) {
		return sqlSession.delete("AdminGoods.delete", goods_idx);
	}

	@Override
	public List<ShoppingVo> getShoppingList(Criteria cri) {
		return sqlSession.selectList("AdminGoods.ShoppingList", cri ); 
	}

}
