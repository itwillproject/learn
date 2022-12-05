package com.spring.learn.common;

public class PagingLecRoad {
	
	private int nowPage = 1; //현재 페이지
	private int nowBlock = 1; //현재 블록
	 
	private int numPerPage = 3; //한 페이지의 글 개수
	private int numPerBlock = 2; //한 블록의 페이지 개수
	
	private int totalRecord = 0; //전체 게시글 수
	private int totalPage = 0; //전체 페이지 수
	private int totalBlock = 0; //전체 
	
	private int begin = 0;
	private int end = 0;
	
	private int beginPage = 0;
	private int endPage = 0;
	
	private int cPage = 1;
	
	// 전체 페이지 구하기
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage >= 1) {
			totalPage++;
		}
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getNumPerBlock() {
		return numPerBlock;
	}

	public void setNumPerBlock(int numPerBlock) {
		this.numPerBlock = numPerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getcPage() {
		return cPage;
	}

	public void setcPage(int cPage) {
		this.cPage = cPage;
	}

	@Override
	public String toString() {
		return "Paging [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage=" + numPerPage + ", numPerBlock="
				+ numPerBlock + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage + ", totalBlock="
				+ totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage + ", endPage=" + endPage
				+ ", cPage=" + cPage + "]";
	}
	
	
}
