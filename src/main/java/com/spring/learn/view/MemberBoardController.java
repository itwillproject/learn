package com.spring.learn.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.board.BoardService;
import com.spring.learn.board.BoardVO;
import com.spring.learn.memberboard.MemberBoardService;
import com.spring.learn.memberboard.MemberBoardVO;
import com.spring.learn.user.UserVO;

@Controller					// 단 현재 위치(클래스)에서만 유효
@SessionAttributes("memberBoard") // board라는 이름의 Model객체가 있으면 세션에 저장
@RequestMapping("/memberBoard")
public class MemberBoardController {

	@Autowired
	private MemberBoardService memberBoardService;
	
	public MemberBoardController() {
		System.out.println(">> MemberBoardController() 생성");
	}
	
	@RequestMapping("/getMyQBoardList.do")
	public String getQnaBoardList(MemberBoardVO vo, Model model) {
		System.out.println(">>> 보드리스트 가져오기");		
		System.out.println("vo : " + vo);
				
		List<MemberBoardVO> memberBoardList = memberBoardService.getBoardList(vo); // 조회하고
		
		if (memberBoardList != null) {
			model.addAttribute("memberBoardList", memberBoardList); // 값 저장하고
		}

		return "/Member/MemberBoard/myQBoardList.jsp"; // 이동
	}
	
	@GetMapping("/qnaWriteForm.do")
	public String toQnaWriteForm(MemberBoardVO vo) {
		System.out.println(">>> qna작성폼 이동");						
				
		return "/Member/MemberBoard/myQWriteForm.jsp"; // 이동
	}
	
	@PostMapping("/qnaWriteForm.do")
	public String QnaWrite(MemberBoardVO vo) {
		
		System.out.println(">> QnaWrite 입력 도착 : " + vo);
		
		memberBoardService.insertBoard(vo);						
		
		return "/memberBoard/getMyQBoardList.do"; // 이동
	}
	
	
	
	
	
	
	

	
	
}
