package com.catwebsite.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class Cat {
   
   private int catNo;
   private String catName;
   private String catRace;
   private String catGender;
   private String catAge;
   private Date regDate;
   private String catContent;
   private int catCount;
   private String uploader;

   private CatImg img;
   private ArrayList<CatImg> imgs;
   
      
}