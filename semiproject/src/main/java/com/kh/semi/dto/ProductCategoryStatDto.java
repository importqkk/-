package com.kh.semi.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class ProductCategoryStatDto {

	private int tagNo, productCnt, sellMax, priceMax, priceMin;
	private float sellAvg, priceAvg;
	
}
