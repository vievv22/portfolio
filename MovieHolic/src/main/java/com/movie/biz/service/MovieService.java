package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.MovieVO;

import utils.Criteria;

public interface MovieService {
	/*
	 * 작성자: 허장욱
	 */
	List<MovieVO> getAllMovieList();
	
	/*
	 * 작성자: 양리나
	 */
	List<MovieVO> getNewMovieList();

	MovieVO getMovieName(int movie_numb);
	
	MovieVO getPayPoster(int movie_numb);
	
	/*
	 * 작성자: 조윤서
	 */
	// 영화 목록 조회 예매건수 순
		List<MovieVO> getMovieList(MovieVO vo);
		
		// 영화 목록 조회 예매건수 순
		List<MovieVO> getMovieList2(MovieVO vo);
		
		// 현재상영/개봉예정 영화 셀렉용
		List<MovieVO> getMovieList3(MovieVO vo);

		// 영화 상세 정보 조회
		MovieVO getMovieDetail(int numb);

		
		// 관리자용
		// 영화 등록
		void movieInsert(MovieVO vo);
		
		// 영화 상세 정보 조회
		MovieVO getMovieDetail2(MovieVO vo);
		
		//영화 갯수 카운트
		int countMovieList(String title);
		
		// 페이징 처리
		List<MovieVO> getListMovieWithPaging(Criteria criteria, String title);
		
		//영화목록
		List<MovieVO> getlistMovie(String title);
		
		// 영화 정보 수정
		void movieUpdate(MovieVO vo);


		// 동시저장용 넘버 
		int numbselect(String title);
		
		int numbselect2();
}
