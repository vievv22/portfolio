package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.SeatVO;

public interface SeatService {

	/*
	 * 작성자: 허장욱
	 */
	void insertSeat(SeatVO vo);
	
	/*
	 * 작성자: 양리나
	 */
	List<SeatVO> getSeatList(String room);
}
