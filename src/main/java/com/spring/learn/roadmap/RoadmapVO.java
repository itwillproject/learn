package com.spring.learn.roadmap;

public class RoadmapVO {
  // lectureList: 강의번호 '/'로 구분해서 나열
  private String rboardNo, userId, rboardTitle, rboardContent, lectureList;

  public String getRboardNo() {
    return rboardNo;
  }

  public void setRboardNo(String rboardNo) {
    this.rboardNo = rboardNo;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getRboardTitle() {
    return rboardTitle;
  }

  public void setRboardTitle(String rboardTitle) {
    this.rboardTitle = rboardTitle;
  }

  public String getRboardContent() {
    return rboardContent;
  }

  public void setRboardContent(String rboardContent) {
    this.rboardContent = rboardContent;
  }

  public String getLectureList() {
    return lectureList;
  }

  public void setLectureList(String lectureList) {
    this.lectureList = lectureList;
  }

  @Override
  public String toString() {
    return "RoadmapVO{" +
        "rboardNo='" + rboardNo + '\'' +
        ", userId='" + userId + '\'' +
        ", rboardTitle='" + rboardTitle + '\'' +
        ", rboardContent='" + rboardContent + '\'' +
        ", lectureList='" + lectureList + '\'' +
        '}';
  }

}
