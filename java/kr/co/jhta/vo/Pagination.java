package kr.co.jhta.vo;

public class Pagination {

	private int pages;		// 한 화면에 표시할 페이지 번호
	private int rows;		// 한 화면에 표시할 데이터 개수
	private int cp;			// 현재 페이지 번호
	private int cb;			// 현재 블록 번호
	private int totalRows;	// 전체 데이터 개수
	
	private int totalPages;
	private int totalBlocks;
	private int beginPageIndex;
	private int endPageIndex;
	
	private int beginIndex;
	private int endIndex;
	
	public Pagination(int totalRows, int cp) {
		this.totalRows = totalRows;
		this.cp = cp;
		this.pages = 10;
		this.rows = 10;
		
		init();
	}
	
	public Pagination(int totalRows, int cp, int pages, int rows) {
		this.totalRows = totalRows;
		this.cp = cp;
		this.pages = pages;
		this.rows = rows;
		
		init();
	}
	
	private void init() {
		totalPages = (int) (Math.ceil((double) totalRows/rows));
		totalBlocks = (int) (Math.ceil((double) totalPages/pages));
		
		if (cp <= 0) {
			cp = 1;
		}
		if (cp > totalPages) {
			cp = totalPages;
		}
		
		beginIndex = (cp - 1)*rows + 1;
		endIndex = cp*rows;
		
		cb = (int) (Math.ceil((double) cp/pages));
		
		beginPageIndex = (cb - 1)*pages + 1;
		endPageIndex = cb*pages;
		if (cb == totalBlocks) {
			endPageIndex = totalPages;
		}
		
	}

	public int getPages() {
		return pages;
	}

	public int getRows() {
		return rows;
	}

	public int getCp() {
		return cp;
	}

	public int getCb() {
		return cb;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getTotalBlocks() {
		return totalBlocks;
	}

	public int getBeginPageIndex() {
		return beginPageIndex;
	}

	public int getEndPageIndex() {
		return endPageIndex;
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}
	
	public int getPrevBlock() {
		return getBeginPageIndex() - 1;
	}
	
	public int getNextBlock() {
		return getEndPageIndex() + 1;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public void setCb(int cb) {
		this.cb = cb;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public void setTotalBlocks(int totalBlocks) {
		this.totalBlocks = totalBlocks;
	}

	public void setBeginPageIndex(int beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	@Override
	public String toString() {
		return "Pagination [pages=" + pages + ", rows=" + rows + ", cp=" + cp + ", cb=" + cb + ", totalRows="
				+ totalRows + ", totalPages=" + totalPages + ", totalBlocks=" + totalBlocks + ", beginPageIndex="
				+ beginPageIndex + ", endPageIndex=" + endPageIndex + ", beginIndex=" + beginIndex + ", endIndex="
				+ endIndex + "]";
	}
	
}
