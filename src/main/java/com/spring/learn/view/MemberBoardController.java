package com.spring.learn.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.memberboard.AdminQNAReplyService;
import com.spring.learn.memberboard.AdminQNAReplyVO;
import com.spring.learn.memberboard.MemberBoardService;
import com.spring.learn.memberboard.MemberBoardVO;

@Controller					// 단 현재 위치(클래스)에서만 유효
@SessionAttributes("memberBoard") // board라는 이름의 Model객체가 있으면 세션에 저장
@RequestMapping("/memberBoard")
public class MemberBoardController {

	@Autowired
	private MemberBoardService memberBoardService;
	
	@Autowired
	private AdminQNAReplyService adminQNAReplyService;
	
	
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
	
	
	@RequestMapping("/inquiryDetail.do")
	public String getInquiryDetail(@ModelAttribute MemberBoardVO vo, Model model) {

		System.out.println(">>> MemberBoardController.getInquiryDetail 실행");		
		System.out.println("vo : " + vo);
				
		MemberBoardVO memberBoard = memberBoardService.getBoard(vo); // 조회하고
		AdminQNAReplyVO adminQNAReply = adminQNAReplyService.getReply(vo.getQnaNo());
		System.out.println(memberBoard);
		System.out.println(adminQNAReply);
		model.addAttribute("memberBoard", memberBoard);
		model.addAttribute("adminQNAReply", adminQNAReply);
		
		return "/Member/inquiryDetail.jsp"; // 이동
		
	}

	
	//여기서는 이정문꺼
	@RequestMapping("/cBoardList.do")
	@ResponseBody
	public List<MemberBoardVO> cBoardList(MemberBoardVO vo) {
		System.out.println(">>> 보드리스트 가져오기");		
		System.out.println("vo : " + vo);
				
		List<MemberBoardVO> cBoardList = memberBoardService.getBoardList(vo); // 조회하고
		System.out.println(cBoardList);

		return cBoardList; // 이동
	}
	
	@RequestMapping("/resolvedCBoardList.do")
	@ResponseBody
	public List<MemberBoardVO> resolvedCBoardList(MemberBoardVO vo) {
		System.out.println(">>> 해결 보드리스트 가져오기");		
				
		List<MemberBoardVO> resolvedCBoardList = memberBoardService.resolvedCBoardList(vo); // 조회하고
		

		return resolvedCBoardList; // 이동
	}
	
	@RequestMapping("/unResolvedCBoardList.do")
	@ResponseBody
	public List<MemberBoardVO> unResolvedCBoardList(MemberBoardVO vo) {
		System.out.println(">>> 미해결 보드리스트 가져오기");		
				
		List<MemberBoardVO> unResolvedCBoardList = memberBoardService.unResolvedCBoardList(vo); // 조회하고
		

		return unResolvedCBoardList; // 이동
	}
	
	@RequestMapping("/callCenterBoardList.do")
	public String callCenterBoardList(MemberBoardVO vo, Model model) {
		System.out.println(">>> 콜센터보드 첫 페이징 하기");		
				
		List<MemberBoardVO> BoardList = memberBoardService.getBoardList(vo); // 조회하고
		model.addAttribute("BoardList", BoardList); // 값 저장하고
		System.out.println(BoardList);
		return "/Member/inquiry.jsp"; // 이동
	}
	
}
