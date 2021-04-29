package com.spring.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.notice.service.BReplyService;
import com.spring.notice.vo.BoardReplyVO;
import com.spring.notice.vo.Criteria;

@RestController
@RequestMapping("/reply/")
public class BReplyController {
	
	@Autowired
	private BReplyService replyService;
	
	@RequestMapping("test")
    public String replyAjaxTest() {
        return "/notice/reply_test";
    }
	
	//댓글 등록
	@RequestMapping(value ="/register", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BoardReplyVO replyVO) {
	    ResponseEntity<String> entity = null;
	    try {
	        //replyService.create(replyVO);
	        replyService.addReply(replyVO);
	        entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
	//댓글 목록 articleNo => nb_no
	@RequestMapping(value = "/all/{nb_no}", method = RequestMethod.GET)
	public ResponseEntity<List<BoardReplyVO>> list(@PathVariable("nb_no") Integer nb_no) {
	    ResponseEntity<List<BoardReplyVO>> entity = null;
	    try {
	        entity = new ResponseEntity<>(replyService.list(nb_no), HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
	//댓글 수정 replyNo => nr_no
	@RequestMapping(value = "/update/{nr_no}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("nr_no") Integer nr_no, @RequestBody BoardReplyVO replyVO) {
	    ResponseEntity<String> entity = null;
	    try {
	        replyVO.setNr_no(nr_no);;
	        replyService.update(replyVO);
	        entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
	//댓글 삭제처리 replyNo => nr_no
	@RequestMapping(value = "/delete/{nr_no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("nr_no") Integer nr_no) {
	    ResponseEntity<String> entity = null;
	    try {
	        replyService.removeReply(nr_no);
	        entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
//댓글페이징
	@RequestMapping(value = "/{nb_no}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("nb_no") Integer nb_no,
	                                                      @PathVariable("page") Integer page,
	                                                      Criteria criteria) {
	    ResponseEntity<Map<String, Object>> entity = null;
	    try {
	    	System.out.println(page);//1
	        criteria.setPage(page);

	        //int repliesCount = replyService.countReplies(nb_no);
	        int totalCount = replyService.countReplies(nb_no);
	        System.out.println(totalCount);//17
	        criteria.setTotalCount(totalCount);
	        criteria.calc(totalCount);
	        
	        List<BoardReplyVO> replies = replyService.getRepliesPaging(nb_no, criteria);
	        
	        Map<String, Object> map = new HashMap<>();
	        map.put("replies", replies);
	        map.put("criteria", criteria);

	        entity = new ResponseEntity<>(map, HttpStatus.OK);

	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(HttpStatus.OK);
	    }
	    return entity;
	}
	
	
	
}
