package com.kh.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semi.dao.ProductDao;
import com.kh.semi.dto.ProductDto;
import com.kh.semi.dto.ProductInfoDto;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDao productDao;
	


	// 상품 상세 페이지 - 상품 번호를 통해 페이지를 보여줌  
	@GetMapping("/detail")
	public String list(@RequestParam int productNo,
						Model model) {
		ProductInfoDto productInfoDto = productDao.selectOne(productNo);
		model.addAttribute("productInfoDto",productInfoDto); 
		
		return "/WEB-INF/views/product/detail.jsp";
	}
	
	// 상품 검색 결과 페이지
	@GetMapping("/search")
	public String list(Model model,
			@RequestParam String keyword
	) {
		// 검색결과 표시
		String searchCount = productDao.productCount(keyword);
		model.addAttribute("searchCount",searchCount);
				
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.searchBest(keyword);
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.searchNew(keyword);
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.searchCheap(keyword);
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.searchExpensive(keyword);
		model.addAttribute("expensiveList",expensiveList);
		
		return "/WEB-INF/views/product/search.jsp";
	}
}
