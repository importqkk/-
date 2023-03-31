package com.kh.semi.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.dao.CartDao;
import com.kh.semi.dao.CartProductInfoDao;
import com.kh.semi.dao.MemberInfoDao;
import com.kh.semi.dao.OrderDao;
import com.kh.semi.dao.OrderProductDao;
import com.kh.semi.dao.ProductDao;
import com.kh.semi.dao.ProductInfoDao;
import com.kh.semi.dto.MemberDto;
import com.kh.semi.dto.OrderDto;
import com.kh.semi.dto.OrderProductDto;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private MemberInfoDao memberInfoDao;

	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartProductInfoDao cartProductInfoDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductInfoDao productInfoDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderProductDao orderProductDao;


	//장바구니에서 주문페이지
	@GetMapping("/cartbuy")
	public String cartbuy(Model model,HttpSession session,@ModelAttribute MemberDto memberDto) {
		//멤버아이디 세팅
		String memberId=(String)session.getAttribute("memberId");
		
		//주소불러옴
		model.addAttribute("memberInfo",memberInfoDao.memberinfo(memberId));
		//장바구니 리스트 불러옴
		model.addAttribute("cartinfo",cartProductInfoDao.cartItemInfo(memberId));
		
		
		return "/WEB-INF/views/order/cartbuy.jsp";
	}
	
	//상세페이지에서 주문페이지
		@GetMapping("/detailbuy")
		public String detailbuy(Model model,HttpSession session,@RequestParam int productNo,@RequestParam int productCount) {
			System.out.println(productCount);
			//멤버아이디
			String memberId=(String)session.getAttribute("memberId");
			
			//받은 값을 이용해 상품정보 불러옴
			model.addAttribute("productInfo",productInfoDao.selectOne(productNo));
			model.addAttribute("Count",productCount);
			
	
			
			return "/WEB-INF/views/order/detailbuy.jsp";
		}
	
//	@PostMapping("/buy")
//	public String buy(@ModelAttribute OrderDto orderDto,@ModelAttribute OrderProductDto orderProductDto,
//			HttpSession session){
//		//회원 아이디넣고
//		//결제버튼을 누르면 상품등록
//		String memberId=(String)session.getAttribute("memberId");
//		//주문번호-주문목록 생성
//		orderDto.setMemberId(memberId);
//		orderDao.insertOrder(orderDto);
//		
//		/* 지금 단일 실행밖에 안됨*/
//		
//		//상품 주문 실행
//		//방금 주문한 번호를 불러오고
//		int no=orderDao.orderNo(memberId);
//		orderProductDto.setOrderNo(no);
//		
//		
//		//주문실행!
//		orderProductDao.InsertOrderProduct(orderProductDto);
//		return "redirect:buyFinish";
//		
//		
//		//		List<OrderProductDto> list=orderProductDao.orderInfo(no);
//		//		select * from order_product where order_no=?;
//		//System.out.println(list);
//		////주문실행!
//		//for(OrderProductDto Dto : list) {
//		//	orderProductDao.InsertOrderProduct(Dto);
//		//}
//		//
//		//return "redirect:buyFinish";
//	}
	
		
		@PostMapping("/buy")
		public String buy(@ModelAttribute OrderDto orderDto,HttpServletRequest request,
				HttpSession session,RedirectAttributes attr){
//			@ModelAttribute(value="productInfo") ArrayList<OrderProductDto> list
			ArrayList<OrderProductDto> productInfoList = (ArrayList<OrderProductDto>) request.getAttribute("productInfo");
			ArrayList<OrderProductDto> cartinfoList = (ArrayList<OrderProductDto>) request.getAttribute("cartinfo");
			
			//회원 아이디넣고
			//결제버튼을 누르면 상품등록
			String memberId=(String)session.getAttribute("memberId");
			//주문번호-주문목록 생성
			orderDto.setMemberId(memberId);
			orderDao.insertOrder(orderDto);
			
			/* 지금 단일 실행밖에 안됨*/
			
			//주문번호 저장
			int no=orderDao.orderNo(memberId);
			if(!productInfoList.isEmpty()) {
				//
			//상품 주문 실행 반복
				for(OrderProductDto  orderProductDto: productInfoList) {
					//방금 주문한 번호를 불러오고
					orderProductDto.setOrderNo(no);
					//주문저장
					orderProductDao.InsertOrderProduct(orderProductDto);				
				}
			}else if((cartinfoList != null && !cartinfoList.isEmpty())){
				for(OrderProductDto  orderProductDto: cartinfoList) {
					//방금 주문한 번호를 불러오고
					orderProductDto.setOrderNo(no);
					//주문저장
					orderProductDao.InsertOrderProduct(orderProductDto);				
				}
			}else {
				attr.addAttribute("mode", "error");
			}
				
				
			//끝나면 주문실행!
			return "redirect:buyFinish";
			
			
			
			
		}
	//등록완료!
	 @GetMapping("/buyFinish")
	 public String joinFinish() { 
		 return "/WEB-INF/views/order/buyFinish.jsp";
		 
	 }
	
}