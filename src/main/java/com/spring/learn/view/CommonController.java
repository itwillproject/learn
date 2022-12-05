package com.spring.learn.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.learn.lecture.CategoryVO;
import com.spring.learn.lecture.LectureService;

@Controller					// 단 현재 위치(클래스)에서만 유효
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	private LectureService lectureService;
	
	
	@RequestMapping("/main.do")
	public String getHeaderInfo (HttpSession session) {
		
		//카테고리 가져오기
		List<CategoryVO> categories = lectureService.getCategories();
		System.out.println(categories);
		session.setAttribute("categories", categories);
		
		return "/Common/index.jsp";
		
	};

}
