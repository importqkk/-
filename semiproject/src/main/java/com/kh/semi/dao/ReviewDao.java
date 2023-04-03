package com.kh.semi.dao;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ReviewDto;
import com.kh.semi.vo.paginationVO;

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
	
	public int sequence(){
		String sql = "select review_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	};
	
	//리뷰 등록
	public void insert(ReviewDto reviewDto) {
		String sql = "insert into review("
				+ "review_no, review_content, review_star, "
				+ "review_time, review_like, "
				+ "product_no, member_id "
				+ ") "
				+ "values(?, ?, ?, sysdate, 0, ?, ?)";
		Object[] param = {
				reviewDto.getReviewNo(),
				reviewDto.getReviewContent(), 
				reviewDto.getReviewStar(),
				reviewDto.getProductNo(),
				reviewDto.getMemberId()
		};
		System.out.println(Arrays.toString(param));
		jdbcTemplate.update(sql, param);
	}
	
	//리뷰 목록
	public List<ReviewDto> selectList(int productNo){
		String sql = "select * from review where product_no = ? "
				+ "order by review_no asc";
		Object[] param = {productNo};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	//리뷰 수정
	public void update(ReviewDto reviewDto) {
		String sql = "update review set review_content = ?, review_star = ? where review_no = ?";
		Object[] param = {
				reviewDto.getReviewContent(), reviewDto.getReviewStar(),
				reviewDto.getReviewNo()
		};
		jdbcTemplate.update(sql, param);
	}
	
	//리뷰 삭제
	public void delete(int reviewNo) {
		String sql = "delete review where review_no = ?";
		Object[] param = {reviewNo};
		jdbcTemplate.update(sql, param);
	}
	
	public ReviewDto selectOne(int reviewNo) {
		String sql = "select * from review where review_no = ?";
		Object[] param = {reviewNo};
		List<ReviewDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//리뷰 상세(아이디로 리뷰 찾기)
	public ReviewDto selectOne(String memberId) {
		String sql = "select * from review where member_id = ?";
		Object[] param = {memberId};
		List<ReviewDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//구매 당 하나의 리뷰만 작성할 수 있도록 함
	public ReviewDto selectOne(String memberId, int productNo) {
		String sql = "select * from review where member_id = ? and product_no = ?";
		Object[] param = {memberId, productNo};
		List<ReviewDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//리뷰 좋아요 수 카운트
	public void updateLikecount(int reviewNo, int count) {
		String sql = "update review set review_like = ? where review_no = ?";
		Object[] param = {count, reviewNo};
		jdbcTemplate.update(sql, param);
	}
	
	//리뷰 사진 첨부
	public void connect(int reviewNo, int imgNo) {
		String sql = "insert into review_img values(?,?)";
		Object[] param = {reviewNo, imgNo};
		jdbcTemplate.update(sql, param);
	}
	
	//페이징
	public int selectCount(paginationVO vo, String memberId) {
	    String sql = "select count(*) from review where member_id = ?";
	    return jdbcTemplate.queryForObject(sql, int.class, memberId);
	}

	public List<ReviewDto> selectList(paginationVO vo, String memberId) {
	    String sql = "select * from ( "
	                + "select rownum rn, TMP.* from ( "
	                    + "select * from review "
	                    + "where member_id = ? "
	                    + "order by review_no desc"
	                + ") TMP"
	            + ") where rn between ? and ?";
	    Object[] param = {memberId, vo.getBegin(), vo.getEnd()};
	    return jdbcTemplate.query(sql, mapper, param);
	}
	
	//리뷰 내역
		public boolean reviewCheck(ReviewDto reviewDto) {
			String sql = "select count(*) from review where member_id = ? and product_no = ?";
			Object[] param = {reviewDto.getMemberId(), reviewDto.getProductNo()};
			int count = jdbcTemplate.queryForObject(sql, int.class, param);
			return count == 1;
		}

}