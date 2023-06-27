package com.movie.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TicketingVO {
	// 기본 컬럼
	private int numb;		// 예매 번호
	private int p_num;		// 예약 인원
	private int price;		// 가격
	private String seat_name;	// 좌석 번호
	private Date regdate;		// 예매 등록일
	private String cancelyn;	// 취소 여부
	private String user_id;		// 사용자 ID
	private int schedule_numb;	// 상영 일정 번호
	private int movie_numb;		// 영화 번호
	
	// 추가 정보 컬럼
	private int total_p_num;	//예매 된 좌석
	private String th_name;		// 극장 이름
	private String r_numb;		// 관 번호
	private Date start_day;		// 상영 시작일
	private String start_time;	// 상영 시작시간
	private String end_time;	// 상영 종료시간
	private String movie_title;	// 영화 제목
	private String poster_url;	// 영화 메인포스터
	private int age;			// 영화 관람등급
	private int reviewCheck;	// 리뷰 확인
	
	private int totalPrice;		// 결제금액 합산
	private int totalTicketing;	// 총 예매건수
	private int movie_count;	// 영화 예매 건수
	private int month;			// 월별 결제총합
	
	// Garbage 정보
	private int rn;				// 행 번호
}
