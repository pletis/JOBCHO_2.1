package org.jobcho.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class CalendarVO implements Serializable{
	private int cal_num;
	private String cal_title;
	private Date starts;
	private Date ends;
	private int allday;
	private int isLive;
	
	
}
