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
	public int insertReply(ReplyVO reply) {
		log.info("댓글 등록 =====" + reply);
		return mapper.insertReply(reply);
	}

	@Override
	public List<ReplyVO> getListReply(int post_num) {
		log.info("댓글 리스트 =====" + post_num);
		return mapper.getListReply(post_num);
	}

	@Override
	public int updateReply(ReplyVO reply) {
		log.info("댓글 수정 =====" + reply);
		return mapper.updateReply(reply);
	}

	@Override
	public void deleteReply(int reply_num) {
		log.info("댓글 삭제 =====" + reply_num);
		mapper.deleteReply(reply_num);
	}

	
}
