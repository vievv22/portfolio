package com.movie.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.RoomVO;

@Repository
public class RoomDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	 * 작성자: 허장욱
	 */
	// 관 등록
	public void insertRoom(RoomVO vo) {
		mybatis.insert("RoomMapper.insertRoom", vo);
	}
	
	// 극장번호로 관 아이디 불러오기
	public List<Integer> getRoomNumbByTheater(int theater_numb) {
		return mybatis.selectList("RoomMapper.getRoomIdByTheater", theater_numb);
	}
	
	// 극장번호로 관정보 불러오기
	public List<RoomVO> getRoomListByTheater(int t_numb) {
		return mybatis.selectList("RoomMapper.getRoomListByTheater", t_numb);
	}
	
	/*
	 * 작성자: 양리나
	 */
	public RoomVO getSeatCount(RoomVO vo) {
		
		return mybatis.selectOne("RoomMapper.getSeatCount", vo);
	}
}
