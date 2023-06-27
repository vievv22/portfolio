package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.ScheduleVO;

import utils.Criteria;

@Repository
public class ScheduleDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/* 
	 * 작성자: 허장욱
	 */
	// 관리자: 상영 일정 등록
	public void insertSchedule(ScheduleVO vo) {
		System.out.println(vo);
		mybatis.insert("ScheduleMapper.insertSchedule", vo);
	}
	
	// 관리자: 상영 일정 등록 시 일정 존재여부 확인
	public ScheduleVO getCheckSchedule(ScheduleVO vo) {
		return mybatis.selectOne("ScheduleMapper.checkSchedule", vo);
	}
	
	// 관리자: 상영 일정 목록 조회(극장 이름으로 검색)
	public List<ScheduleVO> getScheduleListByTheater(Criteria criteria, String theater_name, String title){
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("criteria", criteria);
		parameters.put("theater_name", theater_name);
		parameters.put("title", title);
		
		return mybatis.selectList("ScheduleMapper.scheduleListByTheater", parameters);
	}
	
	public int getScheduleListByTheaterCount(String theater_name, String title) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("theater_name", theater_name);
		parameters.put("title", title);
		
		return mybatis.selectOne("ScheduleMapper.scheduleListByTheaterCount", parameters);
	}
	
	// 관리자: 상영 일정 삭제 가능여부 확인
	public int checkDeleteSchedule(int numb) {
		System.out.println(numb);
		return mybatis.selectOne("ScheduleMapper.checkDeleteSchedule", numb);
	}
	
	// 관리자: 상영 일정 삭제
	public void deleteSchedule(int numb) {
		mybatis.delete("ScheduleMapper.deleteSchedule", numb);
	}
	
	// 예매 페이지: 해당 극장에서 상영하는 영화 정보 불러오기
	public List<MovieVO> getMovieList(int theater_numb) {
		System.out.println(theater_numb);
		System.out.println("에러 전");
		System.out.println(mybatis.selectList("ScheduleMapper.getMovieList", theater_numb));
		return mybatis.selectList("ScheduleMapper.getMovieList", theater_numb);
	}
	
	// 예매 페이지: 상영 일정 및 정보 불러오기
	public List<ScheduleVO> getScheduleList(String s_day, int theater_numb, int movie_numb) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("s_day", s_day);
		parameters.put("theater_numb", theater_numb);
		parameters.put("movie_numb", movie_numb);
		System.out.println(parameters);
		
		System.out.println(mybatis.selectList("ScheduleMapper.getScheduleList", parameters));
		return mybatis.selectList("ScheduleMapper.getScheduleList", parameters);
	}
	
	// 예매 페이지: 남은 좌석 수 불러오기
	public List<Integer> getEmptyCntList(int mnumb, int snumb){
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("mnumb", mnumb);
		parameters.put("snumb", snumb);
		
		System.out.println("남은 좌석 수 확인입니다=======>");
		System.out.println(parameters);
		
		return mybatis.selectList("ScheduleMapper.getEmptyCount", parameters);
	}
	
	/*
	 * 작성자: 양리나
	 */
	public List<ScheduleVO> getAllSchedule(){
		
		return mybatis.selectList("ScheduleMapper.getAllSchedule");
	}

	public ScheduleVO getTheaterNumb (int schedule_numb) {
		
		return mybatis.selectOne("ScheduleMapper.getTheaterNumb", schedule_numb);
	}
}
