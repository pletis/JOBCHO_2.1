package org.jobcho.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CalendarVO {
	private int cal_num;
	private String title;
	
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date starts;
	
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date ends;
	private int allday;
	private int isLive;
	
	
}
