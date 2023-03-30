package com.kh.semi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.OrderDto;
import com.kh.semi.dto.ProductDto;



@Repository
public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//주문생성
	public void insertOrder(OrderDto orderDto) {
		String sql="insert into Order_(ORDER_NO,ORDER_RECEIVER,ORDER_POST,ORDER_BASIC_ADDR,ORDER_DETAIL_ADDR,ORDER_RECEIVER_PHONE,"
				+ "ORDER_DATE,ORDER_REQUEST,ORDER_USERPOINT,ORDER_STAT,MEMBER_ID)"
				+ "values(order_seq.nextval,?,?,?,?,?,sysdate,?,?,'결제완료',?)";
		
		Object[] param= {orderDto.getOrderRecever(),orderDto.getOrderPost(),orderDto.getOrderBasicAddr(),
				orderDto.getOrderDetailAddr(),orderDto.getOrderReceivePhone(),orderDto.getOrderRequest(),
				orderDto.getOrderUserPoint(),orderDto.getMemberId()
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
		dto.setOrderUserPoint(rs.getInt("ORDER_USERPOINT"));
		dto.setOrderStat(rs.getString("ORDER_STAT"));
		dto.setMemberId(rs.getString("MEMBER_ID"));
		return dto;
	};


	//주문목록 조회
	public List<OrderDto> setMemberId(String memberId) {
		String sql="select * from order_ where member_id=?";
		Object[]param= {memberId};
		
		return jdbcTemplate.query(sql, mapper,param);
		
	}
	
	//주문목록 상세조회
	public OrderDto selectOne(int orderNo) {
		String sql = "select * from order_ where order_no=?";
		Object[] param = {orderNo};
		List<OrderDto> list = jdbcTemplate.query(sql,mapper,param);
		return list.isEmpty() ? null:list.get(0);
	}

	
	
	
	//회원주소를 불러오기위한 dao
	public OrderDto memberAddr(String memberId) {
		String sql="select M.member_post,M.member_basic_addr,M.member_detail_addr from member M where member_Id=?";
		Object[] param= {memberId};
		List<OrderDto> list = jdbcTemplate.query(sql, mapper,param);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//주문번호불러오기 test
	public int orderNo(String memberId) {
		String sql="select order_no from (select order_no from order_ where member_id=? order by order_no desc) where rownum<=1";
		Object[] param= {memberId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	
}
		
	
	
	
	
