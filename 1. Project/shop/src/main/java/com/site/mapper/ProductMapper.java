package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.CartVo;
import com.site.vo.ProductVo;

@Mapper
public interface ProductMapper {

	// 전체리스트 호출
	List<ProductVo> selectProductList(int startRow, int endRow, String sort);
	// 전체 상품 수
	int selectProductCount();
	// 검색리스트 호출
	List<ProductVo> selectProductListSearch(int startRow, int endRow, String sort, String search);
	// 검색된 상품 수
	int selectProductSearchCount(String search);
	// 상세뷰페이지 호출
	ProductVo selectProductView(int product_no);
	// 상품등록 - 관리자
	void insertProductInsert(ProductVo productVo);
	// 상품 수정페이지 호출 - 관리자
	ProductVo selectProductModify(int product_no);
	void updateStocks( CartVo cartVo );
	
}