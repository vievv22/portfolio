package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.NoticeVO;

import utils.Criteria;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	

	
	
	// 공지사항 목록 조회 페이징 처리
	public int countNoticeList(String name) {

		return mybatis.selectOne("NoticeMapper.countNoticeList", name);
	}

	// 공지사항 목록 조회 페이징 처리
	public List<NoticeVO> getListNotice(String name) {
			
		return mybatis.selectList("NoticeMapper.listNotice", name);
			
	}
		
	// 공지사항 목록 조회 페이징 처리
	public List<NoticeVO> listNoticeWithPaging(Criteria criteria, String name) {
			
		Map<String, Object> map = new HashMap<>();
			
		map.put("criteria", criteria);
		map.put("name", name);
			
		return mybatis.selectList("NoticeMapper.listNoticeWithPaging", map);
			
	}
	

	
	// 공지사항 목록 admin 조회
	public List<NoticeVO> getListNoticeAdmin(NoticeVO vo) {
			
		return mybatis.selectList("NoticeMapper.listNoticeAdmin", vo);
			
	}
		
	
	// 번호 별 공지사항 한 건 조회
	public NoticeVO getNotice(int numb) {
	
		
		return mybatis.selectOne("NoticeMapper.noticeView", numb);
	
		
	}
	
	// 공지사항 등록
	public void insertnotice(NoticeVO vo) {
		
		
		mybatis.insert("NoticeMapper.insertnotice", vo);
		
	}
	
	// 공지사항 삭제
	public void deleteNotice(int numb) {
		
		mybatis.delete("NoticeMapper.deleteNotice", numb);
	}
	
	// 공지사항 수정
	public void updateNotice(NoticeVO vo) {
		
		mybatis.update("NoticeMapper.updateNotice", vo);
	}
	
	
	
	
	
	// 공지사항 5개 조회
	public  List<NoticeVO> listNoticecustomer() {
			
			
		
		return mybatis.selectList("NoticeMapper.listNotice5");
			
	}


		
	
}
