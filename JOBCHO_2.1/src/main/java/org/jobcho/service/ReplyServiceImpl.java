package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.ReplyVO;
import org.jobcho.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
@NoArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;

	@Override
	public int insert(ReplyVO reply) {
		log.info("왜이러는거야 대체");
		return mapper.insertReply(reply);
	}

	@Override
	public List<ReplyVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(ReplyVO reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delete(int reply_num) {
		// TODO Auto-generated method stub
		
	}

	
}
