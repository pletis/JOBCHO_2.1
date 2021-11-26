package org.jobcho.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int board_num;
	private String board_name;
	private String board_info;
	private int team_num;
	private int member_num;
	private int isLive;
	private Date board_date;
	
	private MembersVO member;
	private TeamVO team;
}
