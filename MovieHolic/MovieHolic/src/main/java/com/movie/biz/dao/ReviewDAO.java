package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 리뷰 등록
	public void inseretReview(ReviewVO vo) {
		mybatis.insert("ReviewMapper.inseretReview", vo);
	}
	
	// 리뷰리스트
	public List<ReviewVO> reviewList(int movie_numb) {
		return mybatis.selectList("ReviewMapper.reviewList", movie_numb);
	}
	
	// 리뷰 작성여부 확인
	public ReviewVO reviewCheck(String user_id, int ticketing_numb)  {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("user_id", user_id);
		parameters.put("ticketing_numb", ticketing_numb);
		
		return mybatis.selectOne("ReviewMapper.reviewCheck", parameters);
	}
	
	// 리뷰리스트 id별 내역
	public List<ReviewVO> reviewList2(String user_id) {
		return mybatis.selectList("ReviewMapper.reviewList2", user_id);
	}
	
	// 리뷰 삭제
	public void deleteReview(int numb) {
		mybatis.delete("ReviewMapper.deleteReview", numb);
	}

}
