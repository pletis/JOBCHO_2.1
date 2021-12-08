package org.jobcho.domain;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.management.dao.ScheduleDAO";
	
	public List<ScheduleDAO> getListSchedule() throws Exception {
		return sqlSession.selectList(namespace + ".getListSchedule");
	}
	
	public void addSchedule(ScheduleVO dto) throws Exception {
		sqlSession.insert(namespace + ".addSchedule", dto);
	}
	
}
