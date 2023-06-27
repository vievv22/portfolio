package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.ReviewDAO;
import com.movie.biz.dto.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDao;
	
	@Override
	public void inseretReview(ReviewVO vo) {
		reviewDao.inseretReview(vo);
	}

	@Override
	public List<ReviewVO> reviewList(int movie_numb) {
		return reviewDao.reviewList(movie_numb);
	}

	@Override
	public ReviewVO reviewCheck(String user_id, int ticketing_numb) {
		return reviewDao.reviewCheck(user_id, ticketing_numb);
	}

	@Override
	public List<ReviewVO> reviewList2(String user_id) {
		return reviewDao.reviewList2(user_id);
	}

	@Override
	public void deleteReview(int numb) {
		reviewDao.deleteReview(numb);
		
	}

}
