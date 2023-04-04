package com.kh.semi.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderListDto {
	private String memberId,orderStat;
	private int orderNo,productCount,productPrice,productNo;
	private Date orderDate;
}
