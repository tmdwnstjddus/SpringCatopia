package com.catwebsite.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import com.catwebsite.vo.Cart;


//이 인터페이스의 패키지와 인터페이스 이름은 member-mapper.xml 파일의 namespace와 일치
public interface CartMapper {
	

	List<Cart> selectCartsByMemberId(String memberId);

	void insertCart(Cart cart);

	int selectMap(Map<String, Object> map);

	void sumCart(Cart cart);

	int sumMoney(String memberId);

	void deleteCart(int orderId);

	void modifyCart(Cart cart);
}
