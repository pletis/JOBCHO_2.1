package org.jobcho.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	private int reply_num; // 댓글번호
	private String reply_contents; //댓글내용
	private int member_num; //멤버번호
	private int post_num; //게시글번호
	private int isLive; //??
	private Date reply_date; //댓글 작성시간
	
	private MembersVO member; //댓글 작성자
	private PostVO post; //게시글
}
