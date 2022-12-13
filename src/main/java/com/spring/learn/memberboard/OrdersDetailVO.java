package com.spring.learn.memberboard;

import java.sql.Date;

public class OrdersDetailVO {
	
	private String orderDetailNo, orderNo, userId, lectureNo, timetableNo, lectureRate, orderStatus // 디테일 테이블 내용
	, orderRegdate // 주문 테이블 내용
	, lectureCoverimg, lectureTitle, lectureSummary, lectureDue // 강의 테이블 내용
	, searchKeyword // 검색 할 때 필요한 정보
	, begin, end, cPage // 페이징 할때 필요한 정보
	, sorting;
	private Date endDate, sysdate; // 남은날짜 계산 LECTURE_DUE + ORDER_REGDATE - SYSDATE LECTURE_DUE -로  시작하면 안되는 것

	public String getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(String orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(String lectureNo) {
		this.lectureNo = lectureNo;
	}

	public String getTimetableNo() {
		return timetableNo;
	}

	public void setTimetableNo(String timetableNo) {
		this.timetableNo = timetableNo;
	}

	public String getLectureRate() {
		return lectureRate;
	}

	public void setLectureRate(String lectureRate) {
		this.lectureRate = lectureRate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderRegdate() {
		return orderRegdate;
	}

	public void setOrderRegdate(String orderRegdate) {
		this.orderRegdate = orderRegdate;
	}

	public String getLectureCoverimg() {
		return lectureCoverimg;
	}

	public void setLectureCoverimg(String lectureCoverimg) {
		this.lectureCoverimg = lectureCoverimg;
	}

	public String getLectureTitle() {
		return lectureTitle;
	}

	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}

	public String getLectureSummary() {
		return lectureSummary;
	}

	public void setLectureSummary(String lectureSummary) {
		this.lectureSummary = lectureSummary;
	}

	public String getLectureDue() {
		return lectureDue;
	}

	public void setLectureDue(String lectureDue) {
		this.lectureDue = lectureDue;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getcPage() {
		return cPage;
	}

	public void setcPage(String cPage) {
		this.cPage = cPage;
	}

	public String getSorting() {
		return sorting;
	}

	public void setSorting(String sorting) {
		this.sorting = sorting;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}

	@Override
	public String toString() {
		return "OrdersDetailVO [orderDetailNo=" + orderDetailNo + ", orderNo=" + orderNo + ", userId=" + userId
				+ ", lectureNo=" + lectureNo + ", timetableNo=" + timetableNo + ", lectureRate=" + lectureRate
				+ ", orderStatus=" + orderStatus + ", orderRegdate=" + orderRegdate + ", lectureCoverimg="
				+ lectureCoverimg + ", lectureTitle=" + lectureTitle + ", lectureSummary=" + lectureSummary
				+ ", lectureDue=" + lectureDue + ", searchKeyword=" + searchKeyword + ", begin=" + begin + ", end="
				+ end + ", cPage=" + cPage + ", sorting=" + sorting + ", endDate=" + endDate + ", sysdate=" + sysdate
				+ "]";
	}

}
