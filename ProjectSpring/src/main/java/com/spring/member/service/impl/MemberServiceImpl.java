package com.spring.member.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.dao.MemberDao;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao; 

	@Override
	public void insertMember(MemberVo vo) {
		memberDao.insertMember( vo );
	}

	@Override
	public MemberVo memberLogin(HashMap<String, Object> map) {
		MemberVo memberVo = memberDao.memberLogin(map);
		return memberVo;
	}


	@Override
	public int idcheck(MemberVo vo) {
		int result = memberDao.idCheck(vo);
		return result;
	}

}
