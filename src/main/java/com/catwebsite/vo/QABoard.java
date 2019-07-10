package com.catwebsite.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class QABoard {
	
	private String qaboardNo;
	private String qaTitle;
	private String memberId;
	private String qaContent;
	private Date RegDate;
	
}
