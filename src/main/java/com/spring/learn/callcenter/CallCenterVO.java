package com.spring.learn.callcenter;

import java.sql.Date;

public class CallCenterVO {
  private int qnaNo;
  private String userId, grade, qnaTitle, qnaContent, qnaAdopt, qnaFile;
  private Date qnaRegdate;

  public int getQnaNo() {
    return qnaNo;
  }

  public void setQnaNo(int qnaNo) {
    this.qnaNo = qnaNo;
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

  public String getQnaTitle() {
    return qnaTitle;
  }

  public void setQnaTitle(String qnaTitle) {
    this.qnaTitle = qnaTitle;
  }

  public String getQnaContent() {
    return qnaContent;
  }

  public void setQnaContent(String qnaContent) {
    this.qnaContent = qnaContent;
  }

  public String getQnaAdopt() {
    return qnaAdopt;
  }

  public void setQnaAdopt(String qnaAdopt) {
    this.qnaAdopt = qnaAdopt;
  }

  public String getQnaFile() {
    return qnaFile;
  }

  public void setQnaFile(String qnaFile) {
    this.qnaFile = qnaFile;
  }

  public Date getQnaRegdate() {
    return qnaRegdate;
  }

  public void setQnaRegdate(Date qnaRegdate) {
    this.qnaRegdate = qnaRegdate;
  }

  @Override
  public String toString() {
    return "CallCenterVO{" +
        "qnaNo=" + qnaNo +
        ", userId='" + userId + '\'' +
        ", grade='" + grade + '\'' +
        ", qnaTitle='" + qnaTitle + '\'' +
        ", qnaContent='" + qnaContent + '\'' +
        ", qnaAdopt='" + qnaAdopt + '\'' +
        ", qnaFile='" + qnaFile + '\'' +
        ", qnaRegdate=" + qnaRegdate +
        '}';
  }
}
