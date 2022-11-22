package com.spring.learn.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.board.FaqService;
import com.spring.learn.board.FaqVO;

//@SessionAttributes : board라는 이름의 Model 있으면 session에 저장
//  단, 현재위치(클래스)에서만 유효
@Controller
@SessionAttributes("faq") 
public class FaqController { 
	@Autowired
	private FaqService faqService;

	@RequestMapping("/getFaqList.do")
	public String getFaqList(FaqVO vo, Model model) {

		List<FaqVO> list = faqService.getFaqList(vo);
		
		model.addAttribute("list", list);
		
		return "Member/MemberBoard/faq.jsp";
	}

	
	// 메소드의 정의부에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// 뷰(View)에 전달될 때 설정된 명칭 사용(예: conditionMap)
	//	@ModelAttribute("conditionMap")
	//	public Map<String, String> searchConditionMap() {
	//		System.out.println("=======> Map searchConditionMap() 실행");
	//		Map<String, String> conditionMap = new HashMap<String, String>();
	//		conditionMap.put("제목", "TITLE");
	//		conditionMap.put("내용", "CONTENT");
	//		
	//		return conditionMap;
	//	}



}
