package com.site.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.site.vo.NoticeVo;


public interface NoticeService {


	// 공지사항 전체 리스트 호출
	Map<String, Object> noticeList(int page);
	// 공지사항 상세 뷰페이지 호출
	Map<String, Object> noticeView(int notice_no);
	// 공지사항 글 작성
	void noticeWriteDo(NoticeVo noticeVo, MultipartFile file);
	// 공지사항 글 삭제
	void noticeDelete(int notice_no);
	// 공지사항 글 수정 페이지 호출
	NoticeVo noticeModify(int notice_no);
	// 공지사항 글 수정 저장
	void noticeModifyDo(NoticeVo noticeVo, MultipartFile file);
	

}
