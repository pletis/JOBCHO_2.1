package org.jobcho.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CalendarVO implements Serializable{
	private int cal_num;
	private String cal_title;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date starts;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date ends;
	private int allday;
	private int isLive;
	
	
}
