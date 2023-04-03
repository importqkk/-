package com.kh.semi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ReviewLikeDto;

@Repository
public class ReviewLikeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//등록
	public void insert(ReviewLikeDto reviewLikeDto) {
		String sql = "insert into review_like(member_id, review_no) values(?,?)";
		Object[] param = {reviewLikeDto.getMemberId(), reviewLikeDto.getReviewNo()};
		jdbcTemplate.update(sql, param);
	}
	
	//삭제
	public void delete(ReviewLikeDto reviewLikeDto) {
		String sql = "delete review_like where member_id = ? and review_no = ?";
		Object[] param = {reviewLikeDto.getMemberId(), reviewLikeDto.getReviewNo()};
		jdbcTemplate.update(sql, param);
	}
	
	//확인 
	public boolean check(ReviewLikeDto reviewLikeDto) {
		String sql = "select count(*) from review_like where member_id = ? and review_no = ?";
		Object[] param = {reviewLikeDto.getMemberId(), reviewLikeDto.getReviewNo()};
		int count = jdbcTemplate.queryForObject(sql, int.class, param);
		return count == 1;
	}
	
	//리뷰에 대한 좋아요 개수
	public int count(int reviewNo) {
		String sql = "select count(*) from review_like where review_no = ?";
		Object[] param = {reviewNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

}