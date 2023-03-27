package com.kh.semi.vo;

import lombok.Data;

@Data
public class QaPaginationVO {
	private String column = "qaTitle";
	private String keyword = "";
	private int page = 1;
	private int size = 10;
	private int count;
	private int blockSize = 10;
	
	//검색 여부 판정
	public boolean isSearch() {
		return keyword.equals("") == false;
	}
	public boolean isList() {
		return !isSearch();
	}
	
	//파라미터 생성 메소드
	public String getParameter() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("size=");
		buffer.append(size);
		
		if(isSearch()) {//검색이라면 항목을 더 추가
			buffer.append("&column=");
			buffer.append(column);
			buffer.append("&keyword=");
			buffer.append(keyword);
		}
		
		return buffer.toString();
	}
	
	//시작행
	public int getBegin() {
		return page * size - (size-1);
	}
	
	//종료행
	public int getEnd() {
		return page * size;
		//return Math.min(page*size, count);
	}
	
	//전체페이지
	public int getTotalPage() {
		return (count + size - 1) / size;
	}
	//시작블록번호
	public int getStartBlock() {
		return (page - 1) / blockSize * blockSize + 1;
	}
	//종료블록번호
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
	//[이전]
	public boolean isPrev() {
		return getStartBlock() > 1;
	}
	//[다음]
	public boolean isNext() {
		return getFinishBlock() < getTotalPage();
	}
	//[이전] 페이지 번호
	public int getPrevPage() {
		return getStartBlock() - 1;
	}
	//[다음] 페이지 번호
	public int getNextPage() {
		return getFinishBlock() + 1;
	}
}
