package com.kh.semi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semi.dao.BuyHistoryDao;
import com.kh.semi.dao.ReviewDao;
import com.kh.semi.dto.BuyHistoryDto;
import com.kh.semi.dto.ReviewDto;
import com.kh.semi.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private BuyHistoryDao buyHistoryDao;
	
//	@GetMapping("/write")
//	public String write(@RequestParam int productNo,
//						HttpSession session) {
//		session.setAttribute("productNo", productNo);
//		return "/WEB-INF/views/review/write.jsp";
//	}
//	
//	@PostMapping("/write")
//	public String write(@ModelAttribute ReviewDto reviewDto,
//						HttpSession session,
//						RedirectAttributes attr,
//						@RequestParam int productNo){
//		
//		String memberId = (String) session.getAttribute("memberId");
//		reviewDto.setMemberId(memberId);
//		
//		int productNo = (int) session.getAttribute("productNo");
//		reviewDto.setProductNo(productNo;)
//		return "redirect:list";
//	}
//	
//	@GetMapping("/list")
//	public String list(Model model) {
//		model.addAttribute("list", reviewDao.selectList());
//		return "/WEB-INF/views/review/list.jsp";
//	}


	
	@GetMapping("/{productNo}")
	public List<ReviewDto> list(@PathVariable int productNo){
		return reviewDao.selectList(productNo);
	}
	
	@PostMapping("/")
	public void write(HttpSession session,
					  @ModelAttribute ReviewDto reviewDto,
					  @ModelAttribute BuyHistoryDto buyHistoryDto,
					  @RequestParam(required = false) List<Integer> imgNo,
					  Model model) {
		
		String memberId = (String) session.getAttribute("memberId");
		buyHistoryDao.selectBuy(memberId);
		
		
		reviewService.write(reviewDto, imgNo);
		
		reviewDao.insert(reviewDto);
		
		
	}
	
	@DeleteMapping("/{reviewNo}")
	public void delete(@PathVariable int reviewNo) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		
		reviewDao.delete(reviewNo);
	}
	
	@PatchMapping("/")
	public void edit(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.update(reviewDto);
	}

}