package com.site.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.site.mapper.ReviewMapper;
import com.site.vo.ProductVo;
import com.site.vo.ReviewVo;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewMapper reviewMapper;

	@Override // 리뷰 쓰기 저장
	public void reviewWriteDo(ReviewVo reviewVo, ProductVo productVo, MultipartFile file) {

		// 파일저장위 치
		String fileUrl = "D:/Workspaces/Eclipse/Java/teamproject/shop/src/main/resources/static";

		//
		String fileName=file.getOriginalFilename();
		
		//
		String uploadFileName="";
		//만약 fileName이 공백이 아니라면
		if (!fileName.equals("")) {
			long time = System.currentTimeMillis();
			uploadFileName = "/images/reviewUpload/" + time + "_" + fileName;
			File f = new File(fileUrl + uploadFileName);

			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		reviewVo.setReview_image(uploadFileName);
		reviewMapper.insertReviewWrite(reviewVo);
	}

	// 리뷰 리스트
	@Override
	public Map<String, Object> reviewList(int page, int product_no) {

		Map<String, Object> map = new HashMap<String, Object>();

		int limit = 10;

		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		List<ReviewVo> list = reviewMapper.selectReviewList(startRow, endRow, product_no);
		int listCount = 0; // 총 게시글 수
		listCount = reviewMapper.selectReviewCount();

		// 하단 최대 넘버링페이지
		int maxPage = (int) ((double) listCount / limit + 0.99);
		// 하단 시작 넘버링페이지
		int startPage = (((int) ((double) page / 10 + 0.99)) - 1) * 10 + 1;
		// 하단 끝 넘버링페이지
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

	// 리뷰 수정페이지 호출
	@Override
	public ReviewVo reviewModify(int review_no) {
		ReviewVo reviewVo = reviewMapper.selectReviewModify(review_no);
		return reviewVo;
	}

	// 리뷰 수정 저장
	@Override
	public void reviewModifyDo(ReviewVo reviewVo, MultipartFile file) {
		//파일 사이즈가 0이 아닌경우 (파일이 변경 된 경우)
		//기존의 파일이름 변경해서 -> boardMapper.updateBoardModifyDo(mvc_board);의 ()안에 넣어줌
		if (file.getSize() != 0) {
			
			//파일 저장위치
			String fileUrl = "C:/Users/user/eclipse-workspace/shop2/src/main/resources/static/upload/";
			
			// 파일이름 중복방지를 위한 파일명 변경
			long time = System.currentTimeMillis(); 
			String uploadFileName = time + "_" + file.getOriginalFilename();
			
			// 파일저장 - io를 import해서 자동으로 디렉토리 없으면 만들어서 저장시킴
			File f = new File(fileUrl + uploadFileName);
			
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 파일이름을 VO에 저장
			reviewVo.setReview_image(uploadFileName);
			
		}
		
		//파일변경된거 아니면 그대로 진행
		reviewMapper.updateReviewModifyDo(reviewVo);
	}

	// 리뷰 삭제
	@Override
	public void reviewDelete(int review_no) {
		reviewMapper.deleteReviewDelete(review_no);

	}

}
