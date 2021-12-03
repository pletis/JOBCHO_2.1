package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.VoteResultVO;
import org.jobcho.mapper.VoteResultMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VoteResultServiceImpl implements VoteResultService {

	@Autowired
	private VoteResultMapper mapper;
	
	//��ǥ �ϱ�
	@Override
	public int insertVoteResult(VoteResultVO voteResult) {
	
		return mapper.insertVoteResult(voteResult);
	}

	//��ǥ ��� ����(��ǥ�� ����)
	@Override
	public VoteResultVO getVoteResult(int vote_num) {
		
		return mapper.getVoteResult(vote_num);
	}

	@Override
	public List<VoteResultVO> getVoteResultMember(int vote_num) {
		
		return mapper.getVoteResultMember(vote_num);
	}

}
