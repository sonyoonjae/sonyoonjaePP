package com.site.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.site.vo.ProductVo;
import com.site.vo.UserVo;

public interface ProductService {

	// 전체리스트 호출
	Map<String, Object> productList(int page, String sort);	
	// 검색리스트 호출
	Map<String, Object> productListSearch(int page, String sort, String search);	
	// 상세뷰페이지 호출
	Map<String, Object> productView(int product_no);
	// 상품등록 - 관리자
	void productInsertDo(ProductVo productVo, List<MultipartFile> files);
	// 상품 수정페이지 호출 - 관리자
	ProductVo productModify(int product_no);

}
