package org.jobcho.service;

import java.util.List;

import org.jobcho.domain.MemberVO;
import org.jobcho.domain.UsersVO;


public interface MembersService {
	List<MemberVO> getListMember(int team_num);
	MemberVO getMember(int member_num);
	int insertMember(MemberVO members);
	int updateMember( MemberVO members);
	int deleteMember( int member_num);
	List<UsersVO> getListWithoutMembers(int team_num);
}
