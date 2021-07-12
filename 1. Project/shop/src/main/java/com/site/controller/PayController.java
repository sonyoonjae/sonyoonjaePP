package com.site.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.service.PayService;
import com.site.service.PayServiceImpl;
import com.site.vo.CartVo;


@Controller
public class PayController {
	
	@Autowired
	PayService payService;
	
	// 구매완료
	@RequestMapping("/pay/complete")
	public String payComplete() {
		String email=PayServiceImpl.email;
		payService.paymentComplete( email );
		
		
		return "/pay/shopping_success";
	}
}