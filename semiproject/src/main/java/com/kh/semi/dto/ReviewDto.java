package com.kh.semi.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ReviewDto {
	private int reviewNo;
	private String reviewContent;
	private int reviewStar;
	private Date reviewTime;
	private int reviewLike;
	private int productNo;
	private String memberId;
}
