package com.kh.semi.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class CartProductInfoDto {

	private String memberId, productBrand, productName;
	private int productNo, productPrice, productStock, productCount;
	private int imgNo;
	
}