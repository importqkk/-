package com.kh.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.dao.OrderDao;
import com.kh.semi.dao.OrderProductDao;
import com.kh.semi.dto.OrderDto;
import com.kh.semi.dto.OrderProductDto;

@Controller
@RequestMapping("/order")
public class OrderController {

	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderProductDao orderProductDao;
	
	//주문생성 페이지
//	@PostMapping("/insert")

	@GetMapping("/buy")
	public String buy() {
		return "/WEB-INF/views/order/buy.jsp";
	}
	
	@PostMapping("/buy")
	public String buy(@ModelAttribute OrderDto orderDto,@ModelAttribute OrderProductDto orderProductDto,HttpSession session){
		//회원 아이디
		String memberId=(String)session.getAttribute("memberId");
		orderDto.setMemberId(memberId);
		orderDao.insertOrder(orderDto);
		orderProductDao.InsertOrderProduct(orderProductDto);
		return "redirect:buyFinish";
		
	}
	
	 @GetMapping("/buyFinish")
	 public String joinFinish() { 
		 return "/WEB-INF/views/order/buyFinish.jsp";
		 
	 }
	
}
