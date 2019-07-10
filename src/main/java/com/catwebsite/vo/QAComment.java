package com.catwebsite.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QAComment {

	private int commentNo;
	private int qaboardNo;
	private String memberId;
	private String content;
	private Date regDate;
	private int groupNo;
	private int step;
	private int depth;
}
