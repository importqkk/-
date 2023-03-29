package com.kh.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.dao.ProductDao;
import com.kh.semi.dao.ProductTagDao;
import com.kh.semi.dto.ProductDto;

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
		
		// 카테고리중, 모든 제품들을 select해서 list로 생성한다. 
		List<ProductDto> list = productDao.selectAll();
		// all.jsp 측으로 list형태로 보내기
		model.addAttribute("list",list);
		
		return "/WEB-INF/views/categori/all.jsp";
	}
	
	// 태그 1번 피부
	@GetMapping("/tag1")
	public String tag1(Model model) {
	
		// 1번 태그를 select해서 보여준다.
		List<ProductDto> list = productDao.selectTag1();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag1.jsp";
	}
	
	// 태그 2번 다이어트
	@GetMapping("/tag2")
	public String tag2(Model model) {
		
		List<ProductDto> list = productDao.selectTag2();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag2.jsp";
	}
	// 태그 3번 여성
	@GetMapping("/tag3")
	public String tag3(Model model) {
		
		List<ProductDto> list = productDao.selectTag3();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag3.jsp";
	}
	// 태그 4번 활력
	@GetMapping("/tag4")
	public String tag4(Model model) {
		
		List<ProductDto> list = productDao.selectTag4();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag4.jsp";
	}
	// 태그 5번 남성
	@GetMapping("/tag5")
	public String tag5(Model model) {
		
		List<ProductDto> list = productDao.selectTag5();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag5.jsp";
	}
	// 태그 6번 눈
	@GetMapping("/tag6")
	public String tag6(Model model) {
		
		List<ProductDto> list = productDao.selectTag6();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag6.jsp";
	}
	// 태그 7번 치아
	@GetMapping("/tag7")
	public String tag7(Model model) {
		
		List<ProductDto> list = productDao.selectTag7();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag7.jsp";
	}
	// 태그 8번 뼈
	@GetMapping("/tag8")
	public String tag8(Model model) {
		
		List<ProductDto> list = productDao.selectTag8();
		model.addAttribute("list",list);
		return "/WEB-INF/views/categori/tag8.jsp";
	}
}
