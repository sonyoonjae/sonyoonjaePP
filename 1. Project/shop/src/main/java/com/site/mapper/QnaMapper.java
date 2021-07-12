package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.QnaVo;

@Mapper
public interface QnaMapper {

	// qna 전체리스트 호출
	List<QnaVo> selectQnaList(int startRow, int endRow);
	// qna 전체글 수
	int selectQnaCount();
	// qna all로 검색한 리스트 호출
	List<QnaVo> selectQnaListSearchAll(int startRow, int endRow, String search);
	// qna all로 검색한 수
	int selectQnaSearchAllCount(String search);
	// qna category별 검색한 리스트 호출
	List<QnaVo> selectQnaListSearch(int startRow, int endRow, String category, String search);
	// qna category별 검색한 수
	int selectQnaSearchCount(String category, String search);
	// qna 쓰기 저장
	void insertQnaWriteDo(QnaVo qnaVo);
	// 조회수 1 증가
	void updateHit(int qna_no);
	// qna 상세 뷰페이지 호출
	QnaVo selectQnaView(int qna_no);
	// qna 이전글 호출
	QnaVo selectQnaViewPre(int qna_no);
	// qna 다음글 호출
	QnaVo selectQnaViewNext(int qna_no);
	// qna 글 삭제
	void deleteQnaDelete(int qna_no);
	// qna 수정페이지 호출
	QnaVo selectQnaModify(int qna_no);
	// qna 수정 저장
	void updateQnaModifyDo(QnaVo qnaVo);
	// qna step 1 증가
	void updateQnaReplyDoPlus(QnaVo qnaVo);
	// qna 답글 저장
	void insertQnaReplyDo(QnaVo qnaVo);

}
