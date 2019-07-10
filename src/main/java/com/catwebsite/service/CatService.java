package com.catwebsite.service;

import java.util.List;

import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatImg;
import com.catwebsite.vo.Product;
import com.catwebsite.vo.CatCriteria;

public interface CatService {

   int insertCat(Cat cat);
   
   void insertCatImg(CatImg catImg);
   
   List<Cat> listCat(String col, String word);

   CatImg findUploadFileByUploadFileNo(int catImgNo);
   
   List<CatImg> findUploadFilesByUploadNo(int catNo);
   
   Cat findUploadByUploadNo(int catNo);
   
   void updateCount(int catNo);
      
   void deleteCat(int catNo);
   
   void updateCat(Cat cat);
   
   void deleteCatImg(int catImgNo);

   CatImg findUploadFileByUploadNo(int catNo);
   
   List<Cat> listPage(CatCriteria cri);
   
   int listCount();
   
   List<Cat> kindCategory(String catGender);

}