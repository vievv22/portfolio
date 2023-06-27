package com.movie.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	private int numb;	// 상영 일정 번호
	private String s_day;	// 상영일
	private String start_time;	// 시작 시간
	private String end_time;		// 종료 시간
	private Date regdate;		// 일정 등록일
	private int theater_numb;	// 극장 번호
	private int movie_numb;		// 영화 번호
	private String room_numb;	// 관 번호
	
	// 기타 필요 정보
	private String start_day;	// 시작일
	private String end_day;	// 종료 일
	private String start_times[];
	private String end_times[];
	private String theater_name; // 극장 이름
	private String title;	// 영화 제목
	private int age;		// 연령 제한
	private int scnt;		// 해당 관의 총 좌석 수
	private String ecnt;		// 남은 좌석 수
	private String rnumb;		// 관 이름
	
	// 예매가 있는지 확인
	private int count;
	
	// 쓰레기 값
	private int rn;
}
