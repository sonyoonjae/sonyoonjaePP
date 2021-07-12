package com.site.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.site.service.ReviewService;
import com.site.vo.ProductVo;
import com.site.vo.ReviewVo;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	ReviewService reviewService;

	@RequestMapping("/reviewWrite") // 리뷰 글쓰기 페이지 호출
	public String reviewWrite(@RequestParam(value = "product_no") int product_no, Model model) {
		model.addAttribute("product_no", product_no);
		return "/review/reviewWrite";

	}

	// 리뷰 등록
	@RequestMapping("/reviewWriteDo")
	public String reviewWriteDo(ReviewVo reviewVo, ProductVo productVo, 
			@RequestPart MultipartFile file) throws Exception {
		reviewService.reviewWriteDo(reviewVo,productVo, file);

		return "redirect:/product/productView?product_no=" + productVo.getProduct_no();
	}

	@RequestMapping("/reviewModify") // review 수정페이지 호출
	public String reviewModify(@RequestParam("review_no") int review_no, Model model) {
		ReviewVo reviewVo = reviewService.reviewModify(review_no);
		model.addAttribute(reviewVo);
		return "/review/reviewModify";
	}

	@RequestMapping("/reviewModifyDo") // review 수정 저장
	public String reviewModifyDo(ReviewVo reviewVo,  @RequestPart MultipartFile file) {
		reviewService.reviewModifyDo(reviewVo, file);
		return "redirect:/product/productView?product_no=" + reviewVo.getProduct_no();
	}

	@RequestMapping("/reviewDelete") // review 삭제
	public String reviewDelete(@RequestParam("review_no") int review_no, ReviewVo reviewVo) {
		reviewService.reviewDelete(review_no);
		return "redirect:/product/productView?product_no=" + reviewVo.getProduct_no();
	}

}
