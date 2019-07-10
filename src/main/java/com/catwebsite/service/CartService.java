package com.catwebsite.service;

import java.util.List;

import com.catwebsite.vo.Cart;

//import com.catwebsite.vo.Upload;

public interface CartService {
	
	

	List<Cart> findCartListBymemberId(String memberId);

	void insert(Cart cart);

	int countCart(int productNo, String memberId);

	void updateCart(Cart cart);

	int sumMoney(String memberId);

	void delete(int orderId);

	void modifyCart(Cart cart);


}
