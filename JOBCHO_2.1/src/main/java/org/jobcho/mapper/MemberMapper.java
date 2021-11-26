package org.jobcho.mapper;

import java.util.List;

import org.jobcho.domain.MemberVO;

public interface MemberMapper {
	int insertMembers(MemberVO members);
	List<MemberVO> listTeamMembers(int team_num);
	int updateMemberInfo(MemberVO member);
	int deleteMemberInfo(int member_num);
	MemberVO checkMember(MemberVO member);
	int deleteAllMember(int team_num);
	int memberTeamNumber(int user_num);
	MemberVO getMember(int member_num);
}
