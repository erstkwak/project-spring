package com.spring.mypage.dao;

import java.util.HashMap;

import com.spring.member.vo.MemberVo;

public interface MypageDao {

	MemberVo passCheck(HashMap<String, Object> map);

	void memberUpdate(MemberVo vo);

	void deleteMember(MemberVo vo);



}
