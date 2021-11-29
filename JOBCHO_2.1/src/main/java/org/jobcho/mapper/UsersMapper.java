package org.jobcho.mapper;

import org.jobcho.domain.UsersVO;

public interface UsersMapper {
	public int insertUsers(UsersVO users);
	public int insertAuth(String user_email);
	public UsersVO findUsers(String user_email);
	public int updatePw(UsersVO users);
	public UsersVO loginUsers(UsersVO users);
	public int updateUsers(UsersVO users);
	public UsersVO selectUsers(int user_num);
	public UsersVO read(String user_email);
	public int idCheck(UsersVO users);
}
