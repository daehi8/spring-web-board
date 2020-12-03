package home.model.dto;

public class PaginationDTO {
	private int pageSize = 10;
	private String pageNum;
	private int currentPage;
	private int startRow;
	private int endRow;
	private int count;
	private int number;
	private int pageCount;
	private int startPage;
	private int endPage;
	private int pageBlock = 10;
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	
	public void paging(String pageNum, int count) {
		this.pageNum = pageNum;
		this.count = count;
		
		this.currentPage = Integer.parseInt(pageNum);
		this.startRow = (currentPage - 1) * pageSize + 1;
		this.endRow = currentPage * pageSize;
		this.number = count - (currentPage - 1) * pageSize;
		
		this.pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		this.startPage = (int)(currentPage/10)*10+1;
		this.endPage = startPage + pageBlock-1;
	}
}
