package com.kh.semi.dto;

import lombok.Data;

//주문정보를 기록하는 뷰 dto
@Data
public class OrderInfo {

	private String memberId, memberName,productBrand, productName;
	private int productNo, productPrice, productStock, productCount ,productSellCount;
	private int imgNo;
}
