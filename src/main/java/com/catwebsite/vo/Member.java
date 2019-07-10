package com.catwebsite.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	private String memberId;
	private String name;
	private String passwd;
	private String phone;
	private String gender;
	private String email;
	private String userType;
	private Date regDate;		
}
