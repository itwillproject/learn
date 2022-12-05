package com.spring.learn.resume;

import java.util.List;

import org.springframework.stereotype.Service;

public interface ResumeService {
		void insertResume(ResumeVO vo);
		void deleteResume(ResumeVO vo);
		void updateResume(ResumeVO vo);
		ResumeVO getResume(ResumeVO vo);
		List<ResumeVO> getResumeList(ResumeVO vo);
		
}
