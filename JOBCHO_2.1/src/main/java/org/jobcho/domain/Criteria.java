package org.jobcho.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { //페이지 처리 도메인
	
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10); //페이지 디폴트값 설정
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
