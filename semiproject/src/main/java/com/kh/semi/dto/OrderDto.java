package com.kh.semi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderDto {
	private int orderNO;
	private String orderRecever;
	private String orderReceivePhone;
	private String orderPost;
	private String orderBasicAddr;
	private String orderDetailAddr;
	private Date orderDate;
	private String orderRequest;
	private String memberId;
	
//	private int order_Total_price;
}
