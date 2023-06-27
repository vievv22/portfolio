package com.movie.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {

	private int rn;
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String birth;
	private Date regdate;
	private String useyn;
	private int point;
	private String email;
	
	// 추가 정보 컬럼
	private int totalUsers;		// 총 회원 수
	
	
}
