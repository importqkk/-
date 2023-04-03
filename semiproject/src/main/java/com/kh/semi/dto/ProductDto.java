package com.kh.semi.dto;
import java.sql.Date;
import lombok.Data;

@Data
public class ProductDto {
	private int productNo;
	private String productName;
	private String productBrand;
	private int productPrice;
	private int productStock;
	private String productContent;
	private int productDeliveryPrice;
	private int productSellCount;
	private Date productJoin;
	
}
