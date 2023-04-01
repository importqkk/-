package com.kh.semi.dto;

import lombok.Data;

//주소관리를 위한 dto
//MEMBER_ADDR테이블
@Data
public class MemberInfoDto {
	private String memberId,memberName,memberPhone,memberPost,memberBasicAddr,memberDetailAddr,orderRequest;
}
