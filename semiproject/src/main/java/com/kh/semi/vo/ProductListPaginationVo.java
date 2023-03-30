package com.kh.semi.vo;
import lombok.Data;

@Data
public class ProductListPaginationVo {

	private String column = "productName";	// column의 디폴트를 productName로
	private String keyword = "";	// keyword의 디폴트를 ""로
	private int page = 1;			// page의 디폴트는 1로 (접속하면 첫 페이지가 1페이지)
	private int size = 20;			// 한 화면에 표시할 데이터 수
	private int count;				// 총 제품 수
	private int blockSize = 10;		// 한 화면에 표시할 페이지 버튼 수 (1 ~ 10)
	
	// 검색인지 목록인지 판정
	public boolean isSearch() {
		return !keyword.equals("");	// 키워드에 값이 있는 상황이 true면 검색
	}
	public boolean isList() {
		return !isSearch();			// 검색 상황의 반대면 목록
	}
	
	// 파라미터 생성 메소드
	// - 목록일 경우 list?size=ㅇㅇ 형태의 문자열 반환
	// - 검색일 경우 size=ㅇㅇ&column=ㅇㅇ&keyword=ㅇㅇ 형태의 문자열 반환
	public String getParameter() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("&size=");
		buffer.append(size);
		if(isSearch()) {	// 검색이라면 항목 더 추가
			buffer.append("&column=");
			buffer.append(column);
			buffer.append("&keyword=");
			buffer.append(keyword);
		}
		return buffer.toString();	// 조합한 buffer를 문자열로 반환
	}
	
	// 종료행번호 계산: 한 페이지에 표시되는 마지막 데이터 번호
	public int getEnd() {
		return Math.min(page * size, count);
	}
	// 시작행번호 계산: 한 페이지에 표시되는 첫번째 데이터 번호
	public int getBegin() {
		return page * size - (size - 1);
	}
	// 전체페이지수
	public int getTotalPage() {
		return (count + size - 1) / size;
	}
	// 시작블록번호: 한 페이지에 표시되는 첫번째 페이지블록 번호
	public int getStartBlock() {
		return (page - 1) / blockSize * blockSize + 1;
	}
	// 종료블록번호: 한 페이지에 표시되는 마지막 페이지블록 번호
	public int getFinishBlock() {
		int value = (page - 1) / blockSize * blockSize + blockSize;
		return Math.min(value, getTotalPage());
	}
	// 첫 페이지인가?
	public boolean isFirst() {
		return page == 1;
	}
	// 마지막 페이지인가?
	public boolean isLast() {
		return page == (count + size - 1) / size;
	}
	// [이전]이 나오는 조건 - 시작블록이 1보다 크면(페이지가 size보다 크면)
	public boolean isPrev() {
		return getStartBlock() > 1;
	}
	// [다음]이 나오는 조건 - 종료블록이 마지막 페이지(total page)보다 작으면
	public boolean isNext() {
		return getFinishBlock() < getTotalPage();
	}
	// [이전]을 누르면 나올 페이지 번호
	public int getPrevPage() {
		return getStartBlock() - 1;
	}
	// [다음]을 누르면 나올 페이지 번호
	public int getNextPage() {
		return getFinishBlock() + 1;
	}
	
}
