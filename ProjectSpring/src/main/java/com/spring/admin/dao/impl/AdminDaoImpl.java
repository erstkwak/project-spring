package com.spring.admin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.dao.AdminDao;
import com.spring.admin.vo.Criteria;
import com.spring.admin.vo.GoodsVo;
import com.spring.admin.vo.ImageFileVo;
import com.spring.member.vo.MemberVo;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao{

	@Autowired
	SqlSession sqlSession;

//	@Override
//	public List<MemberVo> getMemberList(HashMap<String, Object> map) {
//		sqlSession.selectList("Admin.MemberList", map ); 
//
//		List<MemberVo> memberList  = (List<MemberVo>) map.get("result"); 
//
//		return   memberList;
//	}
	@Override
	public List<MemberVo> getMemberList(Criteria vo) {
		//Object memberList = sqlSession.selectList("Admin.MemberListWithPaging", vo ); 
		return sqlSession.selectList("Admin.MemberListWithPaging", vo ); 
	}

	@Override
	public void deleteMember(String mem_id) {
		sqlSession.delete("Admin.DeleteMember", mem_id);
	}

	@Override
	public int listCount() {
		return sqlSession.selectOne("Admin.ListCount");
	}

	@Override
	public void updateMember(MemberVo vo) {
		sqlSession.update("Admin.UpdateMember", vo);
		
	}

	@Override
	public MemberVo read(String mem_id) {
		return sqlSession.selectOne("Admin.Read", mem_id);
	}



}
