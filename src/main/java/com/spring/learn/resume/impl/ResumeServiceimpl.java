package com.spring.learn.resume.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.learn.resume.ResumeService;
import com.spring.learn.resume.ResumeVO;

@Service("resumeService")
public class ResumeServiceimpl implements ResumeService {
@Autowired
	private ResumeDAO resumeDAO;
	
	@Override
	public void insertResume(ResumeVO vo) {
		resumeDAO.insertResume(vo);
		
	}

	@Override
	public void deleteResume(ResumeVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateResume(ResumeVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ResumeVO getResume(ResumeVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ResumeVO> getResumeList(ResumeVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
