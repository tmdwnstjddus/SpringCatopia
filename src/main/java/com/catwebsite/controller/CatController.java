package com.catwebsite.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.catwebsite.common.Util;
import com.catwebsite.service.CatService;
import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatCriteria;
import com.catwebsite.vo.CatImg;
import com.catwebsite.vo.CatPageMaker;


@Controller

@RequestMapping(path = "/cat-upload/")
public class CatController {
   
   @Autowired
   @Qualifier("catService")
   private CatService catService;
   
   @RequestMapping(path = "/cat-list", method = RequestMethod.GET)
   public String list(String col, String word, Model model) {
      
      List<Cat> list = catService.listCat(col, word);
      
      for(Cat cat : list) {
         cat.setImg(catService.findUploadFileByUploadNo(cat.getCatNo()));
      }
      
      model.addAttribute("list", list);
       
      
      return "upload/cat-list"; 
   }
   
   
   
   
   
   @RequestMapping(path = "/cat-write", method = RequestMethod.GET)
   public String writeForm() {
      
      return "upload/cat-write"; 
   }
   
   @RequestMapping(path = "/cat-write", method = RequestMethod.POST)
   public String write(MultipartHttpServletRequest req, Cat list, Model model) {
      
      MultipartFile ci = req.getFile("attach");
      if (ci != null) {
         
         ServletContext application = req.getServletContext();
         String path = application.getRealPath("/resources/upload-files");
         
         String userFileName = ci.getOriginalFilename();
         if (userFileName.contains("\\")) {
            userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
         }
         String savedFileName = Util.makeUniqueFileName(userFileName);
         
         try {
            ci.transferTo(new File(path, savedFileName)); 
                        
            CatImg catImg = new CatImg();
            catImg.setUserImgName(userFileName);
            catImg.setSavedImgName(savedFileName);
            ArrayList<CatImg> files = new ArrayList<CatImg>();
            files.add(catImg);
            list.setImgs(files);
                     
            catService.insertCat(list);
            
            
            
         } catch (Exception ex) {
            ex.printStackTrace();
         }
      }
      model.addAttribute("list", list);
      
      return "redirect:cat-listPage";
   }
   
   @RequestMapping(path = "/cat-detail/{catNo}", method = RequestMethod.GET)
   public String detail(@PathVariable int catNo, Model model) {
      
      catService.updateCount(catNo);
      
      Cat list = catService.findUploadByUploadNo(catNo);
      
      if (list == null) { 
         return "redirect:cat-list";
      }      
      List<CatImg> imgs = catService.findUploadFilesByUploadNo(catNo);
      list.setImgs((ArrayList<CatImg>)imgs);
      
      model.addAttribute("list", list);
      
      return "upload/cat-detail"; 
   }
   
   @RequestMapping(path = "/cat-delete/{catNo}", method = RequestMethod.GET)
   public String delete(@PathVariable int catNo) {

      catService.deleteCat(catNo);
      
      return "redirect:/cat-upload/cat-list";
   }
   
   
   
   @RequestMapping(path = "/cat-update/{catNo}", method = RequestMethod.GET)
   public String updateForm(@PathVariable int catNo, Model model) {   
         
      Cat list = catService.findUploadByUploadNo(catNo);
      if (list == null) { 
         return "redirect:/upload/cat-list";
      }      
      List<CatImg> imgs = catService.findUploadFilesByUploadNo(catNo);
      list.setImgs((ArrayList<CatImg>)imgs);
      
      model.addAttribute("list", list);

      
      return "upload/cat-update";
   }
   

   @RequestMapping(path = "/cat-update", method = RequestMethod.POST)
   public String updateForm(MultipartHttpServletRequest req, Cat cat) {

      MultipartFile ci = req.getFile("attach");
      if (ci != null) {
         
         ServletContext application = req.getServletContext();
         String path = application.getRealPath("/upload-files");

         
         String userImgName = ci.getOriginalFilename();
         if (userImgName.contains("\\")) { 
            userImgName = userImgName.substring(userImgName.lastIndexOf("\\") + 1);
         }
         String savedImgName = Util.makeUniqueFileName(userImgName);
         
         try {
            ci.transferTo(new File(path, savedImgName));
                     
            catService.updateCat(cat);
            
            CatImg catImg = new CatImg();
            catImg.setUserImgName(userImgName);
            catImg.setSavedImgName(savedImgName);
            catImg.setCatNo(cat.getCatNo());
            
            catService.insertCatImg(catImg);
            
         } catch (Exception ex) {
            ex.printStackTrace();
         }
      }
      
      return "redirect:/cat-upload/cat-detail?catNo=" + cat.getCatNo();
   }   
   
   @RequestMapping(path = "/delete-file/{catNo}/{catImgNo}", method = RequestMethod.GET)
   public String deleteFile(
         @PathVariable int catNo, @PathVariable int catImgNo, Model model) {

      CatImg file = catService.findUploadFileByUploadFileNo(catImgNo);
      //�뙆�씪 �궘�젣
      File f = new File(file.getSavedImgName());
      if (f.exists()) {
         f.delete();
      }      
      //�뜲�씠�꽣踰좎씠�뒪�뿉�꽌 �뙆�씪 �뜲�씠�꽣 �궘�젣      
      catService.deleteCatImg(catImgNo);
      
      return "redirect:/cat-upload/cat-update/" + catNo;
   }
   
   @RequestMapping(path = "/cat-listPage", method = RequestMethod.GET)
   public String listPage(CatCriteria cri, Model model) {
      
      
      List<Cat> list = catService.listPage(cri);
      
      for(Cat cat : list) {
         cat.setImg(catService.findUploadFileByUploadNo(cat.getCatNo()));
      }
      
      model.addAttribute("list", list);
      
      CatPageMaker CatPageMaker = new CatPageMaker();
      CatPageMaker.setCri(cri);
      CatPageMaker.setTotalCount(catService.listCount());
      model.addAttribute("CatPageMaker", CatPageMaker);
      
      return "upload/cat-listPage" ;
   }
   
   @RequestMapping(path = "/cat-kind", method = RequestMethod.POST)
   public String category(String catGender, Model model) {

      if(catGender == null) {
         catGender = "all";
      }
      
      List<Cat> list = catService.kindCategory(catGender);      
      
      for(Cat cat : list) { 
         cat.setImg(catService.findUploadFileByUploadNo(cat.getCatNo()));
      }      
      
      model.addAttribute("list", list);      
      
      return "upload/cat-listPage";
   
   }   
   
//   
   
//   @RequestMapping(path = "/download/{fileNo}", method = RequestMethod.GET)
//   public View download(@PathVariable int fileNo, Model model) {
//      
//      CatImg file = catService.findUploadFileByUploadFileNo(fileNo);
//      if (file == null) {
//         return new RedirectView("/upload/list");
//      }
//      
//      model.addAttribute("file", file);
//      
//      CatDownloadView v = new CatDownloadView();
//      return v;
//   }

   




}


















