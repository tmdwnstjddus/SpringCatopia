package com.catwebsite.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Market {

	private int mkboardNo;
	private String category;
	private String mkTitle;
	private String memberId;
	private String mkContent;
	private int mkreadCount;
	private Date regDate;
	private boolean deleted;
	
	//Upload Table과 UploadFile Table 사이의 1:Many 관계를 구현하는 필드
	private ArrayList<MarketFile> files;
	
	//Upload Table과 UploadComment Table 사이의 1:Many 관계를 구현하는 필드
	private List<MarketComment> comments;
	
}
