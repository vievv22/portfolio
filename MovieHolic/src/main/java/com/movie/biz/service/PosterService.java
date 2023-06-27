package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.MovieVO;
import com.movie.biz.dto.PosterVO;

public interface PosterService {

	// 스틸컷용 포스터 등록
	void stillcutInsert(PosterVO vo);
	
	// 스틸컷 출력
	List<String> stillcutView(int movie_numb);

	// 스틸컷 삭제
	void stillcutdelete(int movie_numb, String stillcut);
}
