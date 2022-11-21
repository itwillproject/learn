package com.spring.learn.view;

<<<<<<< HEAD

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.learn.user.MailSendService;
import com.spring.learn.user.UserService;
import com.spring.learn.user.UserVO;

// @RequestMapping 클래스 선언부 사용시
// 모든 메소드 요청경로의 부모(root) 경로로 추가됨
@RequestMapping("/Member")
@Controller
public class UserController {
	@Autowired
	private MailSendService mailService;
	@Autowired
	private UserService userService;

	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) {
		System.out.println(">>> 회원가입");
		System.out.println("vo : " + vo);

		userService.insertUser(vo);

		System.out.println(">> 회원가입 성공!!!");
		return "index.jsp";

	}
	//이메일인증
	@RequestMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
	//현재 비밀번호 체크
	@RequestMapping("/pwdCheck.do")
	@ResponseBody
	public int pwdCheck(UserVO vo) {
		System.out.println("비밀번호 체크 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + vo);
		int cnt = 0;
		UserVO vo2 = userService.getUser(vo);
		if(vo2.getUserId().isEmpty()) {
			cnt = 0;
		}else {
			cnt = 1;
		}
		return cnt;
	}
	
		
		
	/*
	 * @RequestMapping : 요청과 처리(Controller) 연결(HandlerMapping 역할 대체) Command 객체 사용 :
	 * 파라미터로 전달되는 값을 Command 객체에 설정 1. UserVO 타입 객체 생성 2. UserVO 타입 객체에 전달받은 파라미터 값을
	 * 설정(이름 일치하는 경우) 3. UserVO 타입 객체를 메소드의 파라미터 값으로 전달
	 */
	// @RequestMapping(value = "/login.do", method = RequestMethod.POST)

	
	 @PostMapping("/login.do") // 4.3버전 부터 사용가능
	 public String login(UserVO vo){
	 System.out.println(">>> 로그인 처리ㅁ"); System.out.println("vo : " + vo);
	 
	 //예외발생 if (vo.getuser_id() == null || vo.getuser_id().equals("")) { throw new
	 //IllegalArgumentException("아이디 반드시 입력되어야 합니다."); }
	 
	 UserVO user = userService.getUser(vo);
	 
	 //3. 화면 네비게이션(화면전환, 화면이동) // 로그인 성공 : 게시글 목록 보여주기 // 로그인 실패 : 로그인 화면으로 이동
	 if (user != null) { System.out.println(">> 로그인 성공!!!"); return
	 "redirect:/board/getBoardList.do"; } else {
	 System.out.println(">> 로그인 실패~~~"); return "redirect:/user/login.do"; } }
	 
	 //@ModelAttribute : 모델(Model)의 속성값으로 저장(속성명 별도 지정) 별도로 명칭부여 안하면 <데이터타입>의 첫글자
	 // 소문자로 작성된 명칭 사용
	  
	 // @ModelAttribute UserVO ----> 속성명 userVO 명칭 사용
	  
	 // @ModelAttribute("user") UserVO ----> 속성명 user 사용
	  
	  //@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	  
	  @GetMapping("/login.do") // 4.3버전 부터 사용가능 
	  public String loginView(@ModelAttribute("user") UserVO vo) {
	  System.out.println(">>> 로그인 화면 이동 - loginView()");
	  
//	  vo.setId("test"); vo.setPassword("test");
	  
	  
	  return "user/login"; }
	  
	  @RequestMapping("/logout.do") public String logout(HttpSession session) {
	  System.out.println(">> 로그아웃 처리"); session.invalidate();
	  return "user/login";
	  }
	  
	 

}
