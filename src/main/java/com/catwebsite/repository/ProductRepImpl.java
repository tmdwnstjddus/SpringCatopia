package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.catwebsite.mapper.ProductMapper;
import com.catwebsite.vo.Cat;
import com.catwebsite.vo.CatCriteria;
import com.catwebsite.vo.Product;
import com.catwebsite.vo.ProductImg;

public class ProductRepImpl implements ProductRep {

	private SqlSessionTemplate sessionTemplate;
	
	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	private ProductMapper productMapper;

	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}
	
	@Override
	public ArrayList<Product> kindCategorys(String kind) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("kind", kind);
		//List<Question> Questions = QuestionMapper.selectQuestionlist(category);
		List<Product> product = productMapper.kindCategorys(params);
		
		return (ArrayList<Product>) product;
	}	
	

	public ArrayList<Product> listProduct(String col, String word) {
		
		HashMap<String ,Object> params = new HashMap<String, Object>();
		params.put("col", col);
		params.put("word", word);
		List<Product> list = productMapper.listProduct(params);
		
        return (ArrayList<Product>) list;
    }
	
	public int insertProduct(Product product) {
		
		productMapper.insertProduct(product);
		
		return product.getProductNo();
	}
	
	public void insertProductImg(ProductImg productImg) {
		
		productMapper.insertProductImg(productImg);
		
	}
	
	@Override
	public Product findUploadByUploadNo(int productNo) {
		
		Product product = productMapper.findUploadByUploadNo(productNo);
		
		return product;
	}
	
	public ProductImg findUploadFileByUploadFileNo(int productImgNo) {
	
		ProductImg imgs = productMapper.findUploadFileByUploadFileNo(productImgNo);
		
		return imgs; 
	}


	@Override
	public void updateCount(int productNo) {
		
		productMapper.updateCount(productNo);
		
	}

	@Override
	public ArrayList<ProductImg> findUploadFilesByUploadNo(int productNo) {
		
		List<ProductImg> imgs = productMapper.findUploadFilesByUploadNo(productNo);
		return (ArrayList<ProductImg>)imgs;
	}
	

	public void deleteProduct(int productNo) {
		
		productMapper.deleteProduct(productNo);
				
	}

	public void deleteProductImg(int fileNo) {
		
		productMapper.deleteProductImg(fileNo);
		
	}

	public void updateProduct(Product product) {
		
		productMapper.updateProduct(product);
			
	}	
		
	@Override
	public ProductImg findUploadFileByUploadNo(int productNo) {
		ProductImg img = productMapper.findUploadFileByUploadNo(productNo);
		return img;
		
		}			
	
	public List<Product> listPage(CatCriteria cri) {
		// TODO Auto-generated method stub

		List<Product> list = productMapper.listPage(cri);
		
        return (ArrayList<Product>) list;
               
	}
	
	   @Override
	   public int listCount() {
	      // TODO Auto-generated method stub
	      int list = productMapper.listCount();
	      
	        return list;
	   }	
}





















