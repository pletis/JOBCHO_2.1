package org.jobcho.service;

import org.jobcho.domain.UsersVO;

public interface UsersService {
	public int insertUsers(UsersVO users);
	public int insertAuth(String user_email);
	public UsersVO findUsers(String user_email);
	public int updatePw(UsersVO users);
	public UsersVO loginUsers(UsersVO users);
	public int updateUsers(UsersVO users);
	public UsersVO selectUsers(int user_num);
	public int idCheck(UsersVO users);
}
