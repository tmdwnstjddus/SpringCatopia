package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.List;

import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatCriteria;
import com.catwebsite.vo.CatImg;
import com.catwebsite.vo.Product;
import com.catwebsite.vo.ProductImg;

public interface ProductRep {

	ArrayList<Product> listProduct(String col, String word);
	
	int insertProduct(Product product);

	void insertProductImg(ProductImg img);
	
	Product findUploadByUploadNo(int productNo);
	
	void updateCount(int productNo);

	public ProductImg findUploadFileByUploadFileNo(int productNo);
	
	ArrayList<ProductImg> findUploadFilesByUploadNo(int productNo);

	void deleteProduct(int productNo);

	void deleteProductImg(int fileNo);

	void updateProduct(Product product);
	
	ProductImg findUploadFileByUploadNo(int productNo);

	ArrayList<Product> kindCategorys(String kind);

	List<Product> listPage(CatCriteria cri);
	
	int listCount();

}