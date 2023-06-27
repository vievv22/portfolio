package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.MovieDAO;
import com.movie.biz.dto.MovieVO;

import utils.Criteria;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDAO movieDao;

	/*
	 * 작성자: 허장욱
	 */
	@Override
	public List<MovieVO> getAllMovieList() {

		return movieDao.getAllMovieList();
	}

	/*
	 * 작성자: 양리나
	 */
	@Override
	public List<MovieVO> getNewMovieList() {

		return movieDao.getNewMovieList();
	}

	@Override
	public MovieVO getMovieName(int movie_numb) {
		return movieDao.getMovieName(movie_numb);
	}

	@Override
	public MovieVO getPayPoster(int movie_numb) {
		return movieDao.getPayPoster(movie_numb);
	}

	/*
	 * 작성자: 조윤서
	 */
	@Override
	public List<MovieVO> getMovieList(MovieVO vo) {

		return movieDao.movieList(vo);
	}

	@Override
	public List<MovieVO> getMovieList2(MovieVO vo) {

		return movieDao.movieList2(vo);
	}

	@Override
	public MovieVO getMovieDetail(int numb) {

		return movieDao.movieDetail(numb);
	}

	// 밑으로 관리자용
	@Override
	public void movieInsert(MovieVO vo) {

		movieDao.movieInsert(vo);
	}

	@Override
	public int countMovieList(String title) {

		return movieDao.countMovieList(title);
	}

	@Override
	public List<MovieVO> getlistMovie(String title) {

		return movieDao.listMovie(title);
	}

	@Override
	public void movieUpdate(MovieVO vo) {

		movieDao.movieUpdate(vo);
	}

	@Override
	public List<MovieVO> getListMovieWithPaging(Criteria criteria, String title) {

		return movieDao.listMovieWithPaging(criteria, title);
	}

	@Override
	public MovieVO getMovieDetail2(MovieVO vo) {

		return movieDao.movieDetail2(vo);
	}

	@Override
	public List<MovieVO> getMovieList3(MovieVO vo) {

		return movieDao.movieList3(vo);
	}

	@Override
	public int numbselect(String title) {

		return movieDao.numbselect(title);
	}

	@Override
	public int numbselect2() {
		return movieDao.numbselect2();
	}
}
