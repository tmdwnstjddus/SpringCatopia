package com.catwebsite.service;

import java.util.List;

import com.catwebsite.repository.CatRep;
import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatImg;
import com.catwebsite.vo.Product;
import com.catwebsite.vo.CatCriteria;

public class CatServiceImpl implements CatService {


   private CatRep catRep;

   public CatRep getCatRep() {
      return catRep;
   }

   public void setCatRep(CatRep catRep) {
      this.catRep = catRep;
   }
   
   @Override
   public List<Cat> listCat(String col, String word) {
      
      List<Cat> cat = catRep.listCat(col, word);
      
      return cat;
   }

   @Override
   public int insertCat(Cat cat) {
      int newCatNo = catRep.insertCat(cat);
      for (CatImg img : cat.getImgs()) {
         img.setCatNo(newCatNo);
         catRep.insertCatImg(img);
      }   
      return newCatNo;
         
   }
   
   @Override
   public void insertCatImg(CatImg catImg) {
      catRep.insertCatImg(catImg);      
   }
   
   @Override
   public CatImg findUploadFileByUploadFileNo(int catImgNo) {
      
      CatImg imgs = catRep.findUploadFileByUploadFileNo(catImgNo);      
      return imgs;
   }
   
   @Override
   public List<CatImg> findUploadFilesByUploadNo(int catNo) {
      
      List<CatImg> imgs = catRep.findUploadFilesByUploadNo(catNo);
      
      return imgs;
   }


   @Override
   public Cat findUploadByUploadNo(int catNo) {
      
      Cat upload = catRep.findUploadByUploadNo(catNo);
      return upload;
      
   }
   
   @Override
   public void updateCount(int catNo) {
   
      catRep.updateCount(catNo);
   
   }
   
   @Override
   public void deleteCat(int catNo) {
      
      catRep.deleteCat(catNo);
   }
   
   @Override
   public void updateCat(Cat cat) {
      
      catRep.updateCat(cat);
      
   }
      
   @Override
   public void deleteCatImg(int catImgNo) {
      
      catRep.deleteCatImg(catImgNo);
      
   }

   @Override
   public CatImg findUploadFileByUploadNo(int catNo) {
      CatImg img = catRep.findUploadFileByUploadNo(catNo);
      return img;
   }

   @Override
   public List<Cat> listPage(CatCriteria cri) {
      
      return catRep.listPage(cri);
   }

   @Override
   public int listCount() {
      // TODO Auto-generated method stub
      return catRep.listCount();
   }

   @Override
   public List<Cat> kindCategory(String catGender) {
      
      List<Cat> cat = catRep.kindCategory(catGender);
      return cat;
   }
}