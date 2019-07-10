package com.catwebsite.mapper;

import java.util.HashMap;
import java.util.List;

import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatImg;
import com.catwebsite.vo.CatCriteria;

public interface CatMapper {
   
   List<Cat> listCat(HashMap<String, Object> params);
   
   int insertCat(Cat cat);
   
   void insertCatImg(CatImg catImg);
   
   Cat findUploadByUploadNo(int catNo);
   
   void updateCount(int uploadNo);
   
   CatImg findUploadFileByUploadFileNo(int catImgNo);

   List<CatImg> findUploadFilesByUploadNo(int catNo);

   void deleteCat(int catNo);

   void updateCat(Cat cat);
   
   void deleteCatImg(int catImgNo);

   CatImg findUploadFileByUploadNo(int catNo);

   List<Cat> listPage(CatCriteria cri);

   int listCount();

   List<Cat> kindCategory(HashMap<String, Object> params) ;


//   List<Movie> selectRank();

}