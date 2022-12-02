package com.spring.learn.board;

public class BoardCommentVO {
	private String commentNo,boardNo,userId,grade,commentContent,commentRegdate,categoryName,answerAdopt,commentFile
	,qboardNo, fboardNo;

	public String getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
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

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentRegdate() {
		return commentRegdate;
	}

	public void setCommentRegdate(String commentRegdate) {
		this.commentRegdate = commentRegdate;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getAnswerAdopt() {
		return answerAdopt;
	}

	public void setAnswerAdopt(String answerAdopt) {
		this.answerAdopt = answerAdopt;
	}

	public String getCommentFile() {
		return commentFile;
	}

	public void setCommentFile(String commentFile) {
		this.commentFile = commentFile;
	}
	
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

	@Override
	public String toString() {
		return "BoardCommentVO [commentNo=" + commentNo + ", boardNo=" + boardNo + ", userId=" + userId + ", grade="
				+ grade + ", commentContent=" + commentContent + ", commentRegdate=" + commentRegdate
				+ ", categoryName=" + categoryName + ", answerAdopt=" + answerAdopt + ", commentFile=" + commentFile
				+ ", qboardNo=" + qboardNo + ", fboardNo=" + fboardNo + "]";
	}

}
