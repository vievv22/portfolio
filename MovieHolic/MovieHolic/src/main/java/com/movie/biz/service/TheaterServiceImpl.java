package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.TheaterDAO;
import com.movie.biz.dto.RoomVO;
import com.movie.biz.dto.ScheduleVO;
import com.movie.biz.dto.TheaterVO;

@Service
public class TheaterServiceImpl implements TheaterService {

	@Autowired
	private TheaterDAO theaterDao;
	
	/*
	 * 작성자: 허장욱
	 */
	@Override
	public void insertTheater(TheaterVO vo) {

		theaterDao.insertTheater(vo);
	}
	
	@Override
	public List<TheaterVO> getTheaterLocal() {
		
		return theaterDao.getTheaterLocal();
	}
	
	@Override
	public List<TheaterVO> getTheaterList(String local) {
		return theaterDao.getTheaterList(local);
	}
	
	@Override
	public TheaterVO getTheaterDetail(int numb) {

		return theaterDao.getTheaterDetail(numb);
	}
	
	@Override
	public TheaterVO getTheaterNumbById(String name) {

		return theaterDao.getTheaterNumbById(name);
	}

	@Override
	public List<RoomVO> getRoomListByTheater(int theater_numb) {
		return theaterDao.getRoomListByTheater(theater_numb);
	}

	@Override
	public void updateTheater(int numb) {
		theaterDao.updateTheater(numb);
	}

	/*
	 * 작성자: 양리나
	 */
	@Override
	public List<TheaterVO> theaterList() {

		return theaterDao.theaterList();
	}

	@Override
	public TheaterVO theaterName(ScheduleVO theater_numb) {
		return theaterDao.theaterName(theater_numb);
	}
}
