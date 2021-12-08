package org.jobcho.domain;

import java.util.Date;
import lombok.Data;

@Data
public class ScheduleVO {
	private String subject; // Á¦¸ñ
	
	//@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date startDate;
	
	//@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date endDate;
	private String memo;
	
	
}
