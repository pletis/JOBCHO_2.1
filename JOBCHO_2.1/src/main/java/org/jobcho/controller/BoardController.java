package org.jobcho.controller;

import java.util.List;

import org.jobcho.domain.BoardVO;

import org.jobcho.service.BoardService;
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
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("board/*")
@Log4j
public class BoardController {
	
	
	@Autowired
	private BoardService service;
		

	/*
	 * 게시판 생성(PostMan 확인O)
	 * 메인화면에서 생성버튼 클릭 시
	 * team_num, member_num 필요
	 */
	@PostMapping("/insertboard")
	public ResponseEntity<BoardVO> insertBoard(@RequestBody BoardVO vo) {
		

		log.info("insertBoard ================== " + vo);
		int insertCount = service.insert(vo);
		
		return insertCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	/*
	 * 게시판 리스트 조회(PostMan 확인O)
	 * 메인 화면에서 항상 호출
	 */
	@GetMapping(value = "/getlistboard",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<BoardVO>> getListBoards(){
		
		log.info("getListBoards ================== ");
		return new ResponseEntity<>(service.getList(), HttpStatus.OK);
	}
	
	
	
	/*
	 * 게시판 수정(PostMan 확인O)
	 * team_num, member_num 필요
	 */
	@PutMapping(value = "/{board_num}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<BoardVO> updateBoard(@PathVariable("board_num") int board_num,
																					@RequestBody BoardVO board){
		
		log.info("putMapping ================== " + board_num);
		
		board.setBoard_num(board_num);
		int updateCount = service.update(board);
		
		return  updateCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/*
	 * 게시판 삭제(PostMan 확인O)
	 * team_num, member_num 필요
	 */
	@DeleteMapping(value = "/board/{board_num}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteBoard(@PathVariable int board_num){
		
		log.info("DeleteMapping ============" + board_num);
		service.delete(board_num);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
}
