package com.site.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVo {
	
	private int notice_no;			// 공지사항 번호
	private String email;			// 사용자 이메일
	private String notice_title;	// 공지사항 제목
	private String notice_content;	// 공지사항 내용
	private Timestamp notice_date;	// 공지사항 작성일
	private int notice_hit;			// 공지사항 조회수
	private String notice_image;	// 공지사항 이미지

}
