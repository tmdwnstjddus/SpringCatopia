package com.catwebsite.service;

import java.util.List;

import com.catwebsite.common.Util;
import com.catwebsite.repository.CartRep;

import com.catwebsite.vo.Cart;


public class CartServiceImpl implements CartService {
	
	private CartRep cartRep;
	
	public CartRep getCartRep() {
		return cartRep;
	}

	public void setCartRep(CartRep cartRep) {
		this.cartRep = cartRep;
	}

	@Override
	public List<Cart> findCartListBymemberId(String memberId) {
		
		return cartRep.selectCartsByMemberId(memberId); 
	}

	@Override
	public void insert(Cart cart) {
		cartRep.insert(cart);
		
	}

	@Override
	public int countCart(int productNo, String memberId) {
		
		return cartRep.countCart(productNo, memberId);
	}

	@Override
	public void updateCart(Cart cart) {
		cartRep.updateCart(cart);
		
	}

	@Override
	public int sumMoney(String memberId) {
		return cartRep.sumMoney(memberId);
	}

	@Override
	public void delete(int orderId) {
		cartRep.delete(orderId);
		
	}

	@Override
	public void modifyCart(Cart cart) {
		cartRep.modifyCart(cart);
		
	}

	

	

	
	

}
