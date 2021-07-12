package com.site.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.CartMapper;
import com.site.mapper.PayMapper;
import com.site.mapper.ProductMapper;
import com.site.vo.CartVo;

@Service
public class PayServiceImpl implements PayService {

	public static String email;
	
	
	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	PayMapper payMapper;
	
	@Autowired
	ProductMapper productMapper;
	
	// 
	@Override
	public void paymentComplete( String email )
	{
//		List<CartVo> list= cartMapper.selectCartList();
		List<CartVo> list=cartMapper.selectCartListWithEmail(email);
		
		for(CartVo cartVo:list) {
			productMapper.updateStocks(cartVo);
		}
		cartMapper.deleteCartAllDelete( email );
	}

}