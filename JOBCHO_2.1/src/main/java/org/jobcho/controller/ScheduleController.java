package org.jobcho.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jobcho.domain.ScheduleVO;
import org.jobcho.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/schedule/*")
@Log4j
public class ScheduleController {
	@Autowired
	private ScheduleService service;
	
	
	@RequestMapping(value="/new", method = RequestMethod.POST)
	public Map<Object, Object> insertSchedule(@RequestBody ScheduleVO dto) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		log.info("insertSchedule ==================" + dto);
		
		service.addSchedule(dto);
		
		
		return map;				
	}
	
	// s
	@GetMapping(value = "/schedule")
	public String getListSchedule(Model model)throws Exception{
		
		model.addAttribute("showSchedule", service.getListSchedule());
		
		return "/schedule";
		
	}
	/*
	//�룷�뒪�듃留� o
	@PutMapping(value = "/{cal_num}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<CalendarVO> updateCalendar(@PathVariable("cal_num") int cal_num,
																				@RequestBody CalendarVO calendar){
		log.info("putMapping ==================" + cal_num);
		
		calendar.setCal_num(cal_num);
		int updateCount = service.updateCalendar(calendar);
		
		return  updateCount == 1
				? new ResponseEntity<>(HttpStatus.OK)
				:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//�룷�뒪�듃留� o
	@DeleteMapping(value = "/{cal_num}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteCalendar(@PathVariable int cal_num){
		
		log.info("DeleteMapping ==================" + cal_num);
		service.deleteCalendar(cal_num);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	*/
	
	
	
	
	
	
	
	
	
}
