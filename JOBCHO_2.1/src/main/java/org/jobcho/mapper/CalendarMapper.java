package org.jobcho.mapper;

import java.util.List;

import org.jobcho.domain.ScheduleVO;

public interface CalendarMapper {
	
	int insertCalendar(ScheduleVO calendar);
	List<ScheduleVO> getListCalendar(ScheduleVO cal_num);
	int updateCalendar(ScheduleVO calendar);
	void deleteCalendar(int cal_num);

	
}
