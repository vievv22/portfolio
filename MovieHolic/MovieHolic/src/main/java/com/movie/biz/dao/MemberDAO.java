package com.movie.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.biz.dto.MemberVO;

import utils.Criteria;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 회원 id를 조건으로 사용자 정보 조회
	public MemberVO getMember(String id) {

		return mybatis.selectOne("MemberMapper.getMember", id);

	}
	
	public String checkEmail(String email) {
		
		return mybatis.selectOne("MemberMapper.checkEmail", email);
	}
	

	// 회원 존재 여부 조회
		public int confirmID(String id) {
			
			String pwd = mybatis.selectOne("MemberMapper.confirmID",id);
			
		if (pwd != null)
			return 1; // id 존재
		else
			return -1;
		}

	/*
	 * 회원 로그인 인증
	 * 리턴값 : ID가 존재하고 비밀번호가 같으면 1
	 * 		   비밀번호가 다르면 0
	 *        ID가 존재하지 않으면 -1을 반환
	 */
	public int loginID(MemberVO vo) {// vo = 화면에서 입력한 정보
		
		int result = -1;
		String pwd = mybatis.selectOne("MemberMapper.confirmID", vo); // 비밀번호 확인 member-mapping.xml 에서 따로 작성
		String useyn = mybatis.selectOne("MemberMapper.checkID", vo); // 활동여부 확인 member-mapping.xml 에서 따로 작성
		
		  if (pwd == null) {
		        result = -1; // ID가 존재하지 않음
		    } else if (!pwd.equals(vo.getPwd())) {
		        result = 0; // 비밀번호가 다름
		    } else if (!useyn.equals("y")) { //활동여부 체크
		        result = -1; // 비활성화된 회원
		    } else {
		        result = 1; // 로그인 성공
		    }
		
		return result;
		
	}
	
	

	// 회원 가입 작업
	public void insertMember(MemberVO vo) {

		mybatis.insert("MemberMapper.insertMember", vo);

	}

	// 이름과 이메일로 아이디 찾기
	public String selectIdByNameEmail(MemberVO vo) {

		return mybatis.selectOne("MemberMapper.selectIdByNameEmail", vo);
	}

	// 아이디, 이름, 이메일로 비밀번호 찾기
	public String selectPwdByIdNameEmail(MemberVO vo) {

		return mybatis.selectOne("MemberMapper.selectPwdByIdNameEmail", vo);
	}

	// 새비밀번호 변경
	public void changePwd(MemberVO vo) {

		mybatis.update("MemberMapper.changePwd", vo);

	}


	// 회원수정
	public void updateMember(MemberVO vo) {
		System.out.println("멤버 수정");
		mybatis.update("MemberMapper.updateMember", vo);

	}
	
	

	// 비밀번호수정
	public void updatePwdMember(MemberVO vo) {
		System.out.println("비밀번호 수정");
		mybatis.update("MemberMapper.updatePwdMember", vo);

	}
	
	// 회원탈퇴 (활동여부)
	public void deleteMember(String id) {
		System.out.println("멤버 삭제");
		mybatis.update("MemberMapper.deleteMember", id);

	}

	

	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	public int countMemberList(String name) {

		return mybatis.selectOne("MemberMapper.countMemberList", name);
	}

	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	public List<MemberVO> getListMember(String name) {
		
		return mybatis.selectList("MemberMapper.listMember", name);
		
	}
	
	// 회원 목록 조회 페이징 처리(관리자 페이지) 
	public List<MemberVO> listMemberWithPaging(Criteria criteria, String name) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("name", name);
		
		return mybatis.selectList("MemberMapper.listMemberWithPaging", map);
		
	}
	
	
	
	
	// 예매 완료 시 포인트 적립
	public void insertPoint(String id, double point) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("id", id);
		parameters.put("point", point);
		
		mybatis.update("MemberMapper.updatePoint", parameters);
	}
	
	
	// 관리자 대시보드 : 총 회원 수 조회
	public MemberVO getTotalUserCount() {
		
		return mybatis.selectOne("MemberMapper.getTotalUserCount");
	}
	
	
}
