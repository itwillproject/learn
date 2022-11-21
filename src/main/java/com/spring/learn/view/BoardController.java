package com.spring.learn.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.board.BoardService;

@Controller					// 단 현재 위치(클래스)에서만 유효
@SessionAttributes("board") // board라는 이름의 Model객체가 있으면 세션에 저장
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	public BoardController() {
		System.out.println(">> BoardController() 생성함");
	}
	
	

	
	
}
