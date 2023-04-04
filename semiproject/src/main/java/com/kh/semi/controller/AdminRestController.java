package com.kh.semi.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.kh.semi.dao.ProductCategoryStatDao;
import com.kh.semi.dto.ProductCategoryStatDto;

@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {

	@Autowired
	private ProductCategoryStatDao productCategoryStatDao;
	
	// 카테고리별 상품 개수
	@GetMapping("/categoryCount")
	public Map<String, List<Object>> categoryCount() {
		List<ProductCategoryStatDto> list = productCategoryStatDao.list();
		List<Object> tags = new ArrayList<>();
		List<Object> cnts = new ArrayList<>();
		for(ProductCategoryStatDto dto : list) {
			tags.add(dto.getTagNo());
			cnts.add(dto.getProductCnt());
		}
		Map<String, List<Object>> map = Map.of("label", tags, "cnts", cnts);
		return map;
	}
	
	// 카테고리별 판매량 평균, 최대값
	@GetMapping("/categorySellCount")
	public Map<String, List<Object>> categorySellCount() {
		List<ProductCategoryStatDto> list = productCategoryStatDao.list();
		List<Object> tags = new ArrayList<>();
		List<Object> avges = new ArrayList<>();
		List<Object> maxs = new ArrayList<>();
		for(ProductCategoryStatDto dto : list) {
			tags.add(dto.getTagNo());
			avges.add(dto.getSellAvg());
			maxs.add(dto.getSellMax());
		}
		Map<String, List<Object>> map = Map.of(
				"label", tags, "avges", avges, "maxs", maxs);
		return map;
	}
	
	// 카테고리별 가격 평균, 최대값, 최소값
	@GetMapping("/categoryPrice")
	public Map<String, List<Object>> categoryPrice() {
		List<ProductCategoryStatDto> list = productCategoryStatDao.list();
		List<Object> tags = new ArrayList<>();
		List<Object> avges = new ArrayList<>();
		List<Object> maxs = new ArrayList<>();
		List<Object> mins = new ArrayList<>();
		for(ProductCategoryStatDto dto : list) {
			tags.add(dto.getTagNo());
			avges.add(dto.getPriceAvg());
			maxs.add(dto.getPriceMax());
			mins.add(dto.getPriceMin());
		}
		Map<String, List<Object>> map = Map.of(
				"label", tags, "avges", avges, "maxs", maxs, "mins", mins);
		return map;
	}
	
}
