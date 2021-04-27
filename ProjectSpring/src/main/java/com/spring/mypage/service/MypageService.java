package com.spring.mypage.service;

import java.util.HashMap;

import com.spring.member.vo.MemberVo;

public interface MypageService {

	MemberVo passCheck(HashMap<String, Object> map);

	void memberUpdate(MemberVo vo);

	void deleteMember(MemberVo vo);




}
