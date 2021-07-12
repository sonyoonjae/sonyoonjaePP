package com.site.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import com.site.service.UserService;
import com.site.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/login")	// 로그인
	public String login() {
		return "/user/login";
	}

	
	@GetMapping("/logout")		// 로그아웃
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index";
	}
	
	
	@RequestMapping(value="/login_ajax")		// 로그인 호출
	@ResponseBody
	public Map<String,Object> login_ajax(UserVo userVo,
								HttpServletRequest request,
								Model model) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		UserVo uVo = userService.login(userVo); //전체리스트 가져오기
		map.put("uVo", uVo);
		if(uVo == null) {
			map.put("flag", "fail");
			map.put("msg", "이메일과 패스워드가 일치하지 않습니다.");
		} else {
			map.put("flag", "success");
			map.put("msg", "로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("session_flag","success");
			session.setAttribute("session_email", uVo.getEmail());
			session.setAttribute("session_admin_code", uVo.getAdmin_code());
			session.setAttribute("name", uVo.getName());
			session.setAttribute("session_phone_no", uVo.getPhone_no());
			session.setAttribute("session_address1",uVo.getAddress1() );
			session.setAttribute("session_address2",uVo.getAddress2() );
			session.setAttribute("session_zipcode", uVo.getZipcode());
			
		}
		return map;
	}
	
	@RequestMapping("/joinForm")		// 회원가입 폼 페이지 호출
	public String joinForm() {
		return "/user/joinForm";
	}
	
	@RequestMapping("/joinDo")			// 회원가입
	public String joinDo(UserVo userVo) {
		userService.insertUser(userVo);
		return "redirect:/index";
	}
	
	@RequestMapping(value="/emailChk", method = RequestMethod.POST)		// 이메일 중복체크
	@ResponseBody
	public String emailChkPOST(String email) throws Exception {
		int result = userService.emailCheck(email);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	@RequestMapping("/emailPasswordSearch")			// 이메일&패스워드 찾기페이지 호출
	public String emailPasswordSearch() {
		return "/user/emailPasswordSearch";
	}
	
	
	@RequestMapping(value="/search_email")			// 이메일 찾기
	@ResponseBody
	public Map<String, Object> search_email(UserVo userVo,
			HttpServletRequest request,
			Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		UserVo uVo = userService.searchEmail(userVo);
		map.put("uVo", uVo);
		
		if(uVo == null) {
			map.put("flag", "fail");
			map.put("msg", "입력하신 이름과 전화번호가 목록에 없습니다.");
		} else {
			map.put("flag", "success");
			map.put("msg", "이름과 전화번호 일치합니다!");
			HttpSession session = request.getSession();
			session.setAttribute("session_flag", "success");
			session.setAttribute("session_email", uVo.getEmail());
			session.setAttribute("session_phone_no", uVo.getPhone_no());
			session.setAttribute("name", uVo.getName());
		}
		
		return map;
	}
	
	@RequestMapping("/emailSearchSuccess")			// 이메일 찾기 성공페이지 호출
	public String emailSearchSuccess() {
		return "/user/emailSearchSuccess";
	}
	
	@RequestMapping(value="/search_password")		// 비밀번호 찾기
	@ResponseBody
	public Map<String, Object> search_password(UserVo userVo,
			HttpServletRequest request,
			Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		UserVo uVo = userService.searchPassword(userVo);
		map.put("uVo", uVo);
		
		if(uVo == null) {
			map.put("flag", "fail");
			map.put("msg", "입력하신 이름과 이메일이 목록에 없습니다.");
		} else {
			map.put("flag", "success");
			map.put("msg", "이름과 이메일이 일치합니다!");
			HttpSession session = request.getSession();
			session.setAttribute("session_flag", "success");
			session.setAttribute("session_email", uVo.getEmail());
			session.setAttribute("session_phone_no", uVo.getPhone_no());
			session.setAttribute("session_name",uVo.getName() );
			session.setAttribute("session_address1",uVo.getAddress1() );
			session.setAttribute("session_address2",uVo.getAddress2() );
			session.setAttribute("session_zipcode", uVo.getZipcode());

			// 임의의 문자열+난수 생성
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			}
			
			String temp_password = temp.toString();
			userService.changePassword(uVo.getEmail(), temp_password);		// 임시 비밀번호 저장
			session.setAttribute("session_temp_password", temp_password);			
		}
		
		return map;
	}
	
	@RequestMapping("/passwordSearchSuccess")			// 비밀번호 찾기 성공페이지 호출
	public String passwordSearchSuccess() {
		return "/user/passwordSearchSuccess";
	}
	
	@RequestMapping("/adminList")			// 관리자 리스트페이지 호출
	public String adminList() {
		return "/user/adminList";
	}
	
	@RequestMapping("/userList")			// 회원 전체리스트 호출
	public String userList(@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			Model model) {
		
		Map<String, Object> map = null;
		
		if(category == null || category == "" || search == null || search == "") {
			map = userService.userList(page);
		} else {
			map = userService.userListSearch(page, category, search);
		}
		
		model.addAttribute("map", map);
		
		return "/user/userList";
	}
	
	
	//회원정보수정 페이지호출
	@RequestMapping("/userModify")
	public String modify(@RequestParam("email") String email,Model model) {
		UserVo userVo = userService.userModify(email);
		model.addAttribute(userVo);
		return "/user/userModify";
	}
	
	// 회원정보 수정저장
	@RequestMapping("/userModifyDo")
	public String modifyDo(UserVo userVo) {
		userService.modifyUser(userVo);
		return "redirect:/index";
	}
	
	
	
}