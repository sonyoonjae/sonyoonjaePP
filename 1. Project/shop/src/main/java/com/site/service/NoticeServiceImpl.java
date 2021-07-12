package com.site.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.site.mapper.NoticeMapper;
import com.site.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;

	@Override //전체리스트 호출
	public Map<String, Object> noticeList(int page) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		int limit = 10;
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		List<NoticeVo> list = noticeMapper.selectNoticeList(startRow, endRow);
		int listCount = 0;
		listCount = noticeMapper.selectNoticeCount();
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = (((int)((double)page / 10 + 0.95)) - 1) * 10 + 1;
		int endPage = maxPage;
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


	@Override  //뷰페이지 
	public Map<String, Object> noticeView(int notice_no) {
		Map<String,Object> map = new HashMap<String, Object>();
		noticeMapper.updatehit(notice_no);
		NoticeVo noticeVo = noticeMapper.selectNoticeView(notice_no);
		
		String content = noticeVo.getNotice_content();
	    content = content.replace( "\n", "<br>" );
	    noticeVo.setNotice_content( content );
		map.put("noticeVo", noticeVo);

		return map;
	}
	
	@Override //글쓰기
	public void noticeWriteDo(NoticeVo noticeVo, MultipartFile file) {

		String fileUrl = "D:/workspace3/project_3/src/main/resources/static/";	
		long time = System.currentTimeMillis();
		String uploadImage = "images/noticeUpload/" + time + "_" + file.getOriginalFilename();
		File f = new File(fileUrl + uploadImage);
		
		try {
			file.transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeVo.setNotice_image(uploadImage);
		noticeMapper.insertNoticeWriteDo(noticeVo);
	}

	@Override //게시글 삭제
	public void noticeDelete(int notice_no) {
		noticeMapper.deleteNoticeDelete(notice_no);
		
	}

	@Override //수정페이지 호출
	public NoticeVo noticeModify(int notice_no) {
		NoticeVo noticeVo = noticeMapper.selectNoticeModify(notice_no);
		return noticeVo;
	}

	@Override //수정페이지 저장
	public void noticeModifyDo(NoticeVo noticeVo, MultipartFile file) {
		String fileUrl = "C:/Users/Koreavc/git/shoppingmall/test0617/src/main/resources/static/noticeUpload/";	
		long time = System.currentTimeMillis();
		String uploadImage = time + "_" + file.getOriginalFilename();
		File f = new File(fileUrl + uploadImage);
		
		try {
			file.transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		noticeVo.setNotice_image(uploadImage);
		noticeMapper.updateNoticeModifyDo(noticeVo);
		
	}


}
