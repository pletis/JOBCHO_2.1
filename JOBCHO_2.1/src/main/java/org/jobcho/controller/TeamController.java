package org.jobcho.controller;

import java.util.List;

import org.jobcho.domain.TeamVO;
import org.jobcho.service.TeamService;
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
@RequestMapping("/team/*")
@Log4j
public class TeamController {

	@Autowired
	private TeamService service;
	
	//ÆÀ »ý¼º
	@PostMapping("/{user_num}")
	public ResponseEntity<TeamVO> insertTeam(@RequestBody TeamVO teamVO, @PathVariable("user_num") int user_num){
		
		TeamVO team = new TeamVO();
		
		team.setUser_num(user_num);
		team.setTeam_name(teamVO.getTeam_name());
		team.setTeam_info(teamVO.getTeam_info());
			
		log.info("ÆÀ»ý¼º È®ÀÎ");
		int insertCount = service.insertTeam(team);
		
		return insertCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//ÆÀ ¸®½ºÆ® Á¶È¸
	@GetMapping(value = "/{user_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<TeamVO>> getListTeam(@PathVariable("user_num") int user_num){
		log.info("ÆÀ ¸ñ·Ï È£Ãâ È®ÀÎ");
		return new ResponseEntity<>(service.getListTeam(user_num), HttpStatus.OK);
	}
	
	//ÆÀ Á¤º¸ Á¶È¸
	@GetMapping(value="/{user_num}/{team_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TeamVO> getTeam(@PathVariable("team_num") int team_num){
		log.info("ÆÀ Á¤º¸ Á¶È¸");
		return new ResponseEntity<>(service.getTeam(team_num), HttpStatus.OK);
	}
	
	//ÆÀ Á¤º¸ ¼öÁ¤
	@PutMapping(value = "/{team_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TeamVO> getTeam(@PathVariable("team_num") int team_num, @RequestBody TeamVO teamVO){
		/*int user_num = 
		TeamVO team = new TeamVO();
		
		team = service.getTeam(team_num);
		
		if(team.getUser_num() == user_num){
			
		}*/
		TeamVO team = new TeamVO();
		
		team.setTeam_num(team_num);
		team.setTeam_name(teamVO.getTeam_name());
		team.setTeam_info(teamVO.getTeam_info());
		
		int insertCount = service.updateTeam(team);
		
		return insertCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//ÆÀ»èÁ¦
	@DeleteMapping(value = "/{team_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TeamVO> deleteTeam(@PathVariable("team_num") int team_num){
		int insertCount = service.deleteTeam(team_num);
		
		return insertCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
