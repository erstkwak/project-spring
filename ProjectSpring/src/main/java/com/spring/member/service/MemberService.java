package com.spring.member.service;

import java.util.HashMap;

import com.spring.member.vo.MemberVo;

public interface MemberService {

	void insertMember(MemberVo vo);

	MemberVo memberLogin(HashMap<String, Object> map);

	int idcheck(MemberVo vo);

}
