package com.site.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.CartMapper;
import com.site.mapper.ProductMapper;
import com.site.vo.CartVo;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	ProductMapper productMapper;
	
	@Override		// 장바구니 리스트
	public Map<String, Object> cartList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVo> list = cartMapper.selectCartList();
		
		
		map.put("list", list);
		
		return map;
	}

	@Override		// 장바구니 선택 삭제
	public void cartDelete(String email, int cart_no) {
		cartMapper.deleteCartDelete(email, cart_no);
	}

	@Override		// 장바구니 전체 삭제
	public void cartAllDelete(String email) {
		cartMapper.deleteCartAllDelete(email);
	}
	
	
	@Override		//장바구니 물건 추가
	public void cartInsert(CartVo cartVo) {
		cartMapper.cartInsertDo(cartVo);
			
	}

	@Override		// 선택구매
	public Map<String, Object> selectedPayList(String email, int cart_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVo> list = cartMapper.selectPayList(email, cart_no);
		
		
		map.put("list", list);
		
		return map;
	}

	@Override		// 전체구매
	public Map<String, Object> allPayList(String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVo> list = cartMapper.selectAllPayList(email);
		
		
		map.put("list", list);
		
		return map;
	}


}
