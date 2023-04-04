package com.kh.semi.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.dao.CartDao;
import com.kh.semi.dao.CartProductInfoDao;
import com.kh.semi.dto.CartDto;
import com.kh.semi.dto.CartProductInfoDto;

@RestController
@RequestMapping("/rest/cart")
public class CartRestController {

	// 장바구니 페이지 내에서 개별 상품의 수량을 비동기로 변경
	
	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartProductInfoDao cartProductInfoDao;
	
	@PatchMapping("/")
	public List<CartProductInfoDto> changeProductQty(HttpSession session, @ModelAttribute CartDto cartDto) {
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		cartDao.cartChangeCount(cartDto);
		return cartProductInfoDao.cartItemInfo(memberId);
	}
	
}