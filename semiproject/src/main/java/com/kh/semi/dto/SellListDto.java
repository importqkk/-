package com.kh.semi.dto;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class SellListDto {

	private int orderNo, productNo, productCount, productPrice;
	private Date orderDate;
	private String orderStat, memberId, productName, productBrand;
	
}
