package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.RoomVO;
import com.movie.biz.dto.ScheduleVO;
import com.movie.biz.dto.TheaterVO;

public interface TheaterService {
	
	/*
	 * 작성자: 허장욱
	 */
	void insertTheater(TheaterVO vo);

	List<TheaterVO> getTheaterLocal();
	
	List<TheaterVO> getTheaterList(String local); 
	
	TheaterVO getTheaterDetail(int numb);
	
	TheaterVO getTheaterNumbById(String name);
	
	List<RoomVO> getRoomListByTheater(int theater_numb);
	
	void updateTheater(int numb);
	
	/*
	 * 작성자: 양리나
	 */
	List<TheaterVO> theaterList();

	TheaterVO theaterName(ScheduleVO theater_numb);
}
