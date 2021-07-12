package com.site.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.site.vo.UserVo;

@Service
public interface UserService {

	// 로그인
	UserVo login(UserVo userVo);
	// 이메일 찾기
	UserVo searchEmail(UserVo userVo);
	// 비밀번호 찾기
	UserVo searchPassword(UserVo userVo);
	// 회원가입
	void insertUser(UserVo userVo);
	// 이메일 중복체크
	int emailCheck(String email) throws Exception;
	// 임시 비밀번호 저장
	void changePassword(String email, String temp_password);
	// 회원 전체리스트 호출
	Map<String, Object> userList(int page);
	// 회원 리스트 검색
	Map<String, Object> userListSearch(int page, String category, String search);
	// 회원정보수정 페이지 호출
	UserVo userModify(String email);
	// 회원정보 수정저장
	void modifyUser(UserVo userVo);

		
	
	

}
