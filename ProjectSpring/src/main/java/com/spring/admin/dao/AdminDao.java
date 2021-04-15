package com.spring.admin.dao;

import java.util.List;

import com.spring.admin.vo.Criteria;
import com.spring.member.vo.MemberVo;

public interface AdminDao {

	//List<MemberVo> getMemberList(HashMap<String, Object> map);
	List<MemberVo> getMemberList(Criteria vo);

	int listCount();

	void deleteMember(String mem_id);

	void updateMember(MemberVo vo);

	MemberVo read(String mem_id);

}
