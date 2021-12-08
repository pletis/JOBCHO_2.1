package org.jobcho.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO implements Serializable{
	private int reply_num;
	private String reply_contents;
	private int member_num;
	private int post_num;
	private int isLive;
	private Date reply_date;
	private String reply_writer; 
	
	private MemberVO member;
	private PostVO post;
}
