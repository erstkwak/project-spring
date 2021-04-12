package com.spring.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.qna.service.ReplyService;
import com.spring.qna.vo.ReplyPageVO;
import com.spring.qna.vo.ReplyVO;
import com.spring.qna.vo.UtilVO;

@RequestMapping("/replies/")
@RestController
public class ReplyController 
{
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/new", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyVO replyVO) 
	{
		return replyService.register(replyVO) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value="/{r_no}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE}, method = RequestMethod.GET)
	public ResponseEntity<ReplyVO> get(@PathVariable("r_no") Long r_no)
	{
		return new ResponseEntity<>(replyService.getOne(r_no), HttpStatus.OK);
	}
	
	@RequestMapping(value="/{r_no}", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE, method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@RequestBody ReplyVO replyVO, @PathVariable("r_no") Long r_no)
	{
		replyVO.setR_no(r_no);
		
		return replyService.modify(replyVO) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value="/{r_no}", produces= MediaType.TEXT_PLAIN_VALUE, method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("r_no") Long r_no)
	{
		return replyService.remove(r_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value="/pages/{p_no}/{page}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE}, method = RequestMethod.GET)
	public ResponseEntity<ReplyPageVO> getList(@PathVariable("page") int page, @PathVariable("p_no") Long p_no)
	{
		UtilVO utilVO = new UtilVO(page, 10);
		return new ResponseEntity<>(replyService.getListPage(utilVO, p_no), HttpStatus.OK);
	}

}