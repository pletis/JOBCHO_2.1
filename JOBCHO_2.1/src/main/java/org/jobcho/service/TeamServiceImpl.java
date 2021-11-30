package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.TeamVO;
import org.jobcho.mapper.TeamMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper mapper;
	
	
	//ÆÀ »ý¼º
	@Override
	public int insertTeam(TeamVO team) {
		
		return mapper.insertTeam(team);
	}

	//ÆÀ ¸®½ºÆ® Á¶È¸
	@Override
	public List<TeamVO> getListTeam(int user_num) {
		
		return mapper.getListTeam(user_num);
	}

	//ÆÀ ÇÏ³ª Á¶È¸
	@Override
	public TeamVO getTeam(int team_num) {
		
		return mapper.getTeam(team_num);
	}

	//ÆÀ ¾÷µ¥ÀÌÆ®
	@Override
	public int updateTeam(TeamVO team) {
		
		return mapper.updateTeam(team);
	}

	@Override
	public int deleteTeam(int team_num) {
		
		return mapper.deleteTeam(team_num);
	}

}
