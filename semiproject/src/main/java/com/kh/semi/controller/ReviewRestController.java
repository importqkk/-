package com.kh.semi.controller;

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
import com.kh.semi.dao.ReviewLikeDao;
import com.kh.semi.dto.ReviewDto;
import com.kh.semi.dto.ReviewLikeDto;
import com.kh.semi.service.ReviewService;
import com.kh.semi.vo.ReviewLikeVO;

@RestController
@RequestMapping("/rest/review")
public class ReviewRestController {
	
	@Autowired
	private ReviewLikeDao reviewLikeDao;
	
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
		
		
//		reviewService.write(reviewDto, imgNo);
		
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

	
	@PostMapping("/like")
	public ReviewLikeVO like(HttpSession session,
							@ModelAttribute ReviewLikeDto reviewLikeDto) {
		String memberId  = (String) session.getAttribute("memberId");
		reviewLikeDto.setMemberId(memberId);
		
		boolean current = reviewLikeDao.check(reviewLikeDto);
		if(current) {
			reviewLikeDao.delete(reviewLikeDto);
		}
		else {
			reviewLikeDao.insert(reviewLikeDto);
		}
		
		//좋아요 개수
		int count = reviewLikeDao.count(reviewLikeDto.getReviewNo());
		
		//게시글의 좋아요 개수를 업데이트
		reviewDao.updateLikecount(reviewLikeDto.getReviewNo(), count);
		
		
		return ReviewLikeVO.builder()
						.result(!current)
						.count(count)
				.build();
	}
	
	@PostMapping("/check")
	public boolean check(HttpSession session,
						@ModelAttribute ReviewLikeDto reviewLikeDto) {
		String memberId = (String) session.getAttribute("memberId");
		reviewLikeDto.setMemberId(memberId);
		
		return reviewLikeDao.check(reviewLikeDto);
	}

}