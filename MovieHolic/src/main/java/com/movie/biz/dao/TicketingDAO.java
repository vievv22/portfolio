package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.TicketingVO;

import utils.Criteria;

@Repository
public class TicketingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	 * 작성자: 허장욱
	 */
	// 사용자: 예매하기
	public void insertTicketing(TicketingVO vo) {
		mybatis.insert("TicketingMapper.insertTicketing", vo);
	}
	
	// 사용자: 예매 목록 조회
	public List<TicketingVO> getTicketingListById(Criteria criteria, String user_id) {
		System.out.println("사용자: 예매 목록 조회");
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("criteria", criteria);
		parameters.put("user_id", user_id);

		System.out.println(mybatis.selectList("TicketingMapper.getTicketingListById", parameters));
		return mybatis.selectList("TicketingMapper.getTicketingListById", parameters);
		
	}
	
	// 사용자: 예매 목록 조회를 위한 페이징 처리
	public int getcountTicketingList(String user_id) {
		return mybatis.selectOne("TicketingMapper.countTicketingList", user_id);
	}
	
	// 사용자: 예매 상세정보 조회
	public TicketingVO getTicketingDetail(int numb, String user_id) {
		Map<String, Object> parameters = new HashMap<>();
		
		parameters.put("numb", numb);
		parameters.put("user_id", user_id);
		System.out.println("사용자: 예매 상세정보 조회");
		return mybatis.selectOne("TicketingMapper.getTicketingDetail", parameters);
	}
	
	// 사용자: 예매 취소 처리
	public void cancelTicketing(int numb) {
		mybatis.update("TicketingMapper.cancelTicketing", numb);
	}
	
	// 관리자: 모든 예매 목록 조회
	public List<TicketingVO> getAllTicketingList(Criteria criteria, String id) {
		System.out.println("관리자: 모든 예매 목록 조회");
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("criteria", criteria);
		parameters.put("id", id);
		
		System.out.println(mybatis.selectList("TicketingMapper.getAllTicketingList", parameters));
		return mybatis.selectList("TicketingMapper.getAllTicketingList", parameters);
	}
	
	// 관리자: 모든 예매 목록 카운트(페이징 처리)
	public int getAllcountTicketingList(String id) {
		return mybatis.selectOne("TicketingMapper.getAllcountTicketingList", id);
	}
	
	/*
	 * 작성자: 양리나
	 */
	public TicketingVO getTicketingSummary(int schedule_numb) {

		return mybatis.selectOne("TicketingMapper.getTicketingSummary", schedule_numb);
        
    }
	
	public List<TicketingVO> getAlreadySeatList(int schedule_numb) {
		
		return mybatis.selectList("TicketingMapper.getAlreadySeatList", schedule_numb);
	}
	
	// 관리자 대시보드: 결제금액합산, 총 예매건수
	public TicketingVO getTotalCount() {
		
		return mybatis.selectOne("TicketingMapper.getTotalCount");
	}
	
	// 관리자 대시보드: 영화 예매 차트 생성
	public List<TicketingVO> getTicketingCountByMovie() {
		
		return mybatis.selectList("TicketingMapper.getTicketingCountByMovie");
	}
	
	public TicketingVO getTotalPriceByMonth(int month) {
		
		return mybatis.selectOne("TicketingMapper.getTotalPriceByMonth", month);
	}
}
