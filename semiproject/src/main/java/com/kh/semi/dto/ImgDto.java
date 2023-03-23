package com.kh.semi.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ImgDto {
	private int imgNo;
	private String imgName;
	private String imgType;
	private long imgSize;
}
