package com.site.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.service.CartService;
import com.site.service.ProductService;
import com.site.service.ReviewService;
import com.site.vo.CartVo;
import com.site.vo.ProductVo;
import com.site.vo.QnaVo;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	CartService cartService;
	
	// 메인페이지 호출
	@RequestMapping("/index")		
	public String index(@RequestParam(value="page", defaultValue="1")int page,
			@RequestParam @Nullable String sort,
			@RequestParam @Nullable String search,
			Model model) {
		Map<String, Object> map = null;
		
		if(search == null || search == "") {
			map = productService.productList(page, sort);		// 전체리스트 가져오기
		} else {
			map = productService.productListSearch(page, sort, search);		// 검색리스트 가져오기
		}
		
		model.addAttribute("map",map);
		
		return "/index";
	}
	
	// 상세뷰페이지 호출
	@RequestMapping("/product/productView")		
	public String detail(@RequestParam("product_no")int product_no, 
			@RequestParam(value="page", defaultValue="1")int page,
			Model model) {
		Map<String, Object> map = productService.productView(product_no);	
		
		// 상품 정보 호출
		model.addAttribute("map", map);
		
		// 리뷰 정보 받아오기
		Map<String, Object> review_map = reviewService.reviewList(page, product_no);
		model.addAttribute("review_map", review_map);
		
		return "/product/productView";
	}
	
	// 장바구니 저장
	@RequestMapping("/cart/cartInsert")
	public String cartInsert(CartVo cartVo) {
		
		return "redirect:/cart/cartList";
	}
	
	// 상품 등록페이지 호출 - 관리자
	@RequestMapping("/product/productInsert")
	public String productInsert() {
		return "/product/productInsert";
	}
	
	
	// 상품 등록 - 관리자
	@RequestMapping("/product/productInsertDo")
	public String productInsertDo(ProductVo productVo, @RequestPart List<MultipartFile> files) throws Exception { 
        productService.productInsertDo(productVo, files);	
		return "redirect:/index";
	}
	
	// 상품 수정페이지 호출 - 관리자
	@RequestMapping("/product/productModify")	
	public String productModify(@RequestParam("product_no")int product_no, Model model) {
		ProductVo productVo = productService.productModify(product_no);
		model.addAttribute(productVo);
		return "/product/productModify";
	}
	
	
}
