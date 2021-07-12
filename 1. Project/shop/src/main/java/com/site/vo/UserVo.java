package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVo {

	private String email;		// 사용자 이메일
	private int user_no;		// 사용자 번호
	private String password;	// 사용자 비밀번호
	private String name;		// 사용자 이름
	private String phone_no;	// 사용자 전화번호
	private String birth;		// 사용자 생년월일
	private int admin_code;		// 사용자, 관리자코드
	private String address1;	// 사용자 주소1
	private String address2;	// 사용자 주소2
	private String zipcode;		// 사용자 우편번호

}
