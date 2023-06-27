package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.SeatDAO;
import com.movie.biz.dto.SeatVO;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatDAO seatDao;
	
	/*
	 * 작성자: 허장욱
	 */
	@Override
	public void insertSeat(SeatVO vo) {

		seatDao.insertSeat(vo);
	}

	/*
	 * 작성자: 양리나
	 */
	@Override
	public List<SeatVO> getSeatList(String room) {
		return seatDao.getSeatList(room);
	}
}
