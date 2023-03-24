package com.kh.semi.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.semi.dao.ProductDao;
import com.kh.semi.dto.ProductDto;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDao productDao;
	

	@GetMapping("/detail")
	public String list(@RequestParam int productNo,
						Model model) {
		ProductDto productDto = productDao.selectOne(productNo);
		model.addAttribute("productDto",productDto); 
		
		return "/WEB-INF/views/product/detail.jsp";
	}
}