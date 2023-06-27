package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.NoticeDAO;
import com.movie.biz.dto.NoticeVO;

import utils.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {


	@Autowired
	private NoticeDAO noticeDao;
	



	@Override
	public NoticeVO getNotice(int numb) {
		
		return noticeDao.getNotice(numb);
	}

	
	

	// 회원 가입 등록
	@Override
	public void insertnotice(NoticeVO vo) {

		noticeDao.insertnotice(vo);
	}


	
	
	@Override
	public int countNoticeList(String name) {

		return noticeDao.countNoticeList(name);
	}

	


	@Override
	public List<NoticeVO> getListNoticeWithPaging(Criteria criteria, String name) {

		return noticeDao.listNoticeWithPaging(criteria, name);
	}







	@Override
	public List<NoticeVO> getListNotice(String name) {
		
		return noticeDao.getListNotice(name);
	}




	@Override
	public List<NoticeVO> getListNoticecustomer() {
		
		return noticeDao.listNoticecustomer();
	}
	
	

	@Override
	public List<NoticeVO> getListNoticeAdmin(NoticeVO vo) {
		
		return noticeDao.getListNoticeAdmin(vo);
	}




	@Override
	public void deleteNotice(int numb) {
		
		noticeDao.deleteNotice(numb);
	}




	@Override
	public void updateNotice(NoticeVO vo) {
		
		noticeDao.updateNotice(vo);
	}


	
}
