package com.catwebsite.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MarketComment {

	private int commentNo;
	private int mkboardNo;
	private String memberId;
	private String content;
	private Date regDate;
	
	private int groupNo;
	private int step;
	private int depth;
	
}
