package com.spring.learn.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.resume.ResumeService;
import com.spring.learn.resume.ResumeVO;

@SessionAttributes("resume")
@RequestMapping({"/Member", "/memberBoard"})
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
	@RequestMapping("/Belecture/insertResume.do") 
	public String insertResume(ResumeVO vo) {
		System.out.println("받은 데이터 vo : " + vo);
		
		resumeService.insertResume(vo);
	
		return "close.jsp";
	}
	
	@RequestMapping("/updateResume.do") 
	public String updateResume(ResumeVO vo) {
		System.out.println("받은 데이터 vo : " + vo);
		
		resumeService.updateResume(vo);
	
		return "getResume.do";
	}
	
	@RequestMapping("/deleteResume.do") 
	public String deleteResume(ResumeVO vo) {
		System.out.println("받은 데이터 vo : " + vo);
		
		resumeService.deleteResume(vo);
	
		return "myPage.jsp";
	}
	
	@RequestMapping("/getResume.do")
	public String getResume(ResumeVO vo, Model model ) {
		System.out.println("받은 데이터 vo :" + vo);
		
		vo = resumeService.getResume(vo);
		
		if (vo == null) {
			vo = new ResumeVO();
		}
		model.addAttribute("resume", vo);
		
		return "/Member/Belecture/viewLectureApply.jsp";
		
	}
	
	
	
}
