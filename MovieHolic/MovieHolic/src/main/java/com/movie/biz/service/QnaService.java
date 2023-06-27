package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.QnaVO;

import utils.Criteria;

public interface QnaService {


	// 전체 QnA 목록을 조회
	List<QnaVO> getListQna(String id);

	// 일련번호 별 게시글 한 건 조회
	QnaVO getQna(int numb);

	// 게시글 insert
	void insertQna(QnaVO vo);

	// 관리자 페이지 QnA 리스트
	public List<QnaVO> listAllQna();
		
		
	// 관리자 QnA 답변 저장
	public void updateQna(QnaVO vo);
	
	
	

	// Qna 목록 조회 페이징 처리(관리자 페이지) 
	int countQnaList(String name);

	
	// Qna 목록 조회 페이징 처리(관리자 페이지) 
	List<QnaVO> getQnaList(String name);
	
	
	// Qna 목록 조회 페이징 처리(관리자 페이지) 
	List<QnaVO> getListQnaWithPaging(Criteria criteria, String name);
	
	
	
	

	// Qna 목록 조회 페이징 처리(관리자 페이지) 
	int countQnaListUser(String name, String userId);

	
	// Qna 목록 조회 페이징 처리(관리자 페이지) 
	List<QnaVO> getQnaListUser(String name, String userId);
	
	// Qna 목록 조회 페이징 처리
	List<QnaVO> getListQnaWithPagingUser(Criteria criteria, String name, String userId);

	// 관리자 대시보드: 답글달지 않은 총 qna 수 조회
		QnaVO getTotalQnaCount();

		
	//qna amdin에서 삭제
	void deleteQna(int numb);
	
	
	//qna 멤버쪽에서 삭제
	void memberQnaDelete(int numb);

	
}