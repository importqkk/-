package com.kh.semi.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.semi.dao.ProductInfoDao;
import com.kh.semi.dto.ProductInfoDto;

@Controller
public class MainController {

	@Autowired
	private ProductInfoDao productInfoDao;
	
	@RequestMapping("/")
	public String main(@ModelAttribute ProductInfoDto productInfoDto,
			Model model) {
		
		/*List<CartProductInfoDto> itemInfo = cartProductInfoDao.cartItemInfo(memberId);
		int cartCnt = cartDao.cartCnt(memberId);
		model.addAttribute("itemInfo", itemInfo);
		model.addAttribute("cartCnt", cartCnt);*/
		
		// 개별 상품 정보
		// 최신상품 정렬
		List<ProductInfoDto> newProduct = productInfoDao.newList();
		model.addAttribute("newProduct", newProduct);
		// 베스트상품 정렬
		List<ProductInfoDto> bestProduct = productInfoDao.bestList();
		model.addAttribute("bestProduct", bestProduct);
		return "/WEB-INF/views/main.jsp";
	}
	
}
