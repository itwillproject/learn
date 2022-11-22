package com.spring.learn.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.learn.common.Paging;
import com.spring.learn.memberboard.MemberBoardService;
import com.spring.learn.memberboard.MemberBoardVO;
import com.spring.learn.user.UserVO;

@Controller					// 단 현재 위치(클래스)에서만 유효
@SessionAttributes("memberBoard") // memberBoard라는 이름의 Model객체가 있으면 세션에 저장
@RequestMapping("/memberBoard")
public class MemberBoardController {

	@Autowired
	private MemberBoardService memberBoardService;
	
	public MemberBoardController() {
		System.out.println(">> MemberBoardController() 생성");
	}
	
	// 검색과 페이지 보기, 페이징- 아작스 버전 하나 만들기
	@RequestMapping("/getMyQBoardList.do")
	public String getQnaBoardList(MemberBoardVO bvo, Model model, Paging p, HttpSession session) {
		System.out.println(">>> 보드리스트 가져오기");		
		System.out.println("vo : " + bvo);
		model.addAttribute("memberBoard", bvo);
		UserVO uvo = (UserVO) session.getAttribute("user");
		
		// 전체 페이지 수 구하기
		p.setTotalRecord(memberBoardService.countBoard(bvo));
		p.setTotalPage();
		
		// 현재 페이지 구하기
		if (p.getcPage() != 0) {
			p.setNowPage(p.getcPage());
		}
		
		// 현재 페이지에 시작할 첫게시글 번호, 끝 게시글 번호
		p.setEnd(p.getNowPage()*p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() +1);
		
		// 끝번호가 더 크면 토탈번호와 맞게 하기 - 끝블록 끝페이지 때문
		if (p.getEnd() > p.getTotalRecord()) p.setEnd(p.getTotalRecord());
		
		// 블록 계산하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage -1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) p.setEndPage(p.getTotalPage());		
		
		System.out.println("계산된 paging : " + p);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKeyword", bvo.getSearchKeyword());
		map.put("userId", uvo.getUserId());
		map.put("begin", Integer.toString(p.getBegin()));
		map.put("end", Integer.toString(p.getEnd()));
		
		System.out.println(">>>>> map : " + map);

		// 리스트 가져오기
		List<MemberBoardVO> memberBoardList = memberBoardService.getBoardList(map); // 조회하고
				
		
		// 리스트 모델에 저장
		if (memberBoardList != null) {
			model.addAttribute("memberBoardList", memberBoardList); // 값 저장하고
			model.addAttribute("pvo", p);
		}		
		
		System.out.println("memberBoardList : " + memberBoardList);

		return "/Member/MemberBoard/myQBoardList.jsp"; // 이동
	}
	
	// 입력폼으로 이동
	@GetMapping("/qnaWriteForm.do")
	public String toQnaWriteForm(MemberBoardVO bvo) {
		System.out.println(">>> qna작성폼 이동");						
				
		return "/Member/MemberBoard/myQWriteForm.jsp"; // 이동
	}
	
	// 입력
	@PostMapping("/qnaWriteForm.do")
	public String QnaWrite(MemberBoardVO mvo, HttpSession session) {
		
		UserVO uvo = (UserVO) session.getAttribute("user");
		mvo.setUserId(uvo.getUserId());
		mvo.setGrade(uvo.getGrade());
		
		System.out.println(">> QnaWrite 입력 도착, uvo : " + uvo);
		System.out.println(">> QnaWrite 입력 도착, mvo : " + mvo);		
		
		memberBoardService.insertBoard(mvo);						
		
		return "/memberBoard/getMyQBoardList.do"; // 이동
	}
	
	// 수정폼으로 이동
	@GetMapping("/qnaModifyForm.do")
	public String toModifyForm(MemberBoardVO bvo, Model model) {
		System.out.println(">>> qna 수정폼 이동");	
		
		// vo 받아서 한개 가져오고 세션에 등록
		bvo = memberBoardService.getBoard(bvo);
		model.addAttribute("callBvo", bvo);
		
		System.out.println(">> 검색후 callBvo : "+ bvo);		
		
		return "/Member/MemberBoard/myQModifyForm.jsp"; // 이동
	}
	
	// 수정
	@PostMapping("/qnaModifyForm.do")
	public String QnaModify(MemberBoardVO mvo, HttpSession session) {
		
		UserVO uvo = (UserVO) session.getAttribute("user");
		mvo.setUserId(uvo.getUserId());
		mvo.setGrade(uvo.getGrade());
		
		System.out.println(">> Qna수정 입력 도착, uvo : " + uvo);
		System.out.println(">> Qna수정 입력 도착, mvo : " + mvo);		
		
		memberBoardService.updateBoard(mvo);
		
		return "/memberBoard/getMyQBoardList.do"; // 이동
	}
	
	
	@GetMapping("/viewPage.do")
	public String viewPage(MemberBoardVO bvo, Model model) {
		System.out.println(">>> 보드 상세페이지로 이동 : " + bvo);
		
		// vo 받아서 한개 가져오고 세션에 등록
		bvo = memberBoardService.getBoard(bvo);
		model.addAttribute("callBvo", bvo);
		
		System.out.println(">> 검색후 callBvo : "+ bvo);
				
		return "/Member/MemberBoard/myQBoard.jsp"; // 이동
	}
	
	// 삭제하기
	@RequestMapping("/deleteBoard.do")
	public String viewPage(MemberBoardVO bvo) {
		System.out.println(">>> 삭제하기 : " + bvo);
		
		memberBoardService.deleteBoard(bvo);
		
		return "/memberBoard/getMyQBoardList.do"; // 이동
	}
	
	
	
	
	
	
	
	

	
	
}
