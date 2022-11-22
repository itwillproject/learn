package com.spring.learn.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.board.NoticeService;
import com.spring.learn.board.NoticeVO;
import com.spring.learn.common.Criteria;
import com.spring.learn.common.PageMaker;

//@SessionAttributes : board라는 이름의 Model 있으면 session에 저장
//  단, 현재위치(클래스)에서만 유효
@Controller
@SessionAttributes("notice") 
public class NoticeController { 
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/getNotice.do")
	public String getNotice(NoticeVO vo, Model model) {
		System.out.println(">> 게시글 상세 보여주기");
		
		NoticeVO vo2 = noticeService.getNotice(vo); 

		model.addAttribute("vo", vo2);
		
		return "Member/MemberBoard/noticeView.jsp";
	}
	
	@RequestMapping("/getNoticeList.do")
	public String list(Model model, Criteria cri) throws Exception{
		System.out.println(">> 페이지에 해당하는 게시글 리스트 보여주기");
		//logger.info("list");
		
		model.addAttribute("list", noticeService.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.listCount());
		
//		if (pageMaker.getCri().getPage() != 0) {
//			pageMaker.setNowPage(pageMaker.getCri().getPage());
//		}
		
		model.addAttribute("pageMaker", pageMaker);
		
		System.out.println(">> pageMaker : " + pageMaker);
		
		return "Member/MemberBoard/notice.jsp";
		
	}
	
	@RequestMapping("/getJsonBoardList.do")
	//@ResponseBody //response 응답객체의 몸체(body)에 데이터 전달
	public List<NoticeVO> getJsonBoardList(NoticeVO vo) {
		System.out.println("========= BoardAjaxController getJsonBoardList() 실행");
		List<NoticeVO> boardList = noticeService.getNoticeList(vo);
		System.out.println("boardList(notice) : " + boardList);
		
		return boardList;
	}
	
	//JSON 데이터를 받아 게시글 찾아서 JSON 데이터로 리턴(응답)
	@PostMapping("/getJsonBoard.do")
	public NoticeVO getJsonBoard(@RequestBody NoticeVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println("========== BoardAjaxController getJsonBoard(vo) 실행");
		System.out.println("getJsonBoard() vo : " + vo);
		
		NoticeVO board = noticeService.getNotice(vo);
		System.out.println("getJsonBoard() notice : " + board);
		
		return board;
	}
	
	
/*
	@RequestMapping("/getNoticeList.do")
	public String getNoticeList(NoticeVO vo, Model model) {

		List<NoticeVO> list = noticeService.getNoticeList(vo);
		
		model.addAttribute("list", list);
		
		return "Member/MemberBoard/notice.jsp";
	}
*/

	
	// 메소드의 정의부에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// 뷰(View)에 전달될 때 설정된 명칭 사용(예: conditionMap)
/*
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("=======> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
*/


}
