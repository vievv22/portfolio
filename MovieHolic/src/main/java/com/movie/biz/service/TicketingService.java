package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.TicketingVO;

import utils.Criteria;

public interface TicketingService {
	/*
	 * 작성자: 허장욱
	 */
	void insertTicketing(TicketingVO vo);
	
	List<TicketingVO> getTicketingListById(Criteria criteria, String user_id);
	
	int getcountTicketingList(String user_id);
	
	TicketingVO getTicketingDetail(int numb, String user_id);
	
	void cancelTicketing(int numb);
	
	List<TicketingVO> getAllTicketingList(Criteria criteria, String id);
	
	int getAllcountTicketingList(String id);
	
	/*
	 * 작성자: 양리나
	 */
	TicketingVO getTicketingSummary(int schedule_numb);
	
	List<TicketingVO> getAlreadySeatList(int schedule_numb);	
	
	TicketingVO getTotalCount();
	
	List<TicketingVO> getTicketingCountByMovie();
	
	TicketingVO getTotalPriceByMonth(int month);
}
