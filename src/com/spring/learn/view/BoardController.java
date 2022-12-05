package com.spring.learn.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.board.BoardService;
import com.spring.learn.board.BoardVO;
import com.spring.learn.user.UserVO;

@Controller					// 단 현재 위치(클래스)에서만 유효
@SessionAttributes("board") // board라는 이름의 Model객체가 있으면 세션에 저장
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	public BoardController() {
		System.out.println(">> BoardController() 생성");
	}
	
	@RequestMapping("/getQnaBoardList.do")
	public String getQnaBoardList(BoardVO vo, Model model) {
		System.out.println(">>> 보드리스트 가져오기");		
		System.out.println("vo : " + vo);
		
		if(vo.getQboardNo() == null) vo.setQboardNo("a");
		
		List<BoardVO> boardList = boardService.getBoardList(vo); // 조회하고
		
		model.addAttribute("boardList", boardList); // 값 저장하고

		return "/Community/qna/qnaBoardList.jsp"; // 이동
	}
	
	@GetMapping("/qnaWriteForm.do")
	public String toQnaWriteForm(BoardVO vo) {
		System.out.println(">>> qna작성폼 이동");						
				
		return "redirect:/Community/qna/qnaWriteForm.jsp"; // 이동
	}
	
	
	
	

	
	
}
