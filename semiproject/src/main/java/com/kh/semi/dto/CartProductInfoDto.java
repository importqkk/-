package com.kh.semi.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class CartProductInfoDto {

	private String memberId, productBrand, productName;
	private int productNo, productPrice, productStock;
	
	/*public int getProductPrice() {
		return productPrice += productPrice;
	}
	
	public int getDeleveryPrice() {
		return 3000;
	}
	
	public int getTotalPrice() {
		return 3000 + getProductPrice();
	}*/
	
}
