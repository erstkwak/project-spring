package com.spring.mypage.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.vo.MemberVo;
import com.spring.mypage.dao.MypageDao;
import com.spring.mypage.service.MypageService;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDao mypageDao;

	@Override
	public MemberVo passCheck(HashMap<String, Object> map) {
		MemberVo vo = mypageDao.passCheck(map);
		
		return vo;
	}

	@Override
	public void memberUpdate(MemberVo vo) {
		mypageDao.memberUpdate(vo);
		
	}

	@Override
	public void deleteMember(MemberVo vo) {
		mypageDao.deleteMember(vo);
		
	}



}
