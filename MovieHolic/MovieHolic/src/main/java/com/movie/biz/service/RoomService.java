package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.RoomVO;

public interface RoomService {
	
	/*
	 * 작성자: 허장욱
	 */
	void insertRoom(RoomVO vo);
	
	List<Integer> getRoomNumbByTheater(int theater_numb);

	List<RoomVO> getRoomListByTheater(int t_numb);
	
	/*
	 * 작성자: 양리나
	 */
	RoomVO getSeatCount(RoomVO vo);
}
