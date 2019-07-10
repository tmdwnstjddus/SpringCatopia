package com.catwebsite.vo;


import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class Movie {

	private int uploadNo;
	private String title;
	private String uploader;
	private String content;
	private String genre;
	private String grade;
	private String Opendate;
	private int readCount;
	private Date regDate;
	private boolean deleted;
//	private String word;
//	private String col;
	
	//Upload Table과 UploadFile Table 사이의 1:Many 관계를 구현하는 필드
	private ArrayList<MovieFile> files;
	
}
