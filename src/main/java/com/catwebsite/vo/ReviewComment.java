package com.catwebsite.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewComment {

	private int commentNo;
	private int reviewNo;
	private String writer;
	private String content;
	private Date regDate;
	private int groupNo;
	private int step;
	private int depth;
	
}
