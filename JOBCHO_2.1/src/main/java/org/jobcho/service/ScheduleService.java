package org.jobcho.service;

import java.util.List;

import javax.inject.Inject;

import org.jobcho.domain.ScheduleDAO;
import org.jobcho.domain.ScheduleVO;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	
	@Inject
	private ScheduleDAO dao;
	
	
	public List<ScheduleDAO> getListSchedule() throws Exception {
		return dao.getListSchedule();
	}
	
	public void addSchedule(ScheduleVO dto) throws Exception{
		dao.addSchedule(dto);
	}
}
