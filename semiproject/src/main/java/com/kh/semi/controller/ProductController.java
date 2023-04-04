package com.kh.semi.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.semi.dao.BuyHistoryDao;
import com.kh.semi.dao.ProductDao;
import com.kh.semi.dao.ReviewDao;
import com.kh.semi.dto.BuyHistoryDto;
import com.kh.semi.dto.ProductDto;
import com.kh.semi.dto.ReviewDto;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private BuyHistoryDao buyHistoryDao;
	

	@GetMapping("/list")
	public String list(@RequestParam int productNo,
						Model model) {
		ProductDto productDto = productDao.selectOne(productNo);
		model.addAttribute("productDto",productDto); 
		
		return "/WEB-INF/views/product/list.jsp";
	}
	
	// 상품 상세 페이지 - 상품 번호를 통해 페이지를 보여줌  
		@GetMapping("/detail")
		public String list(@RequestParam int productNo,
							Model model,
							HttpSession session
				) {
			
			// 리뷰 작성 구간--------------
			// 아이디 확인
			String memberId = (String) session.getAttribute("memberId");
			BuyHistoryDto buyHistoryDto = buyHistoryDao.selectBuy(memberId);
			ReviewDto reviewDto = reviewDao.selectOne(memberId, productNo);
			model.addAttribute("reviewDto",reviewDto);
			
			boolean hasBuyHistory = buyHistoryDto != null && buyHistoryDto.getProductNo() == productNo;
			model.addAttribute("hasBuyHistory", hasBuyHistory);
			
			return "/WEB-INF/views/product/detail.jsp";
		}
	
	
}
