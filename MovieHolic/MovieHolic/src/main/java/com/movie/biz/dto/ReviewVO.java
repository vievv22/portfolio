package com.movie.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {

	private int numb;
	private String comments;
	private int stars;
	private Date regdate;
	private String user_id;
	private int movie_numb;
	private int ticketing_numb;
	private String title;
	
}
