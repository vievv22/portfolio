package com.movie.biz.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SeatVO {

	private int id;			// 좌석 고유 식별자
	private String name;	// 좌석 이름
	private int room_id;	// 관 이름
}
