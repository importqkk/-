package com.kh.semi.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class QaDto {
	public int qaNo;
	public String qaTitle;
	public String memberId;
	public String qaContent;
	public String qaAnswer;
	public String qaHead;
	public String qaSecret;
	public int qaGroup;
	public Integer qaParent;
	public int qaDepth;
	public Date qaDate;
	public int qaRead;
	
	//가상의 Getter 추가
	//같은 날짜는 시간 분, 다른 날짜는 연월일
	public String getQaTimeAuto() {
		java.util.Date now = new java.util.Date();
		java.util.Date write = new java.util.Date(qaDate.getDate());
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		String nowStr = f.format(now);
		String writeStr = f.format(write);
		
		if(nowStr.substring(0,10).equals(writeStr.substring(0,10))) {
			return writeStr.substring(11);
		}
		else {
			return writeStr.substring(0,10);
		}
		
	}
	public boolean isNew() {
		return qaParent == null;
	}
	
	public boolean isAnswer() {
		return !isNew();
	}
	
	
}
