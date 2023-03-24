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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.semi.dao.CartDao;
import com.kh.semi.dao.CartProductInfoDao;
import com.kh.semi.dto.CartDto;
import com.kh.semi.dto.CartProductInfoDto;
import com.kh.semi.dto.ProductDto;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartProductInfoDao cartProductInfoDao;
	
	// 장바구니 페이지(list)
	@GetMapping
	public String cart(@ModelAttribute CartDto cartDto, 
			Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		List<CartDto> itemList = cartDao.cartList(memberId);
		List<CartProductInfoDto> itemInfo = cartProductInfoDao.cartItemInfo(cartDto.getProductNo(), memberId);
		model.addAttribute("itemList", itemList);
		model.addAttribute("itemInfo", itemInfo);
		return "/WEB-INF/views/cart/cartMain.jsp";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute CartDto cartDto,
			HttpSession session, RedirectAttributes attr) {
		// 아이디 셋팅
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		// 담으려는 수량 - 이 부분 서비스로 뺄까 고민중
		int productCount = cartDto.getProductCount();
		// 재고 수량
		ProductDto productDto = new ProductDto();
		int productStock = productDto.getProductStock();
		// 담으려는 수량이 재고보다 적거나 같을 때 장바구니에 추가
		if(productCount <= productStock) {
			cartDao.cartInsert(cartDto);
		}
		// 담으려는 수량이 재고보다 많으면 에러
		else {
			attr.addAttribute("mode", "error");
		}
		return "redirect:#";
	}
	
	// 장바구니 상품 수량 변경
	@PostMapping("/update")
	public String update(@ModelAttribute CartDto cartDto, 
			HttpSession session, RedirectAttributes attr) {
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		// 담으려는 수량 - 이 부분 서비스로 뺄까 고민중
		int productCount = cartDto.getProductCount();
		// 재고 수량
		ProductDto productDto = new ProductDto();
		int productStock = productDto.getProductStock();
		// 담으려는 수량이 재고보다 적거나 같을 때 장바구니에 추가
		if(productCount <= productStock) {
			cartDao.cartChangeCount(cartDto);
		}
		// 담으려는 수량이 재고보다 많으면 에러
		else {
			attr.addAttribute("mode", "error");
		}
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
