package com.kh.semi.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class OrderListDto {
	private Date orderDate;
	private String orderStat,member_id;
	private int productCount,productPrice,productNo,orderNo;
	private Integer imgNo;
}