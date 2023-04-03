package com.kh.semi.dto;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class ProductInfoDto {

	private int productNo, productPrice, productSellCount, reivewCNT, tagNo, productStock;
	private String productBrand, productName;
	private float reivewAVG;
	private Date productJoin;
	private Integer productImgNo, detailImgNo;
	
}
