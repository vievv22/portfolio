package com.movie.biz.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieVO {
	private int numb;
	private String title;
	private String story;
	private String genre;
	private String director;
	private String caster;
	private String poster_url;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date opendate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private int playtime;
	private int age;
	private String nation;
	private String ny;
	private String trailer;
}
