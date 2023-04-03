package com.kh.semi.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.semi.dao.MainImgDao;
import com.kh.semi.dao.ProductInfoDao;
import com.kh.semi.dto.MainImgConnectDto;
import com.kh.semi.dto.ProductInfoDto;

@Controller
public class MainController {

	@Autowired
	private MainImgDao mainImgDao;
	@Autowired
	private ProductInfoDao productInfoDao;
	
	@RequestMapping("/")
	public String main(@ModelAttribute ProductInfoDto productInfoDto,
			@ModelAttribute MainImgConnectDto mainImgConnectDto,
			Model model) {
		
		// 메인 이미지
		List<MainImgConnectDto> mainImgList = mainImgDao.mainImgList();
		model.addAttribute("mainImgList", mainImgList);
		
		// 전체 상품 (재고 많은 순)
		List<ProductInfoDto> productList = productInfoDao.productList();
		model.addAttribute("productList", productList);
		
		// 최신상품 정렬
		List<ProductInfoDto> newProduct = productInfoDao.newList();
		model.addAttribute("newProduct", newProduct);
		
		// 베스트상품 정렬
		List<ProductInfoDto> bestProduct = productInfoDao.bestList();
		model.addAttribute("bestProduct", bestProduct);
		return "/WEB-INF/views/main.jsp";
	}
}
