package com.site.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.QnaMapper;
import com.site.vo.QnaVo;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaMapper qnaMapper;

	@Override		// qna 전체리스트 호출
	public Map<String, Object> qnaList(int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int limit = 10;
		
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		List<QnaVo> list = qnaMapper.selectQnaList(startRow, endRow);
		int listCount = 0;	// 총 게시글 수
		listCount = qnaMapper.selectQnaCount();
		
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

	@Override		// qna 검색리스트 호출
	public Map<String, Object> qnaListSearch(int page, String category, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QnaVo> list = null;
		
		int limit = 10;
		
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		int listCount = 0;
		
		if(category.equals("all")) {
			list = qnaMapper.selectQnaListSearchAll(startRow, endRow, search);
			listCount = qnaMapper.selectQnaSearchAllCount(search);
		} else {
			list = qnaMapper.selectQnaListSearch(startRow, endRow, category, search);
			listCount = qnaMapper.selectQnaSearchCount(category, search);
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

	@Override		// qna 쓰기 저장
	public void qnaWriteDo(QnaVo qnaVo) {
		qnaMapper.insertQnaWriteDo(qnaVo);
	}

	@Override		// qna 상세 뷰페이지 호출
	public Map<String, Object> qnaView(int qna_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		qnaMapper.updateHit(qna_no);	// 조회수 1 증가
		QnaVo qnaVo = qnaMapper.selectQnaView(qna_no);
		// 이전글
		QnaVo qnaPre = qnaMapper.selectQnaViewPre(qna_no);
		// 다음글
		QnaVo qnaNext = qnaMapper.selectQnaViewNext(qna_no);
		String content = qnaVo.getQna_content();
	    content = content.replace( "\n", "<br>" );
	    qnaVo.setQna_content( content );
		map.put("qnaVo", qnaVo);
		map.put("qnaPre", qnaPre);
		map.put("qnaNext", qnaNext);
		
		return map;
	}

	@Override		// qna 글 삭제
	public void qnaDelete(int qna_no) {
		qnaMapper.deleteQnaDelete(qna_no);
	}

	@Override		// qna 수정페이지 호출
	public QnaVo qnaModify(int qna_no) {
		QnaVo qnaVo = qnaMapper.selectQnaModify(qna_no);
		return qnaVo;
	}

	@Override		// 수정 저장
	public void qnaModifyDo(QnaVo qnaVo) {
		qnaMapper.updateQnaModifyDo(qnaVo);
	}

	@Override		// 답글 저장
	public void qnaReplyDo(QnaVo qnaVo) {
		qnaMapper.insertQnaReplyDo(qnaVo);
		qnaMapper.updateQnaReplyDoPlus(qnaVo);
	}

}
