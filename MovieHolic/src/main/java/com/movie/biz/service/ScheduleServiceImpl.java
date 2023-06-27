package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.ScheduleDAO;
import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.ScheduleVO;

import utils.Criteria;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDAO scheduleDao;
	
	/*
	 * 작성자: 허장욱
	 */
	@Override
	public void insertSchedule(ScheduleVO vo) {
		
		scheduleDao.insertSchedule(vo);
	}

	@Override
	public ScheduleVO getCheckSchedule(ScheduleVO vo) {
		
		return scheduleDao.getCheckSchedule(vo);
	}
	
	@Override
	public List<ScheduleVO> getScheduleListByTheater(Criteria criteria,String theater_name, String title) {

		return scheduleDao.getScheduleListByTheater(criteria, theater_name, title);
	}
	
	@Override
	public int getScheduleListByTheaterCount(String theater_name, String title) {

		return scheduleDao.getScheduleListByTheaterCount(theater_name, title);
	}
	
	@Override
	public int checkDeleteSchedule(int numb) {
		return scheduleDao.checkDeleteSchedule(numb);
	}	
	
	@Override
	public void deleteSchedule(int numb) {
		
		scheduleDao.deleteSchedule(numb);
	}
	
	@Override
	public List<MovieVO> getMovieList(int theater_numb) {
		
		return scheduleDao.getMovieList(theater_numb);
	}

	@Override
	public List<ScheduleVO> getScheduleList(String s_day, int theater_numb, int movie_numb) {
		
		return scheduleDao.getScheduleList(s_day, theater_numb, movie_numb);
	}

	@Override
	public List<Integer> getEmptyCntList(int mnumb, int snumb) {

		return scheduleDao.getEmptyCntList(mnumb, snumb);
	}

	/*
	 * 작성자: 양리나
	 */
	@Override
	public List<ScheduleVO> getAllSchedule() {
		return scheduleDao.getAllSchedule();
	}

	@Override
	public ScheduleVO getTheaterNumb(int schedule_numb) {
		return scheduleDao.getTheaterNumb(schedule_numb);
	}

}
