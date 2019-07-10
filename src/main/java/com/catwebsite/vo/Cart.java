package com.catwebsite.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class Cart {
	
	private int orderId;
	private String memberId;
	private int productNo;
	private Date regDate;
	private int amount;
	private String userName;
	private String productName;
	private int productPrice;
	private int money;
	
}
