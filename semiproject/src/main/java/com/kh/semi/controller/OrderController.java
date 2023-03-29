package com.kh.semi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.dao.CartDao;
import com.kh.semi.dao.OrderDao;
import com.kh.semi.dao.OrderProductDao;
import com.kh.semi.dto.CartDto;
import com.kh.semi.dto.OrderDto;
import com.kh.semi.dto.OrderProductDto;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private CartDao cartDao;
	
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderProductDao orderProductDao;


	//장바구니에서 주문페이지
	@GetMapping("/cartbuy")
	public String buy(Model model,HttpSession session) {
		String memberId=(String)session.getAttribute("memberId");
		cartDao.cartList(memberId);
		model.addAttribute("list",cartDao.cartList(memberId));
		System.out.println(cartDao.cartList(memberId));
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
