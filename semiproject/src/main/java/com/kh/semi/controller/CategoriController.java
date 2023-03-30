package com.kh.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.dao.ProductDao;
import com.kh.semi.dao.ProductTagDao;
import com.kh.semi.dto.ProductInfoDto;

@Controller
@RequestMapping("/categori") // 카테고리별 매핑 
public class CategoriController {
	
//	// 전체 
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductTagDao productTagDao;
	
	// 전체
	@GetMapping("/all")
	public String all(Model model) { 
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestAll();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newAll();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapAll();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveAll();
		model.addAttribute("expensiveList",expensiveList);
				
		return "/WEB-INF/views/categori/all.jsp";
	}
	
	// 태그 1번 피부
	@GetMapping("/tag1")
	public String tag1(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag1();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag1();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag1();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag1();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag1.jsp";
	}
	
	// 태그 2번 다이어트
	@GetMapping("/tag2")
	public String tag2(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag2();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag2();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag2();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag2();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag2.jsp";
	}
	// 태그 3번 여성
	@GetMapping("/tag3")
	public String tag3(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag3();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag3();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag3();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag3();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag3.jsp";
	}
	// 태그 4번 활력
	@GetMapping("/tag4")
	public String tag4(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag4();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag4();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag4();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag4();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag4.jsp";
	}
	// 태그 5번 남성
	@GetMapping("/tag5")
	public String tag5(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag5();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag5();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag5();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag5();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag5.jsp";
	}
	// 태그 6번 눈
	@GetMapping("/tag6")
	public String tag6(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag6();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag6();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag6();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag6();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag6.jsp";
	}
	// 태그 7번 치아
	@GetMapping("/tag7")
	public String tag7(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag7();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag7();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag7();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag7();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag7.jsp";
	}
	// 태그 8번 뼈
	@GetMapping("/tag8")
	public String tag8(Model model) {
		
		// 상품 인기순 (판매량 제일 많은 순) 
		List<ProductInfoDto> bestList = productDao.bestTag8();
		model.addAttribute("bestList",bestList); 
		// 최신순
		List<ProductInfoDto> newList = productDao.newTag8();
		model.addAttribute("newList",newList);
		// 낮은 가격순 
		List<ProductInfoDto> cheapList = productDao.cheapTag8();
		model.addAttribute("cheapList",cheapList);
		// 높은 가격순
		List<ProductInfoDto> expensiveList = productDao.expensiveTag8();
		model.addAttribute("expensiveList",expensiveList);
		return "/WEB-INF/views/categori/tag8.jsp";
	}
}
