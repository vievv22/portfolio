package com.movie.biz.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TheaterVO {	
	private int numb;	// 극장 번호
	private String name;	// 극장 이름
	private String local;	// 극장 지역
	private String address;	// 극장 상세주소
	private int room;	// 총 관 수
	private int seat;	// 총 좌석 수
	private Date regdate;  // 극장 등록일
	private String useyn;  // 폐장 여부
}
