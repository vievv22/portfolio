package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.NoticeVO;

import utils.Criteria;

public interface NoticeService {

	
	
	
	// 공지 상세 조회
	NoticeVO getNotice(int numb);

	// 공지 등록
	void insertnotice(NoticeVO vo);
	
	
	
	// 공지 리스트 페이징 조회
	int countNoticeList(String name);
	
	// 공지 리스트 페이징 조회
	List<NoticeVO> getListNoticeWithPaging(Criteria criteria, String name);

	
	// 공지 리스트 페이징 조회
	List<NoticeVO> getListNotice(String name);

	// 공지 최신 5개 조회
	List<NoticeVO> getListNoticecustomer();

	//공지 리스트 admin 조회
	List<NoticeVO> getListNoticeAdmin(NoticeVO vo);

	void deleteNotice(int numb);
	
	void updateNotice(NoticeVO vo);

}
