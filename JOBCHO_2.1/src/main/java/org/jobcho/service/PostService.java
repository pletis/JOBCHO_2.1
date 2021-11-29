package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.PostVO;

import oracle.jdbc.proxy.annotation.Post;

public interface PostService {
	
	
	public int insertPost(PostVO post); //게시글 생성
	
	public List<PostVO> getListPost(int board_num); //게시글 리스트
	
	public int updateBoard(PostVO post); //게시글 수정
	
	public void deletePost(int post_num); //게시글 삭제
	
}
