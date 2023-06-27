package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.PosterDAO;
import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.PosterVO;

@Service
public class PosterServiceImpl implements PosterService {

	@Autowired
	private PosterDAO posterDao;
	
	@Override
	public void stillcutInsert(PosterVO vo) {
		
		posterDao.stillcutInsert(vo);
	}

	@Override
	public List<String> stillcutView(int movie_numb) {
		
		return posterDao.stillcutView(movie_numb);
	}

	@Override
	public void stillcutdelete(int movie_numb, String stillcut) {
		posterDao.stillcutdelete(movie_numb, stillcut);
		
	}

	
	

	

}
