package com.spring.visitcount.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.visitcount.dao.VisitCountDao;

//@Repository("visitCountDao")
public class VisitCountDaoImpl implements VisitCountDao{
	
	@Autowired
	private  SqlSession  sqlSession; 

	@Override
	public int getVisitTodayCount() {
		System.out.println(getClass().getName() + ".getVisitTodayCount()");
		return sqlSession.selectOne("VisitCountMapper.todayCount");
	}

	@Override
	public int getVisitTotalCount() {
		System.out.println(getClass().getName() + ".getVisitTotalCount()");
		return sqlSession.selectOne("VisitCountMapper.totalCount");
	}

	@Override
	public void setVisitTotalCount() {
		System.out.println(getClass().getName() + ".setVisitTotalCount()");
		sqlSession.insert("VisitCountMapper.insertVisitor");
	}

}
