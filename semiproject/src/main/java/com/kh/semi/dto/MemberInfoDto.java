package com.kh.semi.dto;



import java.sql.Date;

import lombok.Data;

//주소관리를 위한 dto
//MEMBER_ADDR테이블
@Data
public class MemberInfoDto {
	private String memberId,memberName,memberPhone,memberPost,memberBasicAddr,memberDetailAddr,orderRequest;
	
	//시간순 정렬 할려고 만듬
	private Date insertDate;
}
