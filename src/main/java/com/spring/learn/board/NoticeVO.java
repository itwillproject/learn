package com.spring.learn.board;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class NoticeVO {
	private String userId, grade, boardTitle, boardContent, boardFile;
	private int boardNo, boardHit;
	private Date boardRegdate;
	
	//검색용---------------------------------
	@JsonIgnore
	private String searchKeyword = "";
	
	
	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	//-------------------------------------
	
	public NoticeVO() {
		System.out.println(">> NoticeVO() 객체 생성");
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

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public Date getBoardRegdate() {
		return boardRegdate;
	}

	public void setBoardRegdate(Date boardRegdate) {
		this.boardRegdate = boardRegdate;
	}

	// JSON 데이터(기본) : 1668395120000 =====> 2022-11-14 12:05:20
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss",
			timezone = "Asia/Seoul")

	@Override
	public String toString() {
		return "NoticeVO [userId=" + userId + ", grade=" + grade + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardRegdate=" + boardRegdate + ", boardFile=" + boardFile + ", boardNo=" + boardNo
				+ ", boardHit=" + boardHit + "]";
	}
  
}
