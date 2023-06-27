package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.QnaDAO;
import com.movie.biz.dto.QnaVO;

import utils.Criteria;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	
	@Override
	public List<QnaVO> getListQna(String id) {

		return qnaDao.listQna(id);
	}

	
	
	
	@Override
	public QnaVO getQna(int numb) {


		return qnaDao.getQna(numb);
	}

	
	
	
	@Override
	public void insertQna(QnaVO vo) {
		
		qnaDao.insertQna(vo);
	}




	@Override
	public List<QnaVO> listAllQna() {

		return qnaDao.listAllQna();
	}




	@Override
	public void updateQna(QnaVO vo) {
		
		qnaDao.updateQna(vo);

	}




	@Override
	public int countQnaList(String name) {
		
		return qnaDao.countQnaList(name);
	}




	@Override
	public List<QnaVO> getQnaList(String name) {
		
		return qnaDao.getQnaList(name);
	}

	
	@Override
	public List<QnaVO> getListQnaWithPaging(Criteria criteria, String name) {
		
		return qnaDao.listQnaWithPaging(criteria, name);
	}
	
	
	@Override
	public int countQnaListUser(String name, String userId) {
		
		return qnaDao.countQnaListUser(name, userId);
	}




	@Override
	public List<QnaVO> getQnaListUser(String name, String userId) {
		
		return qnaDao.getQnaListUser(name, userId);
	}

	
	@Override
	public List<QnaVO> getListQnaWithPagingUser(Criteria criteria, String name, String userId) {
		
		return qnaDao.listQnaWithPagingUser(criteria, name, userId);
	}
	
	
	
	

	@Override
	public QnaVO getTotalQnaCount() {
		return qnaDao.getTotalQnaCount();
	}




	@Override
	public void deleteQna(int numb) {
		
		qnaDao.deleteQna(numb);
	}
	
	
	

	@Override
	public void memberQnaDelete(int numb) {
		
		qnaDao.memberQnaDelete(numb);
	}
	
	
	
	
	
	
	
	
	
}
