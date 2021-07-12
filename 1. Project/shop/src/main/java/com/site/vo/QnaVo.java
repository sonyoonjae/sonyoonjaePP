package com.site.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaVo {
	
	private int qna_no;					// qna 번호
	private String email;				// user email
	private String qna_name;			// qna 글 작성자
	private String qna_title;			// qna 제목
	private String qna_content;			// qna 내용
	private Timestamp qna_date;			// qna 작성일
	private int qna_hit;				// qna 조회수
	private int qna_group;				// qna 답글그룹
	private int qna_step;				// qna 답글스텝
	private int qna_indent;				// qna 답글indent
	private int qna_secret_code;		// qna 비밀글코드
	private String qna_original_name;  	// qna 원 글 작성자
	
}
