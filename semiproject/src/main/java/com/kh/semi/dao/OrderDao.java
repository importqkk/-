package com.kh.semi.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.kh.semi.dto.OrderDto;

public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//주문등록
	public void insert(OrderDto orderDto) {
		String sql="insert into Order_(ORDER_NO,ORDER_RECEIVER,ORDER_POST,ORDER_BASIC_ADDR,ORDER_DETAIL_ADDR,ORDER_RECEIVER_PHONE,ORDER_DATE,ORDER_REQUEST,MEMBER_ID)"
				+ "values('order_seq.nextval()',?,?,?,?,?,sysdate,?,?)";
		
		Object[] param= {orderDto.getOrderNO(),orderDto.getOrderRecever(),orderDto.getOrderPost(),orderDto.getOrderBasicAddr(),
				orderDto.getOrderDetailAddr(),orderDto.getOrderReceivePhone(),orderDto.getOrderDate(),orderDto.getOrderRequest(),orderDto.getMemberId()
		};
		
		jdbcTemplate.update(sql,param);
	}
	
	//주문자 정보 불러오기
	
	//주문 삭제 -환불/취소시
	
	//주문 조회
	
//	RowMapper<OrderDto> mapper =(rs,idx) ->{
//		OrderDto dto
//	}
//	
		
	
	
	
	
}
