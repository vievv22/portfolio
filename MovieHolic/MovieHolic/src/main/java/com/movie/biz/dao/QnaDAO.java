package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.QnaVO;

import utils.Criteria;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 전체 QnA 목록을 조회
	public List<QnaVO> listQna(String user_id) {
	

		return mybatis.selectList("QnaMapper.listQna", user_id);
	
	}
	
	
	
	// 일련번호 별 게시글 한 건 조회
	public QnaVO getQna(int numb) {
	
		
		return mybatis.selectOne("QnaMapper.getQna", numb);
	
	}
	
	
	
	// 게시글 insert
	public void insertQna(QnaVO vo) {
	

	
		mybatis.insert("QnaMapper.insertQna", vo);
	
	
	
	}
	
	// 관리자 페이지 QnA 리스트
	public List<QnaVO> listAllQna(){
			
		return mybatis.selectList("QnaMapper.listAllQna");
		
	}
	
	
	// 관리자 QnA 답변 저장
	public void updateQna(QnaVO vo) {
		
		mybatis.update("QnaMapper.updateQna", vo);
	}



	public int countQnaList(String name) {

		return mybatis.selectOne("QnaMapper.countQnaList", name);
	}



	public List<QnaVO> getQnaList(String name) {

		return mybatis.selectList("QnaMapper.QnaList", name);
	}



	public List<QnaVO> listQnaWithPaging(Criteria criteria, String name) {

		Map<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("name", name);
		
		return mybatis.selectList("QnaMapper.listQnaWithPaging", map);
		
	}
	

	public int countQnaListUser(String name, String userId) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("name", name);
	    map.put("userId", userId);
	    return mybatis.selectOne("QnaMapper.countQnaListUser", map);
	}


	public List<QnaVO> getQnaListUser(String name, String userId) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("name", name);
	    map.put("userId", userId);
	    return mybatis.selectList("QnaMapper.getQnaListUser", map);
	}


	public List<QnaVO> listQnaWithPagingUser(Criteria criteria, String name, String userId) {

		Map<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("name", name);
		map.put("userId", userId);
		
		return mybatis.selectList("QnaMapper.listQnaWithPagingUser", map);
		
	}
	// 관리자 대시보드: 답글달지 않은 총 qna 수 조회
	public QnaVO getTotalQnaCount() {
		
		return mybatis.selectOne("QnaMapper.getTotalQnaCount");
	}



	public void deleteQna(int numb) {
		
		mybatis.delete("QnaMapper.deleteQna", numb);
	}



	public void memberQnaDelete(int numb) {
		mybatis.delete("QnaMapper.deleteQna", numb);
	}
	
	
	
}
