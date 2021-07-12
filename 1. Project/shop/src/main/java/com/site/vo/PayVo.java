package com.site.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayVo {

	private int order_no;					// 주문번호
	private String user_email;				// 사용자 이메일
	private int total_price;				// 총합 금액
	private Timestamp pay_completed_date; 	// 결제 완료일
	private int product_no;					// 상품번호
	private int product_price;				// 상품금액
	private int product_count;				// 상품갯수
	private int product_size;				// 상품사이즈
	
}
