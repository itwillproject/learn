package com.spring.learn.view;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.spring.learn.board.BoardCommentVO;
import com.spring.learn.board.BoardService;
import com.spring.learn.board.BoardVO;
import com.spring.learn.common.Paging;
import com.spring.learn.user.UserService;
import com.spring.learn.user.UserVO;

@Controller					// 단 현재 위치(클래스)에서만 유효
@SessionAttributes({"board", "qnaBoardList"}) // board라는 이름의 Model객체가 있으면 세션에 저장
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	public BoardController() {
		System.out.println(">> BoardController() 생성");
	}
	
	
	
	
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		System.out.println(">>파일 업로드 도착");
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/learn/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	
	@RequestMapping("/getQnaBoardList.do")
	public String getQnaBoardList(BoardVO bvo, Model model, Paging p, HttpSession session) {
		System.out.println(">>> qna보드리스트 가져오기");		
		
		Map<String, Object> QnaBoardListAj = getQnaBoardListCommon(bvo, model, p);
		
		return "/Community/qna/qnaBoardList.jsp"; // 이동
	}
	
	@RequestMapping("/getQnaBoardListAj.do")
	@ResponseBody
	public Map<String, Object> getQnaBoardListAj(BoardVO bvo, Model model, Paging p, HttpSession session) {
		System.out.println(">>> qna보드리스트 가져오기");		
		
		Map<String, Object> QnaBoardListAj = getQnaBoardListCommon(bvo, model, p);
		
		return QnaBoardListAj; // 이동
	}



	public Map<String, Object> getQnaBoardListCommon(BoardVO bvo, Model model, Paging p) {
		System.out.println("bvo : " + bvo);
		model.addAttribute("board", bvo);
		
		
		if (bvo.getBoardAdopt() == null) {
			bvo.setBoardAdopt("all");
		} else if (bvo.getBoardAdopt().equals("미해결")) {
			bvo.setBoardAdopt("FALSE");
		} else if (bvo.getBoardAdopt().equals("해결됨")) {
			bvo.setBoardAdopt("TRUE");
		} else {
			bvo.setBoardAdopt("all");
		}
		
		if (bvo.getOrdering() == null) {
			bvo.setOrdering("BOARD_REGDATE");
		} else if (bvo.getOrdering().equals("답변많은순")) {
			bvo.setOrdering("COMMENT_CNT");
		}else if (bvo.getOrdering().equals("좋아요순")) {
			bvo.setOrdering("BOARD_LIKE");
		}else {
			bvo.setOrdering("BOARD_REGDATE");
		}
		
		
		// 전체 페이지 수 구하기 - 이게 유저 아이디로 찾아야함 - > 일반 게시판에서는 조건으로 바꿔야함 , 검색 키워드와 유저아이디로
		p.setTotalRecord(boardService.countQnaBoard(bvo));
		
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
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchKeyword", bvo.getSearchKeyword());
		map.put("begin", Integer.toString(p.getBegin()));
		map.put("end", Integer.toString(p.getEnd()));
		map.put("ordering", bvo.getOrdering());
		map.put("boardAdopt", bvo.getBoardAdopt());
		
		System.out.println(">>>>> map : " + map);
		
		// 리스트 가져오기
		List<BoardVO> qnaBoardList = boardService.getQnaBoardList(map); // 조회하고
		
		System.out.println("qnaBoardList------ : "+qnaBoardList);
		
		for(BoardVO board : qnaBoardList) {
			
			String getId = board.getUserId();
			
			UserVO vo = new UserVO();
			vo.setUserId(getId);
			
			vo = userService.confirmUser(vo);
			String setName = vo.getUserName();
			board.setUserName(setName);
		}

		// 리스트 모델에 저장
		if (qnaBoardList != null) {
			model.addAttribute("qnaBoardList", qnaBoardList); // 값 저장하고
			model.addAttribute("pvo", p);
		}		
		
		System.out.println("qnaBoardList : " + qnaBoardList);
			
		Map<String, Object> QnaBoardListAj = new HashMap<String, Object>();
		QnaBoardListAj.put("qnaBoardList", qnaBoardList);
		QnaBoardListAj.put("pvo", p);
		
		System.out.println("QnaBoardListAj : " + QnaBoardListAj);
		return QnaBoardListAj;
	}
	
	
	
	
	@GetMapping("/qnaWriteForm.do")
	public String toQnaWriteForm(BoardVO vo) {
		System.out.println(">>> qna작성폼 이동");						
				
		return "redirect:/Community/qna/qnaWriteForm.jsp"; // 이동
	}
	
	// 입력
	@PostMapping("/boardWrite.do")
	public String QnaWrite(BoardVO bvo, HttpSession session) {
		
		UserVO uvo = (UserVO) session.getAttribute("user");
		
		if(uvo == null) {
			return "/Member/login.do";
		}
		
		bvo.setUserId(uvo.getUserId());
		bvo.setGrade(uvo.getGrade());
		
		System.out.println(">> boardWrite 입력 도착, uvo : " + uvo);
		System.out.println(">> boardWrite 입력 도착, bvo : " + bvo);
		
		if (bvo.getQboardNo() != null) {
			
			boardService.insertQnaBoard(bvo);						
			
//			return "/Community/qna/qnaBoardList.jsp"; // 이동
			return "/board/getQnaBoardList.do"; // 이동
		}
		
		if (bvo.getFboardNo() != null) {
			
			boardService.insertFreeBoard(bvo);						
			
			return "/Community/qna/FreeBoardList.jsp"; // 이동
		}
		
		
		
		return "/Member/login.do";
		
	}
	
	
	
	
	@RequestMapping("/viewQnaPage")
	public String viewQnaPage(BoardVO bvo, Model model) {
		System.out.println(">>> 보드 상세페이지로 이동 : " + bvo);
		
		// vo 받아서 한개 가져오고 세션에 등록
		bvo = boardService.getBoard(bvo);
		bvo.setBoardHit(Integer.toString((Integer.parseInt(bvo.getBoardHit())+1)));
		boardService.updateBoard(bvo);
		
		
		String getName = bvo.getUserId();
		UserVO vo = new UserVO();
		vo.setUserId(getName);
		vo = userService.confirmUser(vo);
		String setName = vo.getUserName();
		bvo.setUserName(setName);
		
		
		model.addAttribute("board", bvo);
		
		System.out.println(">> 검색후 bvo : "+ bvo);
		
		// 커멘트 가져오기
		List<BoardCommentVO> cvoList = boardService.getComment(bvo);
		
		model.addAttribute("cvoList", cvoList);
		
		System.out.println(">>>>> cvoList : " + cvoList);
				
		return "/Community/qna/qnaBoard.jsp"; // 이동
	}
	
	
	
	// 삭제하기
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO bvo) {
		System.out.println(">>> 삭제하기 : " + bvo);
		
		boardService.deleteBoard(bvo);
		
		return "/board/getQnaBoardList.do"; // 이동
	}
	
	
	
	// 수정폼으로 이동
	@GetMapping("/boardModify.do")
	public String toModifyForm(BoardVO bvo, Model model) {
		System.out.println(">>> 수정폼 이동");	
		
		// vo 받아서 한개 가져오고 세션에 등록.
		bvo = boardService.getBoard(bvo);
		
		model.addAttribute("board", bvo);
		
		
		if (bvo.getFboardNo() != null) {
			
		}
		
		if (bvo.getQboardNo() != null) {
			return "/Community/qna/qnaModifyForm.jsp"; // 이동
		}
		
		return "/Member/login.do";
	}
	
	// 수정
	@PostMapping("/boardModify.do")
	public String QnaModify(BoardVO bvo, HttpSession session) {
		
		UserVO uvo = (UserVO) session.getAttribute("user");
		
		if(uvo == null) {
			return "/Member/login.do";
		}
		
		bvo.setUserId(uvo.getUserId());
		bvo.setGrade(uvo.getGrade());
		
		System.out.println(">> 수정 입력 도착, uvo : " + uvo);
		System.out.println(">> 수정 입력 도착, bvo : " + bvo);		
		
		boardService.updateBoard(bvo);
		
		return "/board/viewQnaPage.do"; // 이동
		
	}
	
	
	
	
	
	
	
	
	
	

	
	
}
