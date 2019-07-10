package com.catwebsite.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.catwebsite.common.Util;
import com.catwebsite.service.CartService;
import com.catwebsite.vo.Cart;

@Controller
@RequestMapping(path = "/cart-upload/")
public class CartController {
	
	@Autowired
	@Qualifier("cartService")
	private CartService cartService;
	
	@RequestMapping(path = "/insertcart", method = RequestMethod.POST)
	public String insertcart(@ModelAttribute Cart cart) {
//		String memberId = (String) session.getAttribute("memberId");
//		cart.setMemberId(memberId);
		
		int count = cartService.countCart(cart.getProductNo(), cart.getMemberId());
		if(count ==0) {
		cartService.insert(cart);
		} else {
			cartService.updateCart(cart);
		}
		return "redirect:/cart-upload/ordercart?memberId="+cart.getMemberId();
	}
	
	
	@RequestMapping(path = "/ordercart", method = RequestMethod.GET)
	public ModelAndView memberList(String memberId, ModelAndView mav) {
		
		Map<String, Object> map = new HashMap<String, Object>();		
		List<Cart> carts = cartService.findCartListBymemberId(memberId);
		int sumMoney = cartService.sumMoney(memberId);
		int fee = sumMoney >= 100000 ? 0: 2500; 
		map.put("carts", carts);
		map.put("count", carts.size());
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("allSum", sumMoney+fee);
		mav.setViewName("upload/orderlist");
		mav.addObject("map", map);
		return mav; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
	
	@RequestMapping(path = "/deletecart", method = RequestMethod.GET)
	public String deletecart(@RequestParam int orderId, String memberId) {
		cartService.delete(orderId);
		return "redirect:/cart-upload/ordercart?memberId="+memberId;
	}
	
	@RequestMapping(path = "/updatecart", method = RequestMethod.POST)
	public String update(@RequestParam int amount, @RequestParam int productNo, String memberId) {
		//String memberId = (String)session.getAttribute("memberId");
		//for(int i=0; i<productNo.length; i++) {
			Cart cart = new Cart();
			cart.setMemberId(memberId);
			cart.setAmount(amount);
			cart.setProductNo(productNo);
			cartService.modifyCart(cart);
		//}
		return "redirect:/cart-upload/ordercart?memberId="+memberId;
	}
}



















