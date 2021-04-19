package com.spring.mypage.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.member.vo.MemberVo;
import com.spring.mypage.dao.MypageDao;

@Repository("mypageDao")
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSession sqlSesion;

	@Override
	public MemberVo passCheck(HashMap<String, Object> map) {
		MemberVo vo = sqlSesion.selectOne("Mypage.IdCheck", map);
		return vo;
	}

	@Override
	public void memberUpdate(MemberVo vo) {
		sqlSesion.update("Mypage.MemberUpdate", vo);
	}

	@Override
	public void deleteMember(MemberVo vo) {
		sqlSesion.delete("Mypage.MemberDelete", vo);
		
	}



}
