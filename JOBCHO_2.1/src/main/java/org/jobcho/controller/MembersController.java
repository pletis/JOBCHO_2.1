package org.jobcho.controller;

import java.util.List;

import org.jobcho.domain.MemberVO;
import org.jobcho.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
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
@RequestMapping("/team/{team_num}")
@Log4j
public class MembersController {
//	get: /team/{team_num}/members=>팀번호에 맞는 멤버리스트 반환
//
//			get: /team/{team_num}/members/{member_num} =>멤버 정보 반환
//
//			post: /team/{team_num}/members/invite => 팀에 멤버 초대
//
//			put: /team/{team_num}/members/{member_num} =>멤버 정보 수정
//
//			delete: /team/{team_num}/members/{member_num} => 멤버 정보 삭제
	@Autowired
	MemberMapper mapper;
	
	@CrossOrigin
	@GetMapping("/members")
	public ResponseEntity<List<MemberVO>> getListMember(@PathVariable("team_num") int team_num){
		List<MemberVO> list = mapper.listTeamMembers(team_num);
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	@GetMapping("/members/{member_num}")
	public ResponseEntity<MemberVO> getMember(
			@PathVariable("team_num") int team_num, 
			@PathVariable("member_num") int member_num){
		MemberVO member = mapper.getMember(member_num);
		return new ResponseEntity<>(member, HttpStatus.OK);
	}
	
	@PostMapping("/members/invite")
	public ResponseEntity<MemberVO> insertMember(@PathVariable("team_num") int team_num, @RequestBody MemberVO members){
		int re = mapper.insertMembers(members);
		log.info(members);
		return (re==1)? new ResponseEntity<>(members, HttpStatus.OK): new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	@PutMapping("/members/{member_num}")
	public ResponseEntity<MemberVO> updateMember(@PathVariable("team_num") int team_num, 
			@PathVariable("member_num") int member_num, @RequestBody MemberVO members){
		MemberVO updateMember = mapper.getMember(member_num);
		updateMember.setMember_position(members.getMember_position());
		int re = mapper.updateMemberInfo(updateMember);
		
		return (re==1)? new ResponseEntity<>(updateMember, HttpStatus.OK): new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	@DeleteMapping("/members/{member_num}")
	public ResponseEntity<String> deleteMember(@PathVariable("team_num") int team_num,
			@PathVariable("member_num") int member_num){
		int re = mapper.deleteMemberInfo(member_num);
		
		return (re==1)? new ResponseEntity<>("success", HttpStatus.OK): new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	
	
	
}