package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.UserVo;


@Mapper
public interface UserMapper {

	// 로그인
	UserVo selectLogin(UserVo userVo);
	// 이메일 찾기
	UserVo selectSearchEmail(UserVo userVo);
	// 비밀번호 찾기
	UserVo selectSearchPassword(UserVo userVo);
	// 회원가입
	void insertUserDo(UserVo userVo);
	// 이메일 중복체크
	int emailCheck(String email);
	// 임시 비밀번호 저장
	void updatePassword(String email, String temp_password);
	// 회원 전체리스트 호출
	List<UserVo> selectUserList(int startRow, int endRow);
	// 전체 회원 수
	int selectUserCount();
	// all로 검색한 회원 리스트
	List<UserVo> selectUserListSearchAll(int startRow, int endRow, String search);
	// all로 검색한 회원 수
	int selectUserSearchAllCount(String search);
	// category별로 검색한 회원 리스트
	List<UserVo> selectUserListSearch(int startRow, int endRow, String category, String search);
	// category별로 검색한 회원 수
	int selectUserSearchCount(String category, String search);
	//회원정보수정 호출
	UserVo selectUserModify(String email);
	//회원정보수정 저장
	void updateUserModifyDo(UserVo userVo);


}
