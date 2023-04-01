package com.kh.semi.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.convert.DtoInstantiatingConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.dao.CartDao;
import com.kh.semi.dao.CartProductInfoDao;
import com.kh.semi.dao.MemberInfoDao;
import com.kh.semi.dao.OrderDao;
import com.kh.semi.dao.OrderProductDao;
import com.kh.semi.dao.ProductDao;
import com.kh.semi.dao.ProductInfoDao;
import com.kh.semi.dto.CartProductInfoDto;
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
			
			//model로 상품정보 보냄
			model.addAttribute("productInfo",productInfoDao.selectOne(productNo));
			model.addAttribute("Count",productCount);
			
			
	
			
			return "/WEB-INF/views/order/detailbuy.jsp";
		}
	
	@PostMapping("/buy")
	public String buy(@ModelAttribute OrderDto orderDto,@ModelAttribute OrderProductDto Dto, HttpSession session,Model model){
		//회원 아이디넣고
		String memberId=(String)session.getAttribute("memberId");
		//주문번호와 주문목록 생성
		orderDto.setMemberId(memberId);
		orderDao.insertOrder(orderDto);
		
		System.out.println(Dto);
		//상품 주문 실행
		
		//방금 주문한 번호를 불러오고
		int no=orderDao.orderNo(memberId);

		//장바구니에서 주문시 카트 리스트내에있는 정보들을 가져와서 insert
		if(Dto.getProductNo()==0) {
			List<CartProductInfoDto> list = cartProductInfoDao.cartItemInfo(memberId);
			for (CartProductInfoDto Info : list) {
				
				Dto.setOrderNo(no);
				Dto.setProductNo(Info.getProductNo());
				Dto.setProductCount(Info.getProductCount());
				Dto.setProductPrice(Info.getProductPrice());
				orderProductDao.InsertOrderProduct(Dto);
				
				productDao.increaseSellCount(Dto.getProductCount(), Dto.getProductNo()); //상품판매수량 +
				productDao.decreaseStock(Dto.getProductCount(), Dto.getProductNo()); //상품재고 -

				
				
			}
			model.addAttribute("orderInfo",orderDto);
			model.addAttribute("orderProduct",Dto);
			//카트삭제
			cartDao.cartDeleteAll(memberId);
			return "redirect:buyFinish";
		}//상세페이지에서 주문시 model을 받아서 insert
		else  {
			Dto.setOrderNo(no);
			orderProductDao.InsertOrderProduct(Dto);
			
			productDao.increaseSellCount(Dto.getProductCount(), Dto.getProductNo()); //상품판매수량 +
			productDao.decreaseStock(Dto.getProductCount(), Dto.getProductNo()); //상품재고 -
			return "redirect:buyFinish";

		}
		

		
		
	}
	
		

	//등록완료!
	 @GetMapping("/buyFinish")
	 public String joinFinish() { 
		 
		 return "/WEB-INF/views/order/buyFinish.jsp";
		 
	 }
	 
	
	
	 
	 @GetMapping("/popup")
	 public String popup() {
		 return "/WEB-INF/views/order/pop.jsp";
	 }
	 
	 
	 @GetMapping("/popInsert")
	 public String popInsert() {
		 return "/WEB-INF/views/order/popInsert.jsp";
	 }
}