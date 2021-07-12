package com.site.service;

import java.util.Map;

import com.site.vo.QnaVo;

public interface QnaService {

	// qna 전체리스트 호출
	Map<String, Object> qnaList(int page);
	// qna 검색리스트 호출
	Map<String, Object> qnaListSearch(int page, String category, String search);
	// qna 쓰기 저장
	void qnaWriteDo(QnaVo qnaVo);
	// qna 상세 뷰페이지 호출
	Map<String, Object> qnaView(int qna_no);
	// qna 글 삭제
	void qnaDelete(int qna_no);
	// qna 수정페이지 호출
	QnaVo qnaModify(int qna_no);
	// qna 수정 저장
	void qnaModifyDo(QnaVo qnaVo);
	// qna 답글 저장
	void qnaReplyDo(QnaVo qnaVo);

}
