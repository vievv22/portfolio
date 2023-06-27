package com.movie.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {

	private int rn;
	private int numb;
	private String title;
	private String content;
	private Date regdate;
	
	
	
}
