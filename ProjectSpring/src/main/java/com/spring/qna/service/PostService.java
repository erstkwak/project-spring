package com.spring.qna.service;

import java.util.List;
import com.spring.qna.vo.PostAttachVO;
import com.spring.qna.vo.PostVO;
import com.spring.qna.vo.UtilVO;

public interface PostService 
{

	public void register(PostVO postVO);

	public List<PostVO> getList(UtilVO utilVO);

	public PostVO getOne(Long p_no);

	public boolean modify(PostVO postVO);

	public boolean remove(Long p_no);

	public int getPostCount(UtilVO utilVO);

	public List<PostAttachVO> getAttachList(Long p_no);

}