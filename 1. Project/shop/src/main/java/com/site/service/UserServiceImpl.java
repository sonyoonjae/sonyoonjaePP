package com.site.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.UserMapper;
import com.site.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;

	@Override		// 로그인
	public UserVo login(UserVo userVo) {
		return userMapper.selectLogin(userVo);
	}

	@Override		// 이메일 찾기
	public UserVo searchEmail(UserVo userVo) {
		return userMapper.selectSearchEmail(userVo);
	}

	@Override		// 비밀번호 찾기
	public UserVo searchPassword(UserVo userVo) {
		return userMapper.selectSearchPassword(userVo);
	}

	@Override		// 회원가입
	public void insertUser(UserVo userVo) {
		userMapper.insertUserDo(userVo);
	}

	@Override		// 이메일 중복체크
	public int emailCheck(String email) throws Exception {
		return userMapper.emailCheck(email);
	}

	@Override		// 임시 비밀번호 변경
	public void changePassword(String email, String temp_password) {
		userMapper.updatePassword(email, temp_password);
	}

	@Override		// 회원 전체리스트 호출
	public Map<String, Object> userList(int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int limit = 10;
		
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		List<UserVo> list = userMapper.selectUserList(startRow, endRow);
		int listCount = 0;	// 총 회원 수
		listCount = userMapper.selectUserCount();
		
		//하단 최대 넘버링페이지 
		int maxPage = (int)((double)listCount / limit + 0.99); 
		//하단 시작 넘버링페이지
		int startPage = (((int) ((double)page / 10 + 0.99)) - 1) * 10 + 1;
		//하단 끝 넘버링페이지
		int endPage = maxPage;
		// 1,2,3,4,5,6,7,8,9,10 -> 10개가 모두 있을 경우는 10을 endPage에 넣어줌.
		if (endPage > startPage + 10 - 1) {
			endPage = startPage + 10 - 1;
		}
		
		map.put("list", list);
		map.put("page", page);
		map.put("listCount", listCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		
		return map;
	}

	@Override		// 회원 리스트 검색
	public Map<String, Object> userListSearch(int page, String category, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<UserVo> list = null;
		
		int limit = 10;
		
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		int listCount = 0;
		
		if(category.equals("all")) {
			list = userMapper.selectUserListSearchAll(startRow, endRow, search);
			listCount = userMapper.selectUserSearchAllCount(search);
		} else {
			list = userMapper.selectUserListSearch(startRow, endRow, category, search);
			listCount = userMapper.selectUserSearchCount(category, search);
		}
		
		//하단 최대 넘버링페이지 
		int maxPage = (int)((double)listCount / limit + 0.99); 
		//하단 시작 넘버링페이지
		int startPage = (((int) ((double)page / 10 + 0.99)) - 1) * 10 + 1;
		//하단 끝 넘버링페이지
		int endPage = maxPage;
		// 1,2,3,4,5,6,7,8,9,10 -> 10개가 모두 있을 경우는 10을 endPage에 넣어줌.
		if (endPage > startPage + 10 - 1) {
			endPage = startPage + 10 - 1;
		}
		
		map.put("list", list);
		map.put("page", page);
		map.put("listCount", listCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		map.put("category", category);
		map.put("search", search);
		
		return map;
	}


	@Override //회원정보수정 호출
	public UserVo userModify(String email) {
		UserVo userVo = userMapper.selectUserModify(email);
		return userVo;
	}

	@Override //회원정보수정 저장
	public void modifyUser(UserVo userVo) {
		userMapper.updateUserModifyDo(userVo);
	}


}
