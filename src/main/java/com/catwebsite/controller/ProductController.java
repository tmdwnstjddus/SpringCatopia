package com.catwebsite.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.catwebsite.common.Util;
import com.catwebsite.service.ProductService;
import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatCriteria;
import com.catwebsite.vo.ProductPageMaker;
import com.catwebsite.vo.Member;
import com.catwebsite.vo.Product;
import com.catwebsite.vo.ProductImg;


@Controller
@RequestMapping(path = "/pr-upload/")
public class ProductController {
	
	@Autowired
	@Qualifier("productService")
	private ProductService productService;
	
	   @RequestMapping(path = "/pr-listPage", method = RequestMethod.GET)
	   public String listPage(CatCriteria cri, Model model) {
	      
	      
	      List<Product> list = productService.listPage(cri);
	      
	      for(Product product : list) {
	         product.setImg(productService.findUploadFileByUploadNo(product.getProductNo()));
	      }
	      
	      model.addAttribute("product", list);
	      
	      ProductPageMaker ProductPageMaker = new ProductPageMaker();
	      ProductPageMaker.setCri(cri);
	      ProductPageMaker.setTotalCount(productService.listCount());
	      model.addAttribute("ProductPageMaker", ProductPageMaker);
	      
	      return "upload/pr-listPage" ;
	   }	
	
	
	@RequestMapping(path = "/pr-kind", method = RequestMethod.POST)
	public String category(String kind, Model model) {

		if(kind == null) {
			kind = "all";
		}
		
		List<Product> list = productService.kindCategory(kind);		
		
		for(Product product : list) { 
			product.setImg(productService.findUploadFileByUploadNo(product.getProductNo()));
		}		
		

		model.addAttribute("product", list);		
		return "upload/pr-list";
	
	}	
		
	@RequestMapping(path = "/pr-list", method = RequestMethod.GET)
	public String list(String col, String word, Model model, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		String memberId = loginuser.getMemberId();
		
		List<Product> list = productService.listProduct(col, word);
		
		for(Product product : list) { 
			product.setImg(productService.findUploadFileByUploadNo(product.getProductNo()));
		}
		
		model.addAttribute("product", list);
		
		return "upload/pr-list"; 
	}
	
	
	@RequestMapping(path = "/pr-write", method = RequestMethod.GET)
	public String writeForm() {
		
		return "upload/pr-write"; 
	}
	
	@RequestMapping(path = "/pr-write", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest req, Product product) {
		
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
								
				ProductImg productImg = new ProductImg();
				productImg.setUserFileName(userFileName);
				productImg.setSavedFileName(savedFileName);
				ArrayList<ProductImg> files = new ArrayList<ProductImg>();
				files.add(productImg);
				product.setImgs(files);
							
				productService.insertProduct(product);
				
				
				
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return "redirect:pr-list?col=all&word=";
	}
	
	@RequestMapping(path = "/pr-detail", method = RequestMethod.GET)
	public String detail(@RequestParam(name="productNo") int productNo, Model model) {
		
		productService.updateCount(productNo);
		
		Product product = productService.findUploadByUploadNo(productNo);
			
		
		if (product == null) { 
			return "redirect:pr-list";
		}		
		List<ProductImg> imgs = productService.findUploadFilesByUploadNo(productNo);
		product.setImgs((ArrayList<ProductImg>)imgs);
		
		model.addAttribute("product", product);
		
		return "upload/pr-detail"; 
	}
	
	
	
////	@RequestMapping(path = "/download/{fileNo}", method = RequestMethod.GET)
////	public View download(@PathVariable int fileNo, Model model) {
////		
////		ProductImg img = productService.findUploadFileByUploadFileNo(fileNo);
////		if (file == null) {
////			return new RedirectView("/upload/pr-list");
////		}
////		
////		model.addAttribute("file", img);
////		
////		DownloadView v = new DownloadView();
////		return v;
////	}

	@RequestMapping(path = "/delete/{productNo}", method = RequestMethod.GET)
	public String delete(@PathVariable int productNo) {

		productService.deleteProduct(productNo);
		
		return "redirect:/pr-upload/pr-list?col=all&word=";
	}

	@RequestMapping(path = "/delete-file/{productNo}/{fileNo}", method = RequestMethod.GET)
	public String deleteFile(
			@PathVariable int productNo, @PathVariable int fileNo, Model model) {

		ProductImg img = productService.findUploadFileByUploadFileNo(fileNo);

		File f = new File(img.getSavedFileName());
		if (f.exists()) {
			f.delete();
		}		
		
		productService.deleteProductImg(fileNo);
		
		return "redirect:/pr-upload/pr-update/" + productNo;
	}

	
	@RequestMapping(path = "/pr-update/{productNo}", method = RequestMethod.GET)
	public String updateForm(@PathVariable int productNo, Model model) {	
			
		Product product = productService.findUploadByUploadNo(productNo);
		if (product == null) { 
			return "redirect:/upload/pr-list";
		}		
		List<ProductImg> files = productService.findUploadFilesByUploadNo(productNo);
		product.setImgs((ArrayList<ProductImg>)files);
		
		model.addAttribute("product", product);

		
		return "upload/pr-update";
	}
	

	@RequestMapping(path = "/pr-update", method = RequestMethod.POST)
	public String updateForm(MultipartHttpServletRequest req, Product product) {

		MultipartFile mf = req.getFile("attach");
		if (mf != null) {
			
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/upload-files");

			
			String userFileName = mf.getOriginalFilename();
			if (userFileName.contains("\\")) { 
				userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
			}
			String savedFileName = Util.makeUniqueFileName(userFileName);
			
			try {
				mf.transferTo(new File(path, savedFileName));
							
				productService.updateProduct(product);
				
				ProductImg productImg = new ProductImg();
				productImg.setUserFileName(userFileName);
				productImg.setSavedFileName(savedFileName);
				productImg.setProductNo(product.getProductNo());
				productService.insertProductImg(productImg);
				
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return "redirect:/pr-upload/pr-detail/" + product.getProductNo();
	}   	
}



















