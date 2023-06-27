package com.movie.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.RoomVO;
import com.movie.biz.dto.ScheduleVO;
import com.movie.biz.dto.TheaterVO;

@Repository
public class TheaterDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	 * 작성자: 허장욱
	 */
	// 관리자: 극장 등록
	public void insertTheater(TheaterVO vo) {
		mybatis.update("TheaterMapper.insertTheater", vo);
	}
	
	// 예매 페이지: 극장 지역 정보 불러오기
	public List<TheaterVO> getTheaterLocal() {
		System.out.println(mybatis.selectList("TheaterMapper.getTheaterByLocal"));
		return mybatis.selectList("TheaterMapper.getTheaterByLocal");
	}
	
	// 예매 페이지: 지역에 속하는 극장 이름 불러오기
	public List<TheaterVO> getTheaterList(String local) {
		System.out.println("지역에 속하는 극장 이름 불러오기");
		System.out.println(mybatis.selectList("TheaterMapper.getTheaterList", local));
		return mybatis.selectList("TheaterMapper.getTheaterList", local);
	}

	// 해당 극장의 정보 조회
	public TheaterVO getTheaterDetail(int numb) {
		return mybatis.selectOne("TheaterMapper.getTheaterDetail", numb);
	}
	
	// 해당 극장의 번호를 이름으로 조회
	public TheaterVO getTheaterNumbById(String name) {
		return mybatis.selectOne("TheaterMapper.getTheaterNumbByName", name);
	}
	
	// 관리자 상영일정 등록 페이지: 극장이 보유하고 있는 관 정보 불러오기
	public List<RoomVO> getRoomListByTheater(int theater_numb) {
		System.out.println(mybatis.selectList("TheaterMapper.getRoomListByTheater", theater_numb));
		return mybatis.selectList("TheaterMapper.getRoomListByTheater", theater_numb);
	}
	
	// 관리자: 극장 폐점 처리
	public void updateTheater(int numb) {
		mybatis.update("TheaterMapper.updateTheater", numb);
	}
	
	/*
	 * 작성자: 양리나
	 */
	public List<TheaterVO>theaterList(){
		
		return mybatis.selectList("TheaterMapper.theaterList");
	}
	
	public TheaterVO theaterName(ScheduleVO theater_numb) {
		
		return mybatis.selectOne("TheaterMapper.theaterName", theater_numb);
	}
}
