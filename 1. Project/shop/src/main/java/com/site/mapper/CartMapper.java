package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.CartVo;

@Mapper
public interface CartMapper {

	// 장바구니 리스트 호출
	List<CartVo> selectCartList();
	// 장바구니 한 개 삭제
	void deleteCartDelete(String email, int cart_no);
	// 장바구니 전체삭제
	void deleteCartAllDelete(String email);
	// 장바구니 추가
	void cartInsertDo(CartVo cartVo);
	// 선택구매 페이지 호출
	List<CartVo> selectPayList(String email, int cart_no);
	// 전체구매 페이지 호출
	List<CartVo> selectAllPayList(String email);
	// 장바구니 리스트 이메일로 불러오기
	List<CartVo> selectCartListWithEmail( String email );

}
