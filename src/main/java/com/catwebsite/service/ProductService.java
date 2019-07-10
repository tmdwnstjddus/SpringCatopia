package com.catwebsite.service;

import java.util.List;

import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatCriteria;
import com.catwebsite.vo.CatImg;
import com.catwebsite.vo.Product;
import com.catwebsite.vo.ProductImg;

public interface ProductService {

	int insertProduct(Product product);
	
	void insertProductImg(ProductImg productImg);
	
	List<Product> listProduct(String col, String word);

	ProductImg findUploadFileByUploadFileNo(int productNo);
	
	List<ProductImg> findUploadFilesByUploadNo(int productNo);
	
	Product findUploadByUploadNo(int productNo);
	
	void updateCount(int productNo);
		
	void deleteProduct(int productNo);
	
	void deleteProductImg(int fileNo);
	
	void updateProduct(Product product);

//	MovieFile findUploadFileByUploadFileNo(int uploadFileNo);
	ProductImg findUploadFileByUploadNo(int productNo);

	List<Product> kindCategory(String kind);
	
	int listCount();	
	
	List<Product> listPage(CatCriteria cri);	

}
