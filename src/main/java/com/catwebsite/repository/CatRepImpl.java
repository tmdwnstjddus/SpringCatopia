package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.catwebsite.mapper.CatMapper;
import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatCriteria;
import com.catwebsite.vo.CatImg;

public class CatRepImpl implements CatRep {

   private SqlSessionTemplate sessionTemplate;
   
   public SqlSessionTemplate getSessionTemplate() {
      return sessionTemplate;
   }

   public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
      this.sessionTemplate = sessionTemplate;
   }
   
   private CatMapper catMapper;

   public CatMapper getCatMapper() {
      return catMapper;
   }

   public void setCatMapper(CatMapper catMapper) {
      this.catMapper = catMapper;
   }
   
   
   public ArrayList<Cat> listCat(String col, String word) {
      
      HashMap<String ,Object> params = new HashMap<String, Object>();
      params.put("col", col);
      params.put("word", word);
      List<Cat> list = catMapper.listCat(params);
      
        return (ArrayList<Cat>) list;
    }
   
   public int insertCat(Cat cat) {
      
      catMapper.insertCat(cat);
      
      return cat.getCatNo();
   }
   
   public void insertCatImg(CatImg catImg) {
      
      catMapper.insertCatImg(catImg);
      
   }
   
   public CatImg findUploadFileByUploadFileNo(int catImgNo) {
   
      CatImg imgs = catMapper.findUploadFileByUploadFileNo(catImgNo);
      
      return imgs; 
}

   @Override
   public Cat findUploadByUploadNo(int catNo) {
      
      Cat cat = catMapper.findUploadByUploadNo(catNo);
      
      return cat;
   }

   @Override
   public void updateCount(int catNo) {
      
      catMapper.updateCount(catNo);
      
   }

   @Override
   public ArrayList<CatImg> findUploadFilesByUploadNo(int catNo) {
      
      List<CatImg> imgs = catMapper.findUploadFilesByUploadNo(catNo);
      return (ArrayList<CatImg>)imgs;
   }
   
   public void deleteCat(int catNo) {
   
      catMapper.deleteCat(catNo);
      
   }
   
   public void updateCat(Cat cat) {
   
      catMapper.updateCat(cat);
   
   }   
   
   public void deleteCatImg(int catImgNo) {
   
      catMapper.deleteCatImg(catImgNo);
      
   }

   @Override
   public CatImg findUploadFileByUploadNo(int catNo) {
      CatImg img =catMapper.findUploadFileByUploadNo(catNo);
      return img;
   }

   @Override
   public List<Cat> listPage(CatCriteria cri) {
      // TODO Auto-generated method stub

      List<Cat> list = catMapper.listPage(cri);
      
        return (ArrayList<Cat>) list;
   }

   @Override
   public int listCount() {
      // TODO Auto-generated method stub
      int list = catMapper.listCount();
      
        return list;
   }

   @Override
   public List<Cat> kindCategory(String catGender) {
      
      HashMap<String, Object> params = new HashMap<String, Object>();
      params.put("catGender", catGender);
      //List<Question> Questions = QuestionMapper.selectQuestionlist(category);
      List<Cat> cat = catMapper.kindCategory(params);
      
      return (ArrayList<Cat>) cat ;
   }
   
      
   }




















