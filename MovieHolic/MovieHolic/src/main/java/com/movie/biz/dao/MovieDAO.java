package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.MovieVO;

import utils.Criteria;

@Repository
public class MovieDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/*
	 * 작성자: 허장욱
	 */
	public List<MovieVO> getAllMovieList() {
		System.out.println(mybatis.selectList("MovieMapper.getAllMovieList"));
		return mybatis.selectList("MovieMapper.getAllMovieList");
	}

	/*
	 * 작성자: 양리나
	 */
	public List<MovieVO> getNewMovieList() {

		return mybatis.selectList("MovieMapper.getNewMovieList");
	}

	public MovieVO getMovieName(int movie_numb) {

		return mybatis.selectOne("MovieMapper.getMovieName", movie_numb);
	}

	public MovieVO getPayPoster(int movie_numb) {

		return mybatis.selectOne("MovieMapper.getPayPoster", movie_numb);
	}

	/*
	 * 작성자: 조윤서
	 */
	// 영화 목록 조회 예매건수 순
	public List<MovieVO> movieList(MovieVO vo) {
		return mybatis.selectList("MovieMapper.movieList", vo);
	}

	// 영화 목록 조회 예매건수 순
	public List<MovieVO> movieList2(MovieVO vo) {
		return mybatis.selectList("MovieMapper.movieList2", vo);
	}

	// 현재상영/개봉예정 영화 셀렉용
	public List<MovieVO> movieList3(MovieVO vo) {
		return mybatis.selectList("MovieMapper.movieList3", vo);
	}

	// 영화 상세 정보 조회
	public MovieVO movieDetail(int numb) {
		return mybatis.selectOne("MovieMapper.movieDetail", numb);
	}

	// 영화 상세 정보 조회 관리자용
	public MovieVO movieDetail2(MovieVO vo) {
		return mybatis.selectOne("MovieMapper.movieDetail2", vo);
	}

	// 관리자용
	// 영화 등록
	public void movieInsert(MovieVO vo) {
		mybatis.insert("MovieMapper.movieInsert", vo);
	}

	// 영화 갯수 카운트
	public int countMovieList(String title) {
		return mybatis.selectOne("MovieMapper.countMovieList", title);
	}

	// 페이지별 영화 목록 조회
	public List<MovieVO> listMovieWithPaging(Criteria criteria, String title) {
		Map<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("title", title);

		return mybatis.selectList("MovieMapper.listMovieWithPaging", map);
	}

	// 영화리스트
	public List<MovieVO> listMovie(String title) {
		return mybatis.selectList("MovieMapper.listMovie", title);
	}

	// 영화 정보 수정
	public void movieUpdate(MovieVO vo) {
		mybatis.update("MovieMapper.movieUpdate", vo);
	}

	// 영화 종영 처리
	public void movieNy(int numb) {
		mybatis.update("MovieMapper.movieNy", numb);
	}

	// 영화 정보 삭제
	public void movieDelete(int numb) {
		mybatis.delete("MovieMapper.movieDelete", numb);
	}
	
	// 영화/스틸컷 동시저장용 넘버 가져오기
	public int numbselect(String title) {
		return mybatis.selectOne("MovieMapper.numbselect", title);
	}
	
	// 영화/스틸컷 동시저장용 넘버 가져오기
	public int numbselect2() {
		return mybatis.selectOne("MovieMapper.numbselect2");
	}
}
