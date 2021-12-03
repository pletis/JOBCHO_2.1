package org.jobcho.controller;

import java.util.List;
import java.util.Set;

import org.jobcho.domain.BoardVO;
import org.jobcho.domain.MemberVO;
import org.jobcho.domain.TeamVO;
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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/team/{team_num}/board")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardService service;
		

	/*
	 * 寃뚯떆�뙋 �깮�꽦(PostMan �솗�씤O)
	 * 硫붿씤�솕硫댁뿉�꽌 �깮�꽦踰꾪듉 �겢由� �떆
	 * team_num, member_num �븘�슂
	 */
	@PostMapping(value = "/new",
						consumes = "application/json",
						produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<BoardVO> insertBoard(@RequestBody BoardVO board,
																				@PathVariable("team_num") int team_num) {
		
//		board.setMember_num(member_num);
		board.setTeam_num(team_num);
		
		log.info("寃뚯떆�뙋 �깮�꽦: " + board);
		log.info("��踰덊샇: " + team_num);
		
		int insertCount = service.insertBoard(board);
		
		return insertCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	/*
	 * 寃뚯떆�뙋 由ъ뒪�듃 議고쉶(PostMan �솗�씤O)
	 * 硫붿씤 �솕硫댁뿉�꽌 �빆�긽 �샇異�
	 * team_num �븘�슂 
	 */
	@GetMapping(value = "",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<BoardVO>> getListBoard(@PathVariable int team_num){
		
		
		log.info("��踰덊샇" + team_num);
		return new ResponseEntity<>(service.getListBoard(team_num), HttpStatus.OK);
	}
	
	
	
	/*
	 * 寃뚯떆�뙋 �닔�젙(PostMan �솗�씤O)
	 * team_num, member_num �븘�슂
	 */
	@PutMapping(value = "/{board_num}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<BoardVO> updateBoard(@RequestBody BoardVO board,
																				  @PathVariable("board_num") int board_num
																				){
		
		log.info("�닔�젙�븷 寃뚯떆�뙋 踰덊샇: " + board_num);
		
		board.setBoard_num(board_num);
		int updateCount = service.updateBoard(board);
		
		return  updateCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/*
	 * 寃뚯떆�뙋 �궘�젣(PostMan �솗�씤O, isLive 蹂�寃�)
	 * team_num, member_num �븘�슂
	 */
	@DeleteMapping(value = "/{board_num}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteBoard(@PathVariable int board_num){
		
		log.info("�궘�젣�븷 寃뚯떆�뙋 踰덊샇: " + board_num);
		service.deleteBoard(board_num);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
}
