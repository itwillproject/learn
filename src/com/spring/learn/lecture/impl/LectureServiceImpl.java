package com.spring.learn.lecture.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.learn.lecture.CategoryVO;
import com.spring.learn.lecture.LectureService;
import com.spring.learn.lecture.LectureVO;

@Service("lectureService")
public class LectureServiceImpl implements LectureService {

	@Autowired //타입이 일치하는 객체(인스턴스)주입 (DI)
	private LectureDAO lectureDAO;

	public LectureServiceImpl() {
		System.out.println(">> LectureServiceImpl() 객체 생성");
	}
	

	@Override
	public List<CategoryVO> getCategories() {
		return lectureDAO.getCategories();
	}

	@Override
	public String getCategoryName(String categoryNo) {
		return lectureDAO.getCategoryName(categoryNo);
	}

	
	@Override
	public List<LectureVO> getOnlineLectures(Map<String, String> map) {
		return lectureDAO.getOnlineLectures(map);
	}
	

	@Override
	public List<LectureVO> getOfflineLectures(Map<String, String> map) {
		return lectureDAO.getOfflineLectures(map);
	}


	@Override
	public List<LectureVO> getLecturesFiltering(Map<String, String> map) {
		return lectureDAO.getLecturesFiltering(map);
	}


	@Override
	public int getLectureTotalCount(Map<String, String> map) {
		return lectureDAO.getLectureTotalCount(map);
	}


	@Override
	public int countStudents(String lectureNo) {
		return lectureDAO.countStudents(lectureNo);
	}


	@Override
	public double getAvgLecture(String lectureNo) {
		return lectureDAO.getAvgLecture(lectureNo);
	}


	@Override
	public int countLectureReview(String lectureNo) {
		return lectureDAO.countLectureReview(lectureNo);
	}


	@Override
	public List<LectureVO> searchLectureLocation(Map<String, String> map) {
		return lectureDAO.searchLectureLocation(map);
	}


	@Override
	public List<LectureVO> lectureLocationAll() {
		return lectureDAO.lectureLocationAll();
	}


	@Override
	public List<LectureVO> getOnLecturesFiltering(Map<String, String> map) {
		return lectureDAO.getOnLecturesFiltering(map);
	}


	@Override
	public int getOnLectureTotalCount(Map<String, String> map) {
		return lectureDAO.getOnLectureTotalCount(map);
	}

	public LectureVO getLecture(String lecNo) {
		return lectureDAO.getLecture(lecNo);
	}
	
	@Override
	public List<LectureVO> getOnlineLecturebyUserId(String userId) {
		return lectureDAO.getOnlineLecturebyUserId(userId);
	}

	@Override
	public Integer getTeacherLectureCount(String userId) {
		return lectureDAO.getTeacherLectureCount(userId);
	}

	@Override
	public List<LectureVO> getTeacherLectureList(Map<String, String> map) {
		return lectureDAO.getTeacherLectureList(map);
	}

	@Override
	public Double getLectureAvgRate(String userName) {
		return lectureDAO.getLectureAvgRate(userName);
	}

	@Override
	public Integer getLectureSales(String userName) {
		return lectureDAO.getLectureSales(userName);
	}

	@Override
	public Integer getStudentCount(String userName) {
		return lectureDAO.getStudentCount(userName);
	}

	@Override
	public List<LectureVO> getRealtimeSales(Map<String, String> map) {
		return lectureDAO.getRealtimeSales(map);
	}

	@Override
	public List<LectureVO> salesByMonth(String userName) {
		return lectureDAO.salesByMonth(userName);
	}

	@Override
	public List<LectureVO> salesByLecture(String userName) {
		return lectureDAO.salesByLecture(userName);
	}

	@Override
	public List<LectureVO> salesByLine(String userName) {
		return lectureDAO.salesByLine(userName);
	}

	@Override
	public List<LectureVO> getSalesByLecture(Map<String, String> map) {
		return lectureDAO.getSalesByLecture(map);
	}

	@Override
	public int getSalesSumByLecture(String lectureNo) {
		return lectureDAO.getSalesSumByLecture(lectureNo);
	}

	@Override
	public int getSalesLectureViewCount(String lectureNo) {
		return lectureDAO.getSalesLectureViewCount(lectureNo);
	}

	@Override
	public int getOrderLectureCount(String userId) {
		return lectureDAO.getOrderLectureCount(userId);
	}

	@Override
	public void addLecture(LectureVO lecture) {
		lectureDAO.addLecture(lecture);
	}

	@Override
	public int getLectureNo() {
		return lectureDAO.getLectureNo();
	}

	
	
}
