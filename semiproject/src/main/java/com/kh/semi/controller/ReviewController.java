package com.kh.semi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.dao.ReviewDao;
import com.kh.semi.dto.ReviewDto;

@RestController
@RequestMapping("/rest/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@GetMapping("/{productNo}")
	public List<ReviewDto> list(@PathVariable int productNo){
		return reviewDao.selectList(productNo);
	}
	
	@PostMapping("/")
	public void write(HttpSession session,
					  @ModelAttribute ReviewDto reviewDto) {
		String memberId = (String) session.getAttribute("memberId");
		reviewDto.setMemberId(memberId);
		
		reviewDao.insert(reviewDto);
	}

}
