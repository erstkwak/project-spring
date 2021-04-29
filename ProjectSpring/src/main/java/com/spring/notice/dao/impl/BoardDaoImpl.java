package com.spring.notice.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.notice.dao.BoardDao;
import com.spring.notice.vo.BoardVO;
import com.spring.notice.vo.Criteria;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	//root-context.xml 에 설정된 sqlSession 를 불러와 사용한다
	@Autowired
	private  SqlSession  sqlSession; 
//게시판
	/////////////////////////////////////////
		// 리스트
		@Override
		public List<BoardVO> list(Criteria cri) {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".list()");
			return sqlSession.selectList("NBoardMapper.list", cri);
		}

		// 글보기, 글수정 혹은 삭제로 갈 수 있다.
		@Override
		public BoardVO view(Integer nb_no) {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".view()");
			return sqlSession.selectOne("NBoardMapper.view", nb_no);
		}

		// 글쓰기
		@Override
		public void write(BoardVO boardVO) {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".write()");
			sqlSession.insert("NBoardMapper.write", boardVO);

		}

		// 글수정
		@Override
		public void update(BoardVO boardVO) {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".update()");
			sqlSession.update("NBoardMapper.update", boardVO);
		}

		// 글삭제
		@Override
		public void delete(Integer nb_no) {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".delete()");
			sqlSession.insert("NBoardMapper.delete", nb_no);
		}

		// 조회수 증가
		@Override
		public void increase(Integer nb_no) {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".increase()");
			sqlSession.update("NBoardMapper.increase", nb_no);
		}

		// 게시판 전체 글의 갯수 구하는 메서드
		@Override
		public Integer getTotalCount(Criteria cri) {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".getTotalCount()");
			return sqlSession.selectOne("NBoardMapper.totalCount", cri);
		}
		
		// 게시글 하나 - 댓글의 수
		@Override
		public void updateReplyCnt(Integer nb_no, int amount) throws Exception {
			// 들어온 것을 확인
			System.out.println(getClass().getName() + ".updateReplyCnt()");
		    Map<String, Object> paramMap = new HashMap<>();
		    paramMap.put("nb_no", nb_no);
		    paramMap.put("amount", amount);
		    sqlSession.update("NBoardMapper.updateReplyCnt", paramMap);
		}
		
}
