package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.PosterVO;

@Repository("PosterDAO")
public class PosterDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 스틸컷용 포스터 등록
	public void stillcutInsert(PosterVO vo) {
		mybatis.insert("PosterMapper.stillcutInsert", vo);
	}

	// 스틸컷 출력
	public List<String> stillcutView(int movie_numb) {
		return mybatis.selectList("PosterMapper.stillcutView", movie_numb);
	}


	// 스틸컷 삭제
	public void stillcutdelete(int movie_numb, String stillcut) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("movie_numb", movie_numb);
		parameters.put("stillcut", stillcut);
		
		mybatis.delete("PosterMapper.stillcutdelete", parameters);
	}

}
