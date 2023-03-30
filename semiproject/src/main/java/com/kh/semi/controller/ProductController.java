package com.kh.semi.controller;

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
	
	// 상품 리스트 페이지 
	
}
