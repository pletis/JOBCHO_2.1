package org.jobcho.controller;

import java.util.List;

import org.jobcho.domain.BoardVO;
import org.jobcho.domain.ReplyVO;
import org.jobcho.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("reply/*")
@Log4j
public class ReplyController {
	@Autowired
	private ReplyService service;
	
	
	@PostMapping(value = "/insertreply")
	public ResponseEntity<ReplyVO> insertReply(@RequestBody ReplyVO vo){
		
		log.info("insertReply =======================" + vo);
		int insertCount = service.insert(vo);
		
		return insertCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/getlistreply",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getListReply(){
		log.info("getListReply ================== ");
		return new ResponseEntity<>(service.getList(), HttpStatus.OK);
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
