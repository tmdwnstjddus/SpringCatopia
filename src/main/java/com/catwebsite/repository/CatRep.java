package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.List;

import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatImg;
import com.catwebsite.vo.CatCriteria;

public interface CatRep {

   ArrayList<Cat> listCat(String col, String word);
   
   int insertCat(Cat Cat);

   void insertCatImg(CatImg img);
   
   Cat findUploadByUploadNo(int catNo);
   
   void updateCount(int catNo);

   public CatImg findUploadFileByUploadFileNo(int catImgNo);
   
   ArrayList<CatImg> findUploadFilesByUploadNo(int catNo);
   
   void deleteCat(int catNo);
   
   void updateCat(Cat cat);
   
   void deleteCatImg(int catImgNo);

   CatImg findUploadFileByUploadNo(int catNo);

   List<Cat> listPage(CatCriteria cri);

   int listCount();

   List<Cat> kindCategory(String catGender );



}