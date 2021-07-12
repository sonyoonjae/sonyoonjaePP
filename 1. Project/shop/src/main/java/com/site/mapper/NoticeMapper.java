package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.site.vo.NoticeVo;

@Mapper
public interface NoticeMapper {
	
	// 공지사항 전체리스트
	List<NoticeVo> selectNoticeList(int startRow, int endRow);
	// 공지사항 전체글 수
	int selectNoticeCount();
	// 공지사항 조회수 1 증가
	void updatehit(int notice_no);
	// 공지사항 상세 뷰페이지 호출
	NoticeVo selectNoticeView(int notice_no);
	// 공지사항 글 작성
	void insertNoticeWriteDo(NoticeVo noticeVo);
	// 공지사항 글 삭제
	void deleteNoticeDelete(int notice_no);
	// 공지사항 글 수정 페이지 호출
	NoticeVo selectNoticeModify(int notice_no);
	// 공지사항 글 수정 저장
	void updateNoticeModifyDo(NoticeVo noticeVo);
	
	
	
	

}
