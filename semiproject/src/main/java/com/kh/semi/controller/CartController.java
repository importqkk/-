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
import com.kh.semi.dto.CartDto;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartDao cartDao;
	
	// 장바구니 페이지(list)
	@GetMapping
	public String cart(Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		List<CartDto> list = cartDao.cartList(memberId);
		model.addAttribute("list", list);
		return "/WEB-INF/views/cart/cartMain.jsp";
	}
	
	// 장바구니에 상품 등록
//	@GetMapping("/insert")
//	public String insert() {
//		이게 지금 페이지 이동이 없이 버튼 클릭으로 이루어지는 작업이라 비동기로 하는건지 고민됨
//		-> 게시판 컨트롤러 게시글 전체 삭제 참고
//	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute CartDto cartDto,
			HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		cartDao.cartInsert(cartDto);
		return "redirect:#";
	}
	
	// 장바구니 상품 수량 변경
	@PostMapping("/update")
	public String update(@ModelAttribute CartDto cartDto, 
			HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		cartDao.cartChangeCount(cartDto);
		return "redirect:cart";
	}
	
	// 장바구니에서 상품 삭제
	@PostMapping("/delete")
	public String delete(@ModelAttribute CartDto cartDto, 
			HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		cartDao.cartDeleteItem(cartDto);
		return "redirect:cart";
	}
	
}
