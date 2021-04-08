package com.spring.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.qna.mapper.PostAttachMapper;
import com.spring.qna.mapper.PostMapper;
import com.spring.qna.vo.PostAttachVO;
import com.spring.qna.vo.PostVO;
import com.spring.qna.vo.UtilVO;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	private PostAttachMapper postAttachMapper;

	
	
	
	
	
	
	
	
	
	
	
	
	
	@Transactional
	public void register(PostVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);
		
		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public PostVO get(Long bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}

	@Transactional
	public boolean modify(PostVO board) {
		log.info("modify......" + board);
		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = mapper.update(board) == 1;
		
		if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		

		return modifyResult;
	}

	@Transactional
	public boolean remove(Long bno) {

		log.info("remove...." + bno);
		
		attachMapper.deleteAll(bno);

		return mapper.delete(bno) == 1;
	}

	// @Override
	// public List<BoardVO> getList() {
	//
	// log.info("getList..........");
	//
	// return mapper.getList();
	// }

	@Override
	public List<PostVO> getList(UtilVO cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(UtilVO cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	public List<PostAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		
		return attachMapper.findByBno(bno);
	}

	@Override
	public void register(PostVO postVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PostVO> getList(UtilVO utilVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PostVO getOne(Long p_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(PostVO postVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getPostCount(UtilVO utilVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PostAttachVO> getAttachList(Long p_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
