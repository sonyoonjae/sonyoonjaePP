package com.site.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {
	
	private int review_no;
	private String email;
	private int product_no;
	private String review_title;
	private String review_content;
	private String review_image;
	private Timestamp review_date;
	private int review_ratings;

}
