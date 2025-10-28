package com.middlepj.ict05.common;

public class Paging {

	private int pageSize = 10;	// 한 페이지당 게시글 수
	private int count = 0;		// 전체글의 갯수를 저장하는 변수
	private int currentPage;	// 현재페이지
	private String pageNum;		// 현재 페이지 문자열
	
	// 계산된 값들
	private int startRow;		// 페이지별 시작번호
	private int endRow;			// 페이지별 끝번호
	private int pageCount;		// 전체 페이지 수
	private int startPage;		// 페이지 블록 시작 번호
	private int endPage;		// 페이지 블록 끝 번호
	private int pageBlock = 5;	// 한 화면에 보여줄 페이지 블록 크기 < 1 2 3 4 5 >
	private int prev;			// 이전
	private int next;			// 다음
	
	
	
	private int number = 0;		// 페이지번호




	// 생성자
	public Paging() {}

	public Paging(String pageNum) {
		if (pageNum == null || pageNum.isBlank()) {
			pageNum = "1";
		}
		try {
			currentPage = Integer.parseInt(pageNum);
		} 
		catch (NumberFormatException e) {
			currentPage = 1;
		}
		if (currentPage < 1) currentPage = 1; 			// 최소 1페이지 보정
		this.pageNum = String.valueOf(currentPage);
		
		System.out.println("Paging.java >>> " + "pageNum : " + pageNum +", currentPage => " + currentPage);
	}

	// Getter
	public int getPageSize() { return pageSize; }
	public int getCount() { return count; }
	public int getCurrentPage() { return currentPage; }
	public String getPageNum() { return pageNum; }
	public int getStartRow() { return startRow; }
	public int getEndRow() { return endRow; }
	public int getPageCount() { return pageCount; }
	public int getStartPage() { return startPage; }
	public int getEndPage() { return endPage; }
	public int getPageBlock() { return pageBlock; }
	public int getPrev() { return prev; }
	public int getNext() { return next; }

	// 전체 게시글 수 세팅 후 페이징 처리
	public void setTotalCount(int count) {
		this.count = count;

		// 전체 페이지 수 계산
		pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (pageCount == 0) pageCount = 1;
		
		// 현재 페이지 보정(상한 초과 방지)
		if (currentPage > pageCount) currentPage = pageCount;
		
		// 시작/끝 row 계산
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = Math.min(currentPage * pageSize, count);
		
		// pageNum도 currentPage로 덮어써서 일관성 유지
		this.pageNum = String.valueOf(currentPage);
		
		// 페이지 계산
		pageCalculator();
	}

	// 페이지 블록 계산
	public void pageCalculator() {
		if (count > 0) {
			System.out.println("Paging.java >>> " + "pageCount : " + pageCount);
			
			// 블록 시작 페이지 계산
			if (currentPage % pageBlock != 0) {
				startPage = (currentPage / pageBlock) * pageBlock + 1;
			} else {
				startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
			}
			
			// 블록 끝 페이지 계산
			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			
			// 이전 블록
			prev = (startPage > 1) ? startPage - pageBlock : 0;
			
			// 다음 블록
			next = (endPage < pageCount) ? startPage + pageBlock : 0;
		}
	}
}
