package org.jobcho.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jobcho.domain.Criteria;
import org.jobcho.domain.PostVO;
import org.jobcho.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
@NoArgsConstructor
public class PostServiceImpl implements PostService {

	@Autowired
	private PostMapper mapper;
	
	
	@Override
	public int insertPost(PostVO post) {
		log.info("서비스 게시글 생성: " + post.getPost_title());
		
		return mapper.insertPost(post);
	}

	@Override
	public List<PostVO> getListPost(int board_num) {
		log.info("서비스 게시글 리스트: " + board_num);
		
		return mapper.getListPost(board_num);
	}
	
	@Override
	public PostVO getList(int post_num) {
		log.info("서비스 게시글 상세조회: " + post_num);
		
		return mapper.getPost(post_num);
	}

	@Override
	public int updateBoard(PostVO post) {
		log.info("서비스 게시글 수정: " + post.getPost_num());
		
		return mapper.updatePost(post);
	}

	@Override
	public void deletePost(int post_num) {
		log.info("서비스 게시글 삭제: " + post_num);
		mapper.deletePost(post_num);
	}

	
	@Override
	public int getTotalCount(Criteria cri) {
		log.info("전체 게시글 수");
		
		return mapper.getTotalCount(cri);
	}

	

	

}
