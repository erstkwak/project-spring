package com.spring.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.dao.AdminDao;
import com.spring.admin.service.AdminService;
import com.spring.admin.vo.Criteria;
import com.spring.member.vo.MemberVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDao adminDao;

//	@Override
//	public List<MemberVo> getMemberList(HashMap<String, Object> map) {
//		List<MemberVo> memberList = adminDao.getMemberList(map);
//		return memberList;
//	}

	@Override
	public void deleteMember(String mem_id) {
		adminDao.deleteMember(mem_id);
		
	}

	@Override
	public List<MemberVo> getMemberList(Criteria vo) {
		List<MemberVo> lists = (List<MemberVo>) adminDao.getMemberList(vo);
		return lists;
	}

	@Override
	public int listCount() {
		int count = adminDao.listCount();
		return count;
	}

	@Override
	public void updateMember(MemberVo vo) {
		adminDao.updateMember(vo);
		
	}

	@Override
	public MemberVo read(String mem_id) {
		return adminDao.read(mem_id);
	}


}
