package com.kh.semi.dto;

import lombok.Data;

//주소관리를 위한 dto
@Data
public class MemberInfoDto {
	private String memberId,memberName,memberPhone,memberPost,memberBasicAddr,memberDetailAddr;
}
