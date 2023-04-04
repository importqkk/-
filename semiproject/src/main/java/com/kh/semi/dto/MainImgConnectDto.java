package com.kh.semi.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
@AllArgsConstructor @Builder
public class MainImgConnectDto {

	private String imgName, imgType, mainTitle;
	private long imgSize;
	private int mainNo, imgNo;
	
}
