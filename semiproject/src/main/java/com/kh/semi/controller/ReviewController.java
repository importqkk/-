package com.kh.semi.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.dao.ReviewDao;
import com.kh.semi.dto.ReviewDto;
import com.kh.semi.service.ReviewService;

@RestController
@RequestMapping("/rest/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/{productNo}")
	public List<ReviewDto> list(@PathVariable int productNo){
		return reviewDao.selectList(productNo);
	}
	
	@PostMapping("/")
	public void write(HttpSession session,
					  @ModelAttribute ReviewDto reviewDto,
					  @RequestParam(required = false) List<Integer> imgNo) {
		
		String memberId = (String) session.getAttribute("memberId");
		reviewDto.setMemberId(memberId);
		
		
		reviewService.write(reviewDto, imgNo);
		
//		reviewDao.insert(reviewDto);
		
		
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