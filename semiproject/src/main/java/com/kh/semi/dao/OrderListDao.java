package com.kh.semi.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.OrderListDto;


@Repository
public class OrderListDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<OrderListDto> mapper = (rs,idx)->{
		OrderListDto dto= new OrderListDto();
		
		dto.setOrderNo(rs.getInt("ORDER_NO"));
		dto.setOrderDate(rs.getDate("ORDER_DATE"));
		dto.setOrderStat(rs.getString("ORDER_STAT"));
		dto.setMember_id(rs.getString("MEMBER_ID"));
		dto.setProductCount(rs.getInt("PRODUCT_COUNT"));
		dto.setProductPrice(rs.getInt("PRODUCT_PRICE"));		
		dto.setProductNo(rs.getInt("PRODUCT_NO"));
		dto.setImgNo(rs.getInt("IMG_NO"));
		return dto;
	};
	
	//회원 필터 조회
	//결제완
	public List<OrderListDto> payment(String memberId) {
		String sql = "select * from order_list where member_id= ? and ORDER_STAT= '결제완료' order by order_Date desc";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql,mapper,param);
	}
	//배송대기
	public List<OrderListDto> prepare(String memberId) {
		String sql = "select * from order_list where member_id= ? and ORDER_STAT= '배송준비중' order by order_Date desc";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql,mapper,param);
	}
	//배송중
	public List<OrderListDto> delivery(String memberId) {
		String sql = "select * from order_list where member_id= ? and ORDER_STAT= '배송중' order by order_Date desc";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql,mapper,param);
	}
	//배송완
	public List<OrderListDto> complete(String memberId) {
		String sql = "select * from order_list where member_id= ? and ORDER_STAT= '배송완료' order by order_Date desc";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql,mapper,param);
	}
	
	
	
	
	
	
	
	
	//회원 전체주문
	public List<OrderListDto> allList(String memberid){
		String sql="select * from order_list where member_id= ?";
		Object[] param= {memberid};
		return jdbcTemplate.query(sql,mapper,param);
	}
}