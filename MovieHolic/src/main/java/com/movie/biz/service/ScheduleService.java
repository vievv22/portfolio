package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.ScheduleVO;

import utils.Criteria;

public interface ScheduleService {
	
	/*
	 * 작성자: 허장욱
	 */
	void insertSchedule(ScheduleVO vo);
	
	ScheduleVO getCheckSchedule(ScheduleVO vo);
	
	List<ScheduleVO> getScheduleListByTheater(Criteria criteria, String theater_name, String title);
	
	int getScheduleListByTheaterCount(String theater_name, String title);
	
	int checkDeleteSchedule(int numb);
	
	void deleteSchedule(int numb);

	List<MovieVO> getMovieList(int theater_numb);
	
	List<ScheduleVO> getScheduleList(String s_day, int theater_numb, int movie_numb);
	
	List<Integer> getEmptyCntList(int mnumb, int snumb);
	
	/*
	 * 작성자: 양리나
	 */
	List<ScheduleVO> getAllSchedule();
	
	ScheduleVO getTheaterNumb (int schedule_numb);
}
