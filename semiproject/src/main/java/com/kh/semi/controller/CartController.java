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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.semi.dao.CartDao;
import com.kh.semi.dao.CartProductInfoDao;
import com.kh.semi.dao.ProductDao;
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
	@Autowired
	private ProductDao productDao;
	
	/*
		완료
	*/
	// 장바구니에 상품 담기
	@PostMapping("/insert")
	public String insert(@ModelAttribute CartDto cartDto, 
			CartProductInfoDto cartProductInfoDto,
			ProductDto productDto,
			HttpSession session, RedirectAttributes attr) {
		// 아이디 셋팅
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		cartProductInfoDto.setMemberId(memberId);
		// 담으려는 수량
		int productCount = cartDto.getProductCount();
		// 재고 수량
		int productStock = productDao.selectStock(cartDto.getProductNo());
		// 장바구니에 없는 상품인지 (없으면 true)
		boolean isNew = cartDao.selectOne(cartDto) == null;
		// 담으려는 수량이 재고보다 적거나 같을 때 장바구니에 추가
		if(productCount <= productStock && isNew) {
			cartDao.cartInsert(cartDto);
		}
		// 장바구니에 이미 있는 상품인 경우(상품 추가 안되고 문구 띄움)
		else if(!isNew) {
			attr.addAttribute("mode", "error1");
		}
		// 담으려는 수량이 재고보다 많으면 에러
		else {
			attr.addAttribute("mode", "error2");
		}
		return "redirect:/product/detail?productNo="+cartDto.getProductNo();
	}
	
	// 장바구니에서 상품 삭제
	@GetMapping("/delete")
	public String delete(HttpSession session, @RequestParam int productNo,
			@ModelAttribute CartDto cartDto) {
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		cartDto.setProductNo(productNo);
		cartDao.cartDeleteItem(cartDto);
		return "redirect:main";
	}
	
	// 장바구니 상품 수량 변경
	@PostMapping("/update")
	public String update(@ModelAttribute CartDto cartDto, 
			HttpSession session, RedirectAttributes attr) {
		String memberId = (String)session.getAttribute("memberId");
		cartDto.setMemberId(memberId);
		// 담으려는 수량
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
	
	// 장바구니 페이지(list)
	@GetMapping("/main")
	public String cart(@ModelAttribute CartProductInfoDto cartProductInfoDto,
			Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		cartProductInfoDto.setMemberId(memberId);
		List<CartProductInfoDto> itemInfo = cartProductInfoDao.cartItemInfo(memberId);
		int cartCnt = cartDao.cartCnt(memberId);
		model.addAttribute("itemInfo", itemInfo);
		model.addAttribute("cartCnt", cartCnt);
		return "/WEB-INF/views/cart/cartMain.jsp";
	}
	
}
