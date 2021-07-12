package com.site.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.site.mapper.ProductMapper;
import com.site.vo.ProductVo;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;

	@Override // 전체리스트 호출
	public Map<String, Object> productList(int page, String sort) {
		Map<String, Object> map = new HashMap<String, Object>();

		int limit = 9;

		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		List<ProductVo> list = productMapper.selectProductList(startRow, endRow, sort);

		int listCount = 0; // 총 상품 수
		listCount = productMapper.selectProductCount();


		// 하단 최대 넘버링페이지
		int maxPage = (int) ((double) listCount / limit + 0.99);
		// 하단 시작 넘버링페이지
		int startPage = (((int) ((double) page / 9 + 0.99)) - 1) * 9 + 1;
		// 하단 끝 넘버링페이지
		int endPage = maxPage;
		// 1,2,3,4,5,6,7,8,9,10 -> 10개가 모두 있을 경우는 10을 endPage에 넣어줌.
		if (endPage > startPage + 9 - 1) {
			endPage = startPage + 9 - 1;
		}

		// page는 현재페이지를 의미
		map.put("list", list);
		map.put("page", page);
		map.put("listCount", listCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		map.put("sort", sort);

		return map;
	}

	@Override // 검색리스트 호출
	public Map<String, Object> productListSearch(int page, String sort, String search) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<ProductVo> list = null;
		int limit = 9;

		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		int listCount = 0;
		list = productMapper.selectProductListSearch(startRow, endRow, sort, search);
		listCount = productMapper.selectProductSearchCount(search);


		int maxPage = (int) ((double) listCount / limit + 0.99);
		int startPage = (((int) ((double) page / 9 + 0.99)) - 1) * 9 + 1;
		int endPage = maxPage;
		if (endPage > startPage + 9 - 1) {
			endPage = startPage + 9 - 1;
		}

		map.put("list", list);
		map.put("page", page);
		map.put("listCount", listCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		map.put("sort", sort);
		map.put("search", search);

		return map;
	}

	@Override // 상세뷰페이지 호출
	public Map<String, Object> productView(int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVo productVo = productMapper.selectProductView(product_no);
		map.put("productVo", productVo);

		return map;
	}

	@Override // 상품등록
	public void productInsertDo(ProductVo productVo, List<MultipartFile> files) {

		int i = 0;
		List<String> list = new ArrayList<>();
		// 2. 파일첨부 되는 것 체크
		for (MultipartFile file : files) {
			i++;
			// 파일저장위치
			String originalfileName = file.getOriginalFilename();

			// 파일이름중복방지
			long time = System.currentTimeMillis();
			String uploadFileName = time + "_" + originalfileName;
			File f = new File("D:/Workspaces/Eclipse/Java/teamproject/shop/src/main/resources/static/images/product_images/" + uploadFileName);

			// 파일저장
			// File f = new File(fileUrl + uploadFileName);
			// 파일전송
//			try {
//				file.transferTo(f); 
//			} catch (Exception e) {
//				e.printStackTrace();
//			}

			uploadFileName="/images/product_images/"+uploadFileName;
			// 파일이름 삽입
			if (i == 1) {
				productVo.setProduct_main_image(uploadFileName);
			} else if (i == 2) {
				productVo.setProduct_image1(uploadFileName);
			} else if (i == 3) {
				productVo.setProduct_image2(uploadFileName);
			} else if (i == 4) {
				productVo.setProduct_image3(uploadFileName);
			} else if (i == 5) {
				productVo.setProduct_image4(uploadFileName);
			} else if (i == 6) {
				productVo.setProduct_image5(uploadFileName);
			}
			try {
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		productMapper.insertProductInsert(productVo);

	}

	@Override		// 상품 수정페이지 호출
	public ProductVo productModify(int product_no) {
		ProductVo productVo = productMapper.selectProductModify(product_no);
		return productVo;
	}

}
