package com.spring.admin.service;

import java.util.List;

import com.spring.admin.vo.Criteria;
import com.spring.member.vo.MemberVo;

public interface AdminService {

	//List<MemberVo> getMemberList(HashMap<String, Object> map);

	List<MemberVo> getMemberList(Criteria vo);
	
	int listCount();

	void deleteMember(String mem_id);

	void updateMember(MemberVo vo);

	MemberVo read(String mem_id);


}
