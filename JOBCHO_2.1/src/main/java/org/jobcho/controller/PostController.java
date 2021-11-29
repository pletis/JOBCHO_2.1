package org.jobcho.controller;

import java.util.List;

import javax.xml.ws.Response;

import org.jobcho.domain.PostVO;
import org.jobcho.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/team/{team_num}/board/{board_num}/post")
@Log4j
@AllArgsConstructor
public class PostController {
	
	@Autowired
	private PostService service;
	
	
	/*
	 * 게시글 생성(PostMan 확인O)
	 *board_num, member_num 필요
	*/
	@PostMapping("/new")
	public ResponseEntity<PostVO> insertPost(@RequestBody PostVO post,
																		  @PathVariable("board_num") int board_num){
		
		post.setBoard_num(board_num);
		
		log.info("게시글 생성: " + post);
		log.info("게시판 번호: " + board_num);

		int insertCount = service.insertPost(post);
		
		return insertCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/*
	 * 게시글 리스트(PostMan 확인O)
	 * board_num, member_num 필요
	 */
	@GetMapping("")
	public ResponseEntity<List<PostVO>> getListPost(@PathVariable("board_num") int board_num){
		
		log.info("게시글 : " + board_num);
		
		List<PostVO> getListPost = service.getListPost(board_num);
		return new ResponseEntity<>(getListPost, HttpStatus.OK);
	}
	
	
	/*
	 *게시글 수정()
	 * 
	 */
	@PutMapping("/{post_num}")
	public ResponseEntity<PostVO> updatePost(@RequestBody PostVO post,
																	@PathVariable("post_num") int post_num,
																	@PathVariable("board_num") int board_num){
		
		post.setPost_num(post_num);
		post.setBoard_num(board_num);
		int updateCount = service.updateBoard(post);
		
		return updateCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	
	/*
	 * 게시글 삭제(PostMan 확인O)
	 * post_num 필요
	 */
	@DeleteMapping("/{post_num}")
	public ResponseEntity<String> deletePost(@PathVariable("post_num") int post_num){
		
		log.info("게시글 삭제: " + post_num);
		service.deletePost(post_num);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	

}