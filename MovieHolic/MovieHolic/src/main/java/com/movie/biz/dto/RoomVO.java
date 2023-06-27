package com.movie.biz.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RoomVO {
	private String id;		// 상영관 일련번호
	private int numb;		// 상영관 이름
	private int cnt;		// 좌석 수
	private int theater_numb;	// 극장 번호
}
