package com.spring.learn.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.learn.resume.ResumeService;
import com.spring.learn.resume.ResumeVO;

@Controller
public class ResumeController {
	
	@Autowired
	private ResumeService resumeService;
	
	/*
	 * @RequestMapping : 요청과 처리(Controller) 연결(HandlerMapping 역할 대체)
	 * Command 객체 사용 : 파라미터로 전달되는 값을 Command 객체에 설정
	 * 1. UserVO 타입 객체 생성
	 * 2. UserVO 타입 객체에 전달받은 파라미터 값을 설정(이름 일치하는 경우)
	 * 3. UserVO 타입 객체를 메소드의 파라미터 값으로 전달
	 */
	//@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@RequestMapping("/Member/Belecture/insertResume.do") 
	public String insertResume(ResumeVO vo) {
		System.out.println("받은 데이터 vo : " + vo);
		
		resumeService.insertResume(vo);
	
		return "close.jsp";
	}
	
	
}
