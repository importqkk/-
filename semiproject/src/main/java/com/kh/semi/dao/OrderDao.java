package com.kh.semi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.OrderDto;



@Repository
public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//주문생성
	public void insertOrder(OrderDto orderDto) {
		String sql="insert into Order_(ORDER_NO,ORDER_RECEIVER,ORDER_POST,ORDER_BASIC_ADDR,ORDER_DETAIL_ADDR,ORDER_RECEIVER_PHONE,ORDER_DATE,ORDER_REQUEST,MEMBER_ID)"
				+ "values('order_seq.nextval()',?,?,?,?,?,sysdate,?,?)";
		
		Object[] param= {orderDto.getOrderNO(),orderDto.getOrderRecever(),orderDto.getOrderPost(),orderDto.getOrderBasicAddr(),
				orderDto.getOrderDetailAddr(),orderDto.getOrderReceivePhone(),orderDto.getOrderDate(),orderDto.getOrderRequest(),orderDto.getMemberId()
		};
		
		jdbcTemplate.update(sql,param);
	}
	
	//조회를 위한 rowmapper 
	RowMapper<OrderDto> mapper = (rs,idx) ->{
		OrderDto dto=new OrderDto();
		dto.setOrderNO(rs.getInt("ORDER_NO"));
		dto.setOrderRecever(rs.getString("ORDER_RECEIVER"));
		dto.setOrderPost(rs.getString("ORDER_POST"));
		dto.setOrderBasicAddr(rs.getString("ORDER_BASIC_ADDR"));
		dto.setOrderDetailAddr(rs.getString("ORDER_DETAIL_ADDR"));
		dto.setOrderReceivePhone(rs.getString("ORDER_RECEIVER_PHONE"));
		dto.setOrderDate(rs.getDate("ORDER_DATE"));
		dto.setOrderRequest(rs.getString("ORDER_REQUEST"));
		dto.setMemberId(rs.getString("MEMBER_ID"));
		return dto;
	};
	

	
}
		
	
	
	
	
