package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.TicketingDAO;
import com.movie.biz.dto.TicketingVO;

import utils.Criteria;

@Service
public class TicketingServiceImpl implements TicketingService {

	@Autowired
	private TicketingDAO ticketingDao;
	
	/*
	 * 작성자: 허장욱
	 */
	@Override
	public void insertTicketing(TicketingVO vo) {
		
		ticketingDao.insertTicketing(vo);
	}
	
	@Override
	public List<TicketingVO> getTicketingListById(Criteria criteria, String user_id) {

		return ticketingDao.getTicketingListById(criteria, user_id);
	}
	
	@Override
	public int getcountTicketingList(String user_id) {

		return ticketingDao.getcountTicketingList(user_id);
	}
	
	@Override
	public TicketingVO getTicketingDetail(int numb, String user_id) {

		return ticketingDao.getTicketingDetail(numb, user_id);
	}
	

	@Override
	public void cancelTicketing(int numb) {
		ticketingDao.cancelTicketing(numb);
		
	}
	
	@Override
	public List<TicketingVO> getAllTicketingList(Criteria criteria, String id) {
		
		return ticketingDao.getAllTicketingList(criteria, id);
	}

	@Override
	public int getAllcountTicketingList(String id) {
		
		return ticketingDao.getAllcountTicketingList(id);
	}
	
	/*
	 * 작성자: 양리나
	 */
	@Override
	public TicketingVO getTicketingSummary(int schedule_numb) {
		return ticketingDao.getTicketingSummary(schedule_numb);
	}

	@Override
	public List<TicketingVO> getAlreadySeatList(int schedule_numb) {
		return ticketingDao.getAlreadySeatList(schedule_numb);
	}

	@Override
	public TicketingVO getTotalCount() {
		
		return ticketingDao.getTotalCount();
	}

	@Override
	public List<TicketingVO> getTicketingCountByMovie() {

		return ticketingDao.getTicketingCountByMovie();
	}

	@Override
	public TicketingVO getTotalPriceByMonth(int month) {
		
		return ticketingDao.getTotalPriceByMonth(month);
	}

}
