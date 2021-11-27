package org.jobcho.mapper;

import java.util.List;

import org.jobcho.domain.ReplyVO;

public interface ReplyMapper {

	int insertReply(ReplyVO reply);
	List<ReplyVO> listReply();
	int updateReply(ReplyVO reply);
	void deleteReply(int reply_num);
}
