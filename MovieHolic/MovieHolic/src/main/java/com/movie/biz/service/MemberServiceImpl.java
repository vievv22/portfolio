package com.movie.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.biz.dao.MemberDAO;
import com.movie.biz.dto.MemberVO;

import utils.Criteria;

@Service
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private MemberDAO memberDao;
	
	
	
	// 회원 id를 조건으로 사용자 정보 조회
	@Override
	public MemberVO getMember(String id) {
		
		return memberDao.getMember(id);
	}

	
	
	// 회원 존재 여부 조회
	@Override
	public int confirmID(String id) {

		return memberDao.confirmID(id);
	}
	
	
	// 회원 로그인 인증
	@Override
	public int loginID(MemberVO vo) {

		return memberDao.loginID(vo);
	}
	
	
	
	// 회원 가입 등록
	@Override
	public void insertMember(MemberVO vo) {

		memberDao.insertMember(vo);
	}



	//이름과 이메일로 아이디 찾기
	@Override
	public String selectIdByNameEmail(MemberVO vo) {
		return memberDao.selectIdByNameEmail(vo);
	}


	// 아이디, 이름, 이메일로 비밀번호 찾기
	@Override
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return memberDao.selectPwdByIdNameEmail(vo);
	}



	// 새비밀번호 변경
	@Override
	public void changePwd(MemberVO vo) {
		memberDao.changePwd(vo);
	}


	// 회원 탈퇴(활동여부)
	@Override
	public void deleteMember(String id) {
		memberDao.deleteMember(id);
	}


	// 회원 수정
	@Override
	public void updateMember(MemberVO vo) {
		memberDao.updateMember(vo);
		
	}


	// 비밀번호 수정
	@Override
	public void updatePwdMember(MemberVO vo) {
		memberDao.updatePwdMember(vo);
		
	}

	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	@Override
	public List<MemberVO> getListMember(String name) {
		
		return memberDao.getListMember(name);
	}

	

	
	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	@Override
	public int countMemberList(String name) {
		
		return memberDao.countMemberList(name);
	}
	
	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	@Override
	public List<MemberVO> getListMemberWithPaging(Criteria criteria, String name) {
		
		return memberDao.listMemberWithPaging(criteria, name);
	}



	@Override
	public void insertPoint(String id, double point) {
		memberDao.insertPoint(id, point);
		
	}


	// 관리자 대시보드: 총 회원 수 조회
	@Override
	public MemberVO getTotalUserCount() {

		return memberDao.getTotalUserCount();
	}



	@Override
	public String checkEmail(String email) {
		return memberDao.checkEmail(email);
	}
	
	
}
