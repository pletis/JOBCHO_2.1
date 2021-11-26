package org.jobcho.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostVO {
	private int post_num;
	private String post_title;
	private String post_contents;
	private int board_num;
	private int member_num;
	private Date post_date;
	private int isLive;
	
	private BoardVO board;
	private MembersVO member;
}
