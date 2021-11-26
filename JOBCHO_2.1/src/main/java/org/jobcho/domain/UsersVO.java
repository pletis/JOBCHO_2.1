package org.jobcho.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsersVO {
	private int user_num; //사용자번호
	private String user_name; //사용자이름
	private String user_phoneNum; //사용자전화번호
	private String user_email; //사용자 이메일
	private String user_pw; //사용자비밀번호
	private String user_birth; //사용자생년월일
	private String user_pwHint; //사용자 비밀번호 힌트
	private char enabled;
	private int isLive;
	private String auth;
	private Date user_date;
}
