package com.kh.semi.dao;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ReviewDto;

@Repository
public class ReviewDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ReviewDto> mapper = (rs, index)->{
		return ReviewDto.builder()
				.reviewNo(rs.getInt("review_no"))
				.reviewContent(rs.getString("review_content"))
				.reviewStar(rs.getInt("review_star"))
				.reviewTime(rs.getDate("review_time"))
				.reviewLike(rs.getInt("review_like"))
				.productNo(rs.getInt("product_no"))
				.memberId(rs.getString("member_id"))
				.build();
	};
	
	//리뷰 등록
	public void insert(ReviewDto reviewDto) {
		String sql = "insert into review( "
				+ "review_no, review_content, review_star, "
				+ "review_time, review_like, "
				+ "product_no, member_id "
				+ ") "
				+ "values(review_seq.nextval, ?, ?, sysdate, 0, ?, ?)";
		Object[] param = {
				reviewDto.getReviewContent(), 
				reviewDto.getReviewStar(),
				reviewDto.getProductNo(),
				reviewDto.getMemberId()
		};
		System.out.println(Arrays.toString(param));
		jdbcTemplate.update(sql, param);
	}
	
	public List<ReviewDto> selectList(int productNo){
		String sql = "select * from review where product_no = ? "
				+ "order by review_no asc";
		Object[] param = {productNo};
		return jdbcTemplate.query(sql, mapper, param);
	}

}
