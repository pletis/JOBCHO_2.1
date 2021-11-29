package org.jobcho.mapper;

import java.util.List;

import org.jobcho.domain.PostVO;

public interface PostMapper {

	int insertPost(PostVO post); //게시글 생성
	List<PostVO> getListPost(int board_num); //게시글 리스트
	int updatePost(PostVO post); //게시글 수정
	void deletePost(int post_num); //게시글 삭제
	
}
