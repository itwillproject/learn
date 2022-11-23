package com.spring.learn.board;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class NoticeVO {
	private String userId, grade, boardTitle, boardContent, boardFile;
	private int boardNo;
	//private Date boardRegdate;
	private String boardRegdate;
	
	@JsonIgnore
	private String searchKeyword = "";

	public NoticeVO() {
		System.out.println(">> NoticeVO() 객체 생성");
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	//public Date getBoardRegdate() {
	//	return boardRegdate;
	//}

	//public void setBoardRegdate(Date boardRegdate) {
	//	this.boardRegdate = boardRegdate;
	//}
	
	public String getBoardRegdate() {
		return boardRegdate;
	}

	public void setBoardRegdate(String boardRegdate) {
		this.boardRegdate = boardRegdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [userId=" + userId + ", grade=" + grade + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardFile=" + boardFile + ", boardNo=" + boardNo + ", boardRegdate=" + boardRegdate
				+ ", searchKeyword=" + searchKeyword + "]";
	}


	// JSON 데이터(기본) : 1668395120000 =====> 2022-11-14 12:05:20
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss",
	//		timezone = "Asia/Seoul")

	


  
}
