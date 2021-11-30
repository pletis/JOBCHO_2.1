package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.PostVO;

//import oracle.jdbc.proxy.annotation.Post;

public interface PostService {
	
	
	public int insertPost(PostVO post); //寃뚯떆湲� �깮�꽦
	
	public List<PostVO> getListPost(int board_num); //寃뚯떆湲� 由ъ뒪�듃
	
	public int updateBoard(PostVO post); //寃뚯떆湲� �닔�젙
	
	public void deletePost(int post_num); //寃뚯떆湲� �궘�젣
	
}
