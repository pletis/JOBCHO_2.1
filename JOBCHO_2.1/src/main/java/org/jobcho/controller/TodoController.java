package org.jobcho.controller;

import org.jobcho.domain.TodoVO;
import org.jobcho.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/team/{team_num}/todo")
public class TodoController {

	@Autowired
	TodoService service;
	
	//오늘의 할일 생성  -> postMan 확인완료 
	@PostMapping("/new")
	public ResponseEntity<Integer> insertTodo(@PathVariable("team_num") int team_num,@RequestBody TodoVO todo){
		int re = service.insertTodo(todo);
		
		return new ResponseEntity<Integer>(re, HttpStatus.OK);
	}
	
	
}




















