package org.jobcho.mapper;

import java.util.List;

import org.jobcho.domain.TeamVO;

public interface TeamMapper {
	
	int insertTeam(TeamVO team);
	List<TeamVO> getListTeam(int user_num);
	TeamVO getTeam(int team_num);
	int updateTeam(TeamVO team);
	int deleteTeam(int team_num);

}