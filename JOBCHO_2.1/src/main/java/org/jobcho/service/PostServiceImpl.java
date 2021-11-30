package org.jobcho.service;

import java.util.List;

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
		log.info("서비스 게시글 생성");
		
		return mapper.insertPost(post);
	}

	@Override
	public List<PostVO> getListPost(int board_num) {
		log.info("서비스 게시글 리스트");
		
		return mapper.getListPost(board_num);
	}

	@Override
	public int updateBoard(PostVO post) {
		log.info("서비스 게시글 수정");
		
		return mapper.updatePost(post);
	}

	@Override
	public void deletePost(int post_num) {
		log.info("서비스 게시글 삭제");
		mapper.deletePost(post_num);
	}

}
