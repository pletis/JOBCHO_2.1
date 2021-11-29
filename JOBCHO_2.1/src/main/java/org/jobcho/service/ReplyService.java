package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.ReplyVO;

public interface ReplyService {
	
	public int insert(ReplyVO reply);
	
	public List<ReplyVO> getList();
	
	public int update(ReplyVO reply);
	
	public void delete (int reply_num);
}
