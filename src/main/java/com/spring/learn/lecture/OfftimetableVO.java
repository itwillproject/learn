package com.spring.learn.lecture;

import java.sql.Date;

public class OfftimetableVO {
	
	
	private String timetableNo;
	private String lectureNo;
	private String lectureAddress;
	private int maxSeat;
	private Date timetableStart;
	private Date timetableEnd;
	
	
	public String getTimetableNo() {
		return timetableNo;
	}
	public void setTimetableNo(String timetableNo) {
		this.timetableNo = timetableNo;
	}
	public String getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(String lectureNo) {
		this.lectureNo = lectureNo;
	}
	public String getLectureAddress() {
		return lectureAddress;
	}
	public void setLectureAddress(String lectureAddress) {
		this.lectureAddress = lectureAddress;
	}
	public int getMaxSeat() {
		return maxSeat;
	}
	public void setMaxSeat(int maxSeat) {
		this.maxSeat = maxSeat;
	}
	public Date getTimetableStart() {
		return timetableStart;
	}
	public void setTimetableStart(Date timetableStart) {
		this.timetableStart = timetableStart;
	}
	public Date getTimetableEnd() {
		return timetableEnd;
	}
	public void setTimetableEnd(Date timetableEnd) {
		this.timetableEnd = timetableEnd;
	}
	
	
	@Override
	public String toString() {
		return "OfftimetableVO [timetableNo=" + timetableNo + ", lectureNo=" + lectureNo + ", lectureAddress="
				+ lectureAddress + ", maxSeat=" + maxSeat + ", timetableStart=" + timetableStart + ", timetableEnd="
				+ timetableEnd + "]";
	}

	
	
}
