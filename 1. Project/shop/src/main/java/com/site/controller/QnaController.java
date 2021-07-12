package com.site.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

import com.site.service.QnaService;
import com.site.vo.QnaVo;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/qnaList")		// qna 전체리스트 호출
	public String qnaList(@RequestParam(value="page", defaultValue = "1")int page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			Model model) {
		
		Map<String, Object> map = null;
		
		if(category == null || category == "" || search == null || search == "") {
			map = qnaService.qnaList(page);
		} else {
			map = qnaService.qnaListSearch(page, category, search);
		}
		
		model.addAttribute("map", map);
		
		return "/qna/qnaList";
	}
	
	@RequestMapping("/qnaWrite")	// qna 쓰기 호출
	public String qnaWrite() {
		return "/qna/qnaWrite";
	}
	
	@RequestMapping("/qnaWriteDo") //쓰기저장 호출
	public String writeDo(QnaVo qnaVo) {
		// 데이터, 파일첨부에서 넘어온 파일명을 매개변수로 보냄.
		qnaService.qnaWriteDo(qnaVo);
		
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping("/qnaView")		// qna 상세 뷰페이지 호출
	public String qnaView(@RequestParam("qna_no")int qna_no, Model model) {
		Map<String, Object> map = qnaService.qnaView(qna_no);
		model.addAttribute("map", map);
		
		return "/qna/qnaView";
	}
	
	@RequestMapping("/qnaDelete")	// qna 삭제 호출
	public String qnaDelete(@RequestParam("qna_no")int qna_no) {
		qnaService.qnaDelete(qna_no);
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping("/qnaModify")	// qna 수정페이지 호출
	public String qnaModify(@RequestParam("qna_no")int qna_no, Model model) {
		QnaVo qnaVo = qnaService.qnaModify(qna_no);
		model.addAttribute(qnaVo);
		return "/qna/qnaModify";
	}
	
	@RequestMapping("/qnaModifyDo")	// qna 수정 저장
	public String qnaModifyDo(QnaVo qnaVo) {
		qnaService.qnaModifyDo(qnaVo);
		return "redirect:/qna/qnaList?qna_no=" + qnaVo.getQna_no();
	}
	
	@RequestMapping("/qnaReply")	// 답글페이지 호출
	public String qnaReply(@RequestParam("qna_no")int qna_no, Model model) {
		QnaVo qnaVo = qnaService.qnaModify(qna_no);
		model.addAttribute(qnaVo);
		return "/qna/qnaReply";
	}
	
	@RequestMapping("/qnaReplyDo")	// qna 답글 저장
	public String qnaReplyDo(QnaVo qnaVo, Model model) {
		qnaService.qnaReplyDo(qnaVo);
		return "redirect:/qna/qnaList";
	}
}
