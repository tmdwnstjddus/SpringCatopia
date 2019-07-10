package com.catwebsite.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Review {

	private int reviewNo;
	private String title;
	private String category;
	private String uploader;
	private String content;
	private int readCount;
	private Date regDate;    
	private boolean deleted;
	
	//Upload Table과 UploadFile Table 사이의 1:Many 관계를 구현하는 필드
			private ArrayList<ReviewFile> files;
			
			//Upload Table과 UploadComment Table 사이의 1:Many 관계를 구현하는 필드
			private List<ReviewComment> comments;
}
