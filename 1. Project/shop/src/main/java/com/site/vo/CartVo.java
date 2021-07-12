package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVo {

	private int cart_no;				// 장바구니 번호
	private String email;				// 이메일
	private int product_no;				// 상품번호
	private String product_name;		// 상품이름
	private int product_count;			// 상품갯수
	private int product_price;			// 상품가격
	private int product_total_price;	// 상품 총합 가격
	private String product_main_image;	// 상품 메인이미지
	private int product_size;			// 사이즈 표시 - ex) 230, 240, ..., 300
	
}
