package org.jobcho.service;

import org.jobcho.domain.TodoVO;
import org.jobcho.mapper.TodoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TodoServiceImpl implements TodoService {
	
	@Autowired
	TodoMapper mapper;
	
	//오늘의 할일 생성 
	@Override
	public int insertTodo(TodoVO todo) {
		int re = mapper.insertTodo(todo);
		return re;
	}

}
