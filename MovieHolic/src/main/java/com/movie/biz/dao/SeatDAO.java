package com.movie.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.SeatVO;

@Repository
public class SeatDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	 * 작성자: 허장욱
	 */
	public void insertSeat(SeatVO vo) {
		mybatis.insert("SeatMapper.insertSeat", vo);
	}
	
	/*
	 * 작성자: 양리나
	 */
	public List<SeatVO> getSeatList(String room){
		
		return mybatis.selectList("SeatMapper.getSeatList", room);
	}
}
