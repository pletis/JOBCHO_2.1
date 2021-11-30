package org.jobcho.service;

import org.jobcho.domain.CalendarVO;
import org.jobcho.mapper.BoardMapper;
import org.jobcho.mapper.CalendarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
@NoArgsConstructor
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarMapper mapper;
	
	public int insertCalendar(CalendarVO calendar) {
		
		log.info("캘린더 일정 추가 =============" + calendar);
		
		return mapper.insertCalendar(calendar);
	}
	
}
