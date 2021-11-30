package org.jobcho.mapper;

import java.util.List;

import org.jobcho.domain.TodoVO;

public interface TodoMapper {
	public int insertTodo(TodoVO todo);
	public TodoVO getTodo(int todo_num);
	public List<TodoVO> selectTodoList();
	public int updateTodo(TodoVO todo);
	public int deleteTodo(int todo_num);
}
