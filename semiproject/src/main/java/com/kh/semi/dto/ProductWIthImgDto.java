package com.kh.semi.dto;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class ProductWIthImgDto {

	private int productNo, productPrice, productStock, productDeleveryPrice, productSellCount;
	private String productName, productBrand, productContent;
	private Date productJoin;
	private Integer imgNo;
	
}
