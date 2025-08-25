package com.middlepj.ict05.common;

public class Paging {
	
	private int pageSize = 10;	// 1page당 게시글의 갯수를 지정
	private int count = 0;		// 전체글의 갯수를 저장하는 변수
	private int number = 0;		// 페이지번호
	private String pageNum;
	
	private int startRow;		// 페이지별 시작번호
	private int endRow;			// 페이지별 끝번호
	
	private int currentPage;	// 현재페이지
	private int pageCount;
	private int startPage;
	private int pageBlock;
	private int endPage;
	
	private int prev;			// 이전
	private int next;			// 다음
	
	// 생성자
	public Paging() {}
	
	public Paging(String pageNum) {
		
		// pageNum이 없는 경우(맨처음 board_list.jsp를 클릭하거나, 수정 삭제 등 다른 게시글에서 페이지를 클릭할 때) null처리되므로 1로 설정 
		if(pageNum == null) {
			pageNum = "1";
		}
		
		this.pageNum = pageNum;
		
		currentPage = Integer.parseInt(pageNum);  // 현재페이지
		
		System.out.println("=====================");
		System.out.println("pageNum => " + pageNum);
		System.out.println("currentPage => " + currentPage);
	}

	// getter setter ---------------
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}
	
	// getter setter E ---------------
	
	public void setTotalCount(int count) {  
		this.count = count;		// 전체 게시글 건수
		
		startRow = (currentPage - 1) * pageSize + 1;	// 페이지별 시작번호 => start에 해당 (1)
		endRow =  currentPage * pageSize;				// 페이지별 끝번호 => end에 해당(10)
		
		System.out.println("startRow => " + startRow);
		System.out.println("endRow => " + endRow);
		
		this.number = count - (currentPage - 1) * pageSize;		// 페이지번호(1)
		
		// 페이지 계산
		pageCalculator();
	}

	// 페이지 계산
	public void pageCalculator() {
		if(count > 0) {
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			System.out.println("pageCount : " + pageCount);
			
			startPage = 1;
			pageBlock = 5;
			
			if(currentPage % pageBlock != 0) {
				startPage = (int)(currentPage / pageBlock) * pageBlock + 1;
			}
			else {
				startPage = ((int)(currentPage / pageBlock) - 1) * pageBlock + 1;
			}
			
			// System.out.println("startPage : " + startPage);
			
			endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) endPage = pageCount;
			// System.out.println("endPage : " + endPage);
			
			// 이전
			if(startPage > pageSize) prev = startPage - pageBlock;
			
			// 다음
			if(startPage < pageCount) next = startPage + pageBlock;
			
			// System.out.println("prev : " + prev);
			// System.out.println("next : " + next);
		}
	}
}
