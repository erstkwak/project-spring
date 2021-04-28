package com.spring.qna.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.spring.qna.mapper.PostAttachMapper;
import com.spring.qna.mapper.PostMapper;
import com.spring.qna.vo.PostAttachVO;
import com.spring.qna.vo.PostVO;
import com.spring.qna.vo.UtilVO;

@Service
public class PostServiceImpl implements PostService 
{

	@Autowired
	private PostMapper postMapper;

	@Autowired
	private PostAttachMapper postAttachMapper;

	@Transactional
	public void register(PostVO postVO) 
	{
		postMapper.createSelectKey(postVO);

		if (postVO.getAttachList() == null || postVO.getAttachList().size() <= 0) {
			return;
		}

		postVO.getAttachList().forEach(attach -> {
			attach.setP_no(postVO.getP_no());
			postAttachMapper.create(attach);
		});
	}

	public List<PostVO> getList(UtilVO utilVO) 
	{
		System.out.println(postMapper.readList(utilVO));
		return postMapper.readList(utilVO);
	}

	public PostVO getOne(Long p_no) 
	{
		System.out.println(postMapper.readOne(p_no));
		return postMapper.readOne(p_no);
	}

	@Transactional
	public boolean modify(PostVO postVO) 
	{
		postAttachMapper.deleteList(postVO.getP_no());
		boolean result = (postMapper.update(postVO) == 1);

		if (result && postVO.getAttachList() != null && postVO.getAttachList().size() > 0) {
			postVO.getAttachList().forEach(attach -> {
				attach.setP_no(postVO.getP_no());
				postAttachMapper.create(attach);
			});
		}

		return result;
	}

	@Transactional
	public boolean remove(Long p_no) 
	{
		postAttachMapper.deleteList(p_no);
		return (postMapper.delete(p_no) == 1);
	}

	public int getPostCount(UtilVO utilVO) 
	{
		return postMapper.getPostCount(utilVO);
	}

	public List<PostAttachVO> getAttachList(Long p_no) 
	{
		return postAttachMapper.read(p_no);
	}

}