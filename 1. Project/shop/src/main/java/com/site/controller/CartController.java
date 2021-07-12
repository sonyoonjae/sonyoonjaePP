package com.site.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.CartService;
import com.site.service.PayServiceImpl;
import com.site.vo.CartVo;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("/cart/cartList")		// 장바구니 리스트
	public String cartList(Model model) {
		Map<String, Object> map = null;
		
		map = cartService.cartList();
		model.addAttribute("map", map);
		
		return "/cart/cartList";
	}
	
	@RequestMapping("/cart/cartDelete")		// 장바구니 선택 삭제
	public String cartDelete(@RequestParam("email") String email, @RequestParam("cart_no")int cart_no) {
		cartService.cartDelete(email, cart_no);
		return "redirect:/cart/cartList";
	}
	
	@RequestMapping("/cart/cartAllDelete")	// 장바구니 전체 삭제
	public String cartAllDelete(@RequestParam("email") String email) {
		cartService.cartAllDelete(email);
		return "redirect:/cart/cartList";
	}
	
	@RequestMapping("/pay/selectedPayment")			// 결제창 리스트
	public String selectedPayment(@RequestParam("email")String email,
			@RequestParam("cart_no")int cart_no, 
			Model model) {
		Map<String, Object> map = null;
		

		PayServiceImpl.email=email;
		map = cartService.selectedPayList(email, cart_no);
		model.addAttribute("map", map);
		return "/pay/payment";
	}
	
	@RequestMapping("/pay/allPayment")			// 결제창 리스트
	public String allPayment(@RequestParam("email")String email,
			Model model) {
		Map<String, Object> map = null;
		
		PayServiceImpl.email=email;
		map = cartService.allPayList(email);
		model.addAttribute("map", map);
		return "/pay/payment";
	}
	
	
}