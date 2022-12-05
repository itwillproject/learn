package com.spring.learn.board;

public class BoardVO {
	private String qboardNo,fboardNo,lectureNo,userId,grade,categoryName,boardTitle,boardContent,boardRegdate,boardAdopt,
  				boardHit,boardLike,boardFile,SearchCondition,SearchKeyword;

	public String getQboardNo() {
		return qboardNo;
	}

	public void setQboardNo(String qboardNo) {
		this.qboardNo = qboardNo;
	}

	public String getFboardNo() {
		return fboardNo;
	}

	public void setFboardNo(String fboardNo) {
		this.fboardNo = fboardNo;
	}

	public String getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(String lectureNo) {
		this.lectureNo = lectureNo;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public String getBoardRegdate() {
		return boardRegdate;
	}

	public void setBoardRegdate(String boardRegdate) {
		this.boardRegdate = boardRegdate;
	}

	public String getBoardAdopt() {
		return boardAdopt;
	}

	public void setBoardAdopt(String boardAdopt) {
		this.boardAdopt = boardAdopt;
	}

	public String getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(String boardHit) {
		this.boardHit = boardHit;
	}

	public String getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(String boardLike) {
		this.boardLike = boardLike;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public String getSearchCondition() {
		return SearchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		SearchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return SearchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		SearchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "BoardVO [qboardNo=" + qboardNo + ", fboardNo=" + fboardNo + ", lectureNo=" + lectureNo + ", userId="
				+ userId + ", grade=" + grade + ", categoryName=" + categoryName + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardRegdate=" + boardRegdate + ", boardAdopt=" + boardAdopt
				+ ", boardHit=" + boardHit + ", boardLike=" + boardLike + ", boardFile=" + boardFile
				+ ", SearchCondition=" + SearchCondition + ", SearchKeyword=" + SearchKeyword + "]";
	}
	
}
