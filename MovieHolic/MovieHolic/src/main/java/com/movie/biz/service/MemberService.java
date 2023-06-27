package com.movie.biz.service;

import java.util.List;

import com.movie.biz.dto.MemberVO;

import utils.Criteria;

public interface MemberService {

	// 회원 id를 조건으로 사용자 정보 조회
	MemberVO getMember(String id);

	// 회원 존재 여부 조회
	int confirmID(String id);

	String checkEmail(String email);
	
	// 회원 로그인 인증
	int loginID(MemberVO vo);

	// 회원 가입 등록
	void insertMember(MemberVO vo);

		
	// 이름과 이메일로 아이디 찾기
	String selectIdByNameEmail(MemberVO vo);

	// 아이디, 이름, 이메일로 비밀번호 찾기 
	String selectPwdByIdNameEmail(MemberVO vo);
			
	// 새비밀번호 변경
	void changePwd(MemberVO vo);
	
	
	//회원 탈퇴
	void deleteMember(String id);
		
	//회원 수정
	void updateMember(MemberVO vo);
	
	//비밀번호 수정
	void updatePwdMember(MemberVO vo);
	

	

	
	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	int countMemberList(String name);

	
	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	List<MemberVO> getListMemberWithPaging(Criteria criteria, String name);
	
	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	List<MemberVO> getListMember(String name);
	
	void insertPoint(String id, double point);
	
	// 관리자 대시보드: 총 회원 수 조회
	MemberVO getTotalUserCount();
	
}
