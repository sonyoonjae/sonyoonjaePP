package com.site.service;

import java.util.Map;

import com.site.vo.CartVo;

public interface CartService {

	// 장바구니 리스트 호출
	Map<String, Object> cartList();
	// 장바구니 삭제
	void cartDelete(String email, int cart_no);
	// 장바구니 전체삭제
	void cartAllDelete(String email);
	// 장바구니 추가
	void cartInsert(CartVo cartVo);
	// 선택구매 
	Map<String, Object> selectedPayList(String email, int cart_no);
	// 전체구매
	Map<String, Object> allPayList(String email);


}
