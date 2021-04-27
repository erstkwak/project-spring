package com.spring.member.dao;

import java.util.HashMap;

import com.spring.member.vo.MemberVo;

public interface MemberDao {

	void insertMember(MemberVo vo);

	MemberVo memberLogin(HashMap<String, Object> map);

	int idCheck(MemberVo vo);

}
