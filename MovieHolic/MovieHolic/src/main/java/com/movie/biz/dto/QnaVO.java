package com.movie.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaVO {

	private int rn;
	private int numb;
	private String title;
	private String content;
	private String reply;
	private String repyn;
	private Date regdate;
	private String user_id;	
	
	// 추가 정보 컬럼
	private int totalQna;	// 답변달지 않은 총 문의 수
}
