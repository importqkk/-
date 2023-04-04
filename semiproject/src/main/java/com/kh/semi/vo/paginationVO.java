package com.kh.semi.vo;

import lombok.Data;

@Data
public class paginationVO {
	private int page = 1;
	private int size = 5;
	private int count; 
	private int blockSize = 5;
	
	public String getParameter() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("size=");
		buffer.append(size);
		
		return buffer.toString();
	}
	
	//시작행번호 계산
	public int getBegin() {
		return page * size - (size - 1);
	}
	
	//종료행번호 계산
	public int getEnd() {
		return page * size;
	}
	
	//전체페이지 계산
	public int getTotalPage() {
		return (count + size - 1) / size;
	}
	
	//시작블록번호 계산
	public int getStartBlock() {
		return (page - 1) / blockSize * blockSize + 1;
	}
	
	//종료블록번호 계산
		public int getFinishBlock() {
			int value = (page - 1) / blockSize * blockSize + blockSize;
			return Math.min(value, getTotalPage());
		}
	
	//첫 페이지
	public boolean isFirst() {
		return page == 1;
	}
	
	//마지막 페이지
	public boolean isLast() {
		return page == getTotalPage();
	}
	
	//[이전]이 나오는 조건 - 시작블록이 1보다 크면
	public boolean isPrev() {
		return getStartBlock() > 1;
	}
	
	//[다음]이 나오는 조건 - 종료블록이 마이페이지보다 작으면
	public boolean isNext() {
		return getFinishBlock() < getTotalPage();
	}
	
	//[이전]을 누르면 나올 페이지 번호
	public int getPrevPage() {
		return getStartBlock() - 1;
	}
	
	//[다음]을 누르면 나올 페이지 번호
	public int getNextPage() {
		return getFinishBlock() + 1;
	}

}