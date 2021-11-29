package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.BoardVO;


public interface BoardService {
	
	public int insert(BoardVO board);
	
	public List<BoardVO> getList();
	
	public int update(BoardVO board);
	
	public void delete(int board_num);

}
