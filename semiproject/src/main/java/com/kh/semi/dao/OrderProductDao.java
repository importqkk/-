package com.kh.semi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import com.kh.semi.dto.OrderProductDto;


@Repository
public class OrderProductDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//주문 상품을 넣는곳
	public void InsertOrderProduct(OrderProductDto orderProductDto ) {
		String sql="insert into Order_Product(PRODUCT_COUNT, PRODUCT_PRICE, PRODUCT_NO, ORDER_NO) values"
				+ "(?,?,?,?)";
		Object[] param= {orderProductDto.getProductCount(),orderProductDto.getProductPrice(),orderProductDto.getProductNo(),orderProductDto.getOrderNo()};
		
		jdbcTemplate.update(sql,param);
		
		//조회를 위한 rowmapper 
		RowMapper<OrderProductDto> mapper = (rs,idx) ->{
			OrderProductDto dto=new OrderProductDto();
			dto.setProductCount(rs.getInt("PRODUCT_COUNT"));
			dto.setProductPrice(rs.getInt("PRODUCT_PRICE"));
			dto.setProductNo(rs.getInt("PRODUCT_NO"));
			dto.setOrderNo(rs.getInt("ORDER_NO"));
			
			return dto;
		};
		
	}
	
	
}
