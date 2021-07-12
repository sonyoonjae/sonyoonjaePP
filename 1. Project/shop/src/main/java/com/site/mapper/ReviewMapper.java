package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.ReviewVo;

@Mapper
public interface ReviewMapper {

	// 리뷰 쓰기 저장
	void insertReviewWrite(ReviewVo reviewVo);
	// 리뷰 리스트 불러오기
	List<ReviewVo> selectReviewList(int startRow, int endRow, int product_no);
	// 리뷰 갯수
	int selectReviewCount();
	// 리뷰수정 페이지 호출
	ReviewVo selectReviewModify(int review_no);
	// 리뷰수정 저장
	void updateReviewModifyDo(ReviewVo reviewVo);
	// 리뷰 삭제
	void deleteReviewDelete(int review_no);

}
