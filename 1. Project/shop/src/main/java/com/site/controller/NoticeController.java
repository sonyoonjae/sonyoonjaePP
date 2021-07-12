package com.site.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.site.service.NoticeService;

import com.site.vo.NoticeVo;



@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	
	@RequestMapping("/noticeList") //리스트페이지 호출
	public String noticeList(@RequestParam (value="page", defaultValue = "1") int page, 
						Model model) {
		Map<String,Object> map = null;
		map = noticeService.noticeList(page); //전체리스트 가져오기
		
		model.addAttribute("map",map);
		
		return "/notice/noticeList";
	}
	
	@RequestMapping("/noticeView") //뷰페이지 호출 view?notice_no=${notice_no}
	public String noticeView(@RequestParam("notice_no") int notice_no,
			Model model) {
		//Mvc_board객체 1개 가져옴
		Map<String,Object> map = noticeService.noticeView(notice_no);
		
		model.addAttribute("map",map);
		
		return "/notice/noticeView";
	
	}
	
	@RequestMapping("/noticeWrite") //쓰기페이지 호출
	public String noticeWrite() {
		return "/notice/noticeWrite";
	}
	
	@RequestMapping("/noticeWriteDo") //쓰기저장 호출
	public String noticeWriteDo(NoticeVo noticeVo, @RequestPart MultipartFile file) {
		noticeService.noticeWriteDo(noticeVo, file);
		return "redirect:/notice/noticeList";
	}
	
	@RequestMapping("/noticeDelete") //글 삭제
	public String delete(@RequestParam("notice_no") int notice_no) {
		noticeService.noticeDelete(notice_no);
		return "redirect:/notice/noticeList";
	}
	
	@RequestMapping("/noticeModify") //수정페이지 호출
	public String modify(@RequestParam("notice_no") int notice_no, Model model) {
		NoticeVo noticeVo = noticeService.noticeModify(notice_no);
		model.addAttribute(noticeVo);
		return "/notice/noticeModify";
	}
	
	@RequestMapping("/noticeModifyDo") //수정페이지 호출
	public String modifyDo(NoticeVo noticeVo, @RequestPart MultipartFile file) {
		noticeService.noticeModifyDo(noticeVo, file);
		return "redirect:/notice/noticeList?notice_no=" + noticeVo.getNotice_no();
	}
	

}
