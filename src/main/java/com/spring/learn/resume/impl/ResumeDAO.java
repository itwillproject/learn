package com.spring.learn.resume.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.learn.resume.ResumeVO;

@Repository
public class ResumeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ResumeDAO() {
		System.out.println("=========== ResumeDAOMybatis() 객체 생성");

	}
	
	void insertResume(ResumeVO vo) {
		System.out.println("insertResume()");
		mybatis.insert("resumeDAO.insertResume", vo);
	}
	
	void deleteResume(ResumeVO vo){
		
	}
	void updateResume(ResumeVO vo) {
		
	}
	ResumeVO getResume(ResumeVO vo) {
		
		
		return vo;
		
	}
	List<ResumeVO> getResumeList(ResumeVO vo){
		
		
		return null;
		
	}
	
}
