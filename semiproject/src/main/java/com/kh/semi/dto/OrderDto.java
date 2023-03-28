package com.kh.semi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderDto {
	//주문번호
	private int orderNO;
	//사용자로부터 입력받거나 DB로 입력받는값
	private String orderRecever;
	private String orderReceivePhone;
	private String orderPost;
	private String orderBasicAddr;
	private String orderDetailAddr; 
	private String orderRequest;
	
	
	//session 읉 통해 가져올값
	private String memberId;
	
	private String orderStat;
	private int orderUserPoint;
	private Date orderDate;
	
	

}
