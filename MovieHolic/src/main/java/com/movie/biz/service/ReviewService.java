package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.ReviewVO;

public interface ReviewService {

	// 리뷰 등록
	void inseretReview(ReviewVO vo);
	
	// 리뷰리스트
	List<ReviewVO> reviewList(int movie_numb);

	ReviewVO reviewCheck(String user_id, int ticketing_numb);
	
	List<ReviewVO> reviewList2(String user_id);
	
	void deleteReview(int numb);
}