package com.middlepj.ict05.paging;

public class Paging {
	
	private int pageSize = 10;	// 1page?�� 게시�??�� �??���? �??��
	private int count = 0;		// ?��체�??�� �??���? ???��?��?�� �??��
	private int number = 0;		// ?��?���?번호
	private String pageNum;     
	
	private int startRow;		// ?��?���?�? ?��?��번호
	private int endRow;			// ?��?���?�? ?��번호
	
	private int currentPage;	// ?��?��?��?���?
	private int pageCount;
	private int startPage;
	private int pageBlock;
	private int endPage;
	
	private int prev;			// ?��?��
	private int next;			// ?��?��
	
	// ?��?��?��
	public Paging() {}
	
	public Paging(String pageNum) {
		
		// pageNum?�� ?��?�� 경우(맨처?�� board_list.jsp�? ?���??��거나, ?��?�� ?��?�� ?�� ?���? 게시�??��?�� ?��?���?�? ?���??�� ?��) null처리?���?�? 1�? ?��?�� 
		if(pageNum == null) {
			pageNum = "1";
		}
		
		this.pageNum = pageNum;
		
		currentPage = Integer.parseInt(pageNum);  // ?��?��?��?���?
		
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
		this.count = count;  // ?���? 게시�? 건수
		
		startRow = (currentPage - 1) * pageSize + 1;   // ?��?���?�? ?��?��번호 => start?�� ?��?�� (1)
		endRow =  currentPage * pageSize;    // ?��?���?�? ?��번호 => end?�� ?��?��(10)
		
		System.out.println("startRow => " + startRow);
		System.out.println("endRow => " + endRow);
		
		this.number = count - (currentPage - 1) * pageSize;  // ?��?���?번호(1)
		
		// ?��?���? 계산
		pageCalculator();
	}

	// ?��?���? 계산
	public void pageCalculator() {
		if(count > 0) {
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			System.out.println("pageCount : " + pageCount);
			
			startPage = 1;
			
			if(currentPage % 10 != 0) {
				startPage = (int)(currentPage / 10) * 10 + 1;
			}
			else {
				startPage = ((int)(currentPage / 10) - 1) * 10 + 1;
			}
			
			// System.out.println("startPage : " + startPage);
			
			pageBlock = 10;
			endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) endPage = pageCount;
			// System.out.println("endPage : " + endPage);
			
			// ?��?��
			if(startPage > pageSize) prev = startPage - 10;
			
			// ?��?��
			if(startPage < pageCount) next = startPage + 10;
			
			// System.out.println("prev : " + prev);
			// System.out.println("next : " + next);
				
		}
	}
}
