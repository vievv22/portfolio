package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.RoomDAO;
import com.movie.biz.dto.RoomVO;

@Service
public class RoomServiceImpl implements RoomService {

	/*
	 * 작성자: 허장욱
	 */
	@Autowired
	private RoomDAO roomDao;
	
	@Override
	public void insertRoom(RoomVO vo) {
		
		roomDao.insertRoom(vo);
	}
	
	@Override
	public List<Integer> getRoomNumbByTheater(int theater_numb) {

		return roomDao.getRoomNumbByTheater(theater_numb);
	}
	
	@Override
	public List<RoomVO> getRoomListByTheater(int t_numb) {
		
		return roomDao.getRoomListByTheater(t_numb);
	}

	/*
	 * 작성자: 양리나
	 */
	@Override
	public RoomVO getSeatCount(RoomVO vo) {
		return roomDao.getSeatCount(vo);
	}
}
