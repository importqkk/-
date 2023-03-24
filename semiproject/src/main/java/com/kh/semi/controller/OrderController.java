package com.kh.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.dao.OrderDao;
import com.kh.semi.dto.OrderDto;

@Controller
@RequestMapping("/order")
public class OrderController {
//	@Autowired
//	private ProductDao productdao;
	
//	@Autowired
//	private memberDao memberdao;
	
	@Autowired
	private OrderDao orderdao;
	
	//주문생성 페이지
	@GetMapping("/buy")
	public String buy() {
		return "/WEB-INF/views/order/buy.jsp";
	}
	
	@PostMapping("/buy")
	public String buy(@ModelAttribute OrderDto orderDto){
		orderdao.insertOrder(orderDto);
		return "redirect:buyFinish";
		
	}
	
	 @GetMapping("/buyFinish")
	 public String joinFinish() { 
		 return "/WEB-INF/views/order/buyFinish.jsp";
		 
	 }
	
}
