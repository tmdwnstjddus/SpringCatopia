package com.catwebsite.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class Product {
	
	//PRODUCT
	private int productNo;
	private String name;
	private String price;
	private int readCount;
	private String kind;
	private String uploader;
	private String content;
	private Date regDate;
	private String category;
	
	private ProductImg img;
	private ArrayList<ProductImg> imgs;
}
