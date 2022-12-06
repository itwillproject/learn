package com.spring.learn.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;

import com.spring.learn.lecture.LectureVO;
import com.spring.learn.user.LikeVO;
import com.spring.learn.user.MailSendService;
import com.spring.learn.user.UserService;
import com.spring.learn.user.UserVO;

// @RequestMapping 클래스 선언부 사용시
// 모든 메소드 요청경로의 부모(root) 경로로 추가됨
@RequestMapping({"/Member", "/member"})
@Controller
public class UserController {
	@Autowired
	private MailSendService mailService;
	@Autowired
	private UserService userService;
	
	// 멤버 디테일로 이동
	@RequestMapping("/memberDetail.do")
	public String memberDetail(UserVO uvo, Model model) {
			System.out.println(">>> 멤버디테일 페이지로 이동  입력 lvo :" + uvo);
			
			// 유저아이디로  찾아서 uvo를 (유저디테일이란 이름으로) 보내야 한다
			uvo = userService.confirmUser(uvo);
			model.addAttribute("userDetail", uvo);
			
			// 유저아이디로 강의목록 보내야 한다
			
			// 유저아이디로 수강후기 보내야 한다 - 두렬씨랑 나중에 이야기 하기
			
			// 유저아이디로 게시글 목록 보내야 한다
			
			// 유저에 자기 소개 파트 넣어야 한다 - 컬럼 추가 -> VO 추가?? 이건 나중에 생각하기 / 문제 생김 - 인서트에 올 넣는 경우 있어서, 컬럼 추가가 문제 된다고 함... 이거 어떻게?
			
			
			
			
			return "/Member/Detail/merberDetail.jsp";
	}
	
	
	
	
	
	
	
	
	

	@RequestMapping("/insertUser.do")
	public String insertUser(@ModelAttribute UserVO vo) {
		System.out.println(">>> 회원가입");
		System.out.println("vo : " + vo);

		userService.insertUser(vo);

		System.out.println(">> 회원가입 성공!!!");
		
		return "/Common/index.jsp";
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
		int cnt = 0;
		UserVO vo2 = userService.getUser(vo);
		System.out.println("vo2: "+vo2);
		if(vo2 != null) {
			cnt = 1;
			return cnt;
		}else {
			cnt = 0;
			return cnt;
		}
	}
	
	//현재 Id 체크
	@RequestMapping("/insertIdCheck.do")
	@ResponseBody
	public int insertIdCheck(UserVO vo) {
		System.out.println("아이디 체크 요청이 들어옴!");
		System.out.println("vo : " + vo);
		
		int cnt = userService.getUserId(vo);
		System.out.println("cnt : " + cnt);
		
		return cnt;
	}
	
	//로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST) // 4.3버전 부터 사용가능
	public String login(HttpServletRequest request, UserVO vo){
		System.out.println(">>> 로그인 처리임"); System.out.println("vo : " + vo);
		
		UserVO user = userService.getUser(vo);
			 
		String str = null;
			 
		//3. 화면 네비게이션(화면전환, 화면이동) // 로그인 성공 : 게시글 목록 보여주기 // 로그인 실패 : 로그인 화면으로 이동
		if (user != null) {
			System.out.println(">> 로그인 성공!!!");
			HttpSession session = request.getSession();
			UserVO vo2 = userService.getUser(vo);
			session.setAttribute("user", vo2);
			if (vo2.getGrade().equals("관리자")) {
				str = "/Admin/adminIndex.jsp"; //회원등급이 관리자일 경우 관리자 페이지로 전환
				} else { 
					str = "/Common/index.jsp";
				}
			} else {
				System.out.println(">> 로그인 실패~~~");
				}
			return str;
		}
	
	 /*
	 //로그인 처리
	 @RequestMapping(value = "/login.do", method = RequestMethod.POST) // 4.3버전 부터 사용가능
	 public String login(HttpServletRequest request, UserVO vo){
		 System.out.println(">>> 로그인 처리임"); System.out.println("vo : " + vo);
	
		 UserVO user = userService.getUser(vo);
		 
		 //3. 화면 네비게이션(화면전환, 화면이동) // 로그인 성공 : 게시글 목록 보여주기 // 로그인 실패 : 로그인 화면으로 이동
		 if (user != null) {
			 System.out.println(">> 로그인 성공!!!");
			 HttpSession session = request.getSession();
			 UserVO vo2 = userService.getUser(vo);
			 session.setAttribute("user", vo2);
			 } 
		 else {
			 
			 System.out.println(">> 로그인 실패~~~");
			 
			 
			 }
		 return "/Common/index.jsp";
	 }
	 */

	 /*
	  * @RequestMapping(value = "/login.do", method = RequestMethod.GET) // 4.3버전 부터 사용가능 
	 public String loginView(@ModelAttribute("user") UserVO vo, Model model) {
		 System.out.println(">>> 로그인 화면 이동 - loginView()");

		 return "/Member/login.jsp";
	 }
	  * */
	  
	  @RequestMapping("/logout.do") public String logout(HttpSession session) {
		  System.out.println(">> 로그아웃 처리"); session.invalidate();
		  return "/Common/index.jsp";
	  }
	  
	//현재 Id 체크
	@RequestMapping("modifyUser.do")
	public String modifyUser(HttpServletRequest request, UserVO vo) {
		System.out.println("아이디 수정 요청이 들어옴!");
		System.out.println("vo : " + vo);
		
		int c = userService.modifyUser(vo);
		System.out.println(c);
		 HttpSession session = request.getSession();
		 UserVO vo2 = userService.getUser(vo);
		 session.setAttribute("user", vo2);
		
		return "myPage.jsp";
	}
	
	
	@RequestMapping("/changePasswordPage.do")
	public String moveToChangePage (HttpSession session) {
		System.out.println("==== skController moveToChangePage() 실행 ====");
		String userId = ((UserVO)session.getAttribute("vo")).getUserId();
		System.out.println("userId: " + userId);		
		return "/Member/changePassword.jsp";
	}
	
	
	@RequestMapping("/changePassword.do")
	public String changePassword (@ModelAttribute UserVO user, HttpSession session) {
		System.out.println("==== skController changePassword() 실행 ====");
		//System.out.println("userId: " + ((UserVO)session.getAttribute("user")).getUserId());		
		String userId = ((UserVO)session.getAttribute("vo")).getUserId();
		//user.setUserId(userId);
		user.setUserId(userId);
		System.out.println("세션 데이터 삭제 전 " + session.getAttribute("vo"));
		
		userService.changePwd(user);
		
		System.out.println("userPassword: " + user.getUserPwd());		
		
		session.removeAttribute("vo");
		System.out.println(session.getAttribute("vo"));
		return "/Member/changePasswordOK.jsp";
	}
	
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser (HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		System.out.println("삭제 전 user: " + user);
		userService.deleteUser(user);
		return "/Common/index.jsp";
	}
	
	@RequestMapping("/likeGo.do")
	public String likeGo (LikeVO vo, Model model) {
		System.out.println(">>>likeGo() 실행");
		System.out.println("LikeVO vo : " + vo);
		List<LikeVO> likeList = userService.getLikeList(vo);
		System.out.println("likeList : >>>" + likeList);
		for(LikeVO cvo : likeList) {
			int a = 0;//별점 사람 수 용
			int b = 0;//별점 평균 용
			int c = 0;//주문한 상품인지 아닌지 체크 용
			a = userService.getReviewCnt(cvo);
			b = userService.getReviewRate(cvo);
			c = userService.getOrderCh(cvo);
			if (c == 0) {
				cvo.setOrderCh(c);				
			} else {
				cvo.setOrderCh(1);
			}
			cvo.setReviewCnt(a);//리뷰에 참가한 사람 수
			cvo.setReviewRate(b);// 리뷰에 별점 평균
			cvo.setReviewAverage();
			cvo.setLectureSalePrice();//세일되서 총금액
			cvo.setRealSalePrice();//세일 되는 금액
			System.out.println("cvo : "+cvo);
		}
		
		model.addAttribute("likeList", likeList);
		System.out.println(likeList);
		
		return "/Member/myLike.jsp";
	}
	//좋아요 추가
	@RequestMapping("/insertLike.do")
	@ResponseBody
	public int insertLike(LikeVO vo) {
		System.out.println("insertLike 좋아요 추가!");
		System.out.println("vo : " + vo);
		int cnt = 1;
		userService.insertLike(vo);
		System.out.println("cnt : " + cnt);
		
		return cnt;
	}
	//좋아요 삭제
	@RequestMapping("/deleteLike.do")
	@ResponseBody
	public int deleteLike(LikeVO vo) {
		System.out.println("deleteLike 좋아요 삭제!");
		System.out.println("vo : " + vo);
		int cnt = 1;
		userService.deleteLike(vo);
		System.out.println("cnt : " + cnt);
		
		return cnt;
	}
	
	//좋아요 삭제
	@RequestMapping("/searchLike.do")
	@ResponseBody
	public List<LikeVO> searchLike(LikeVO vo) {
		System.out.println("searchLike 검색요청이 들어왔어요~!");
		System.out.println("vo : " + vo);
		//System.out.println("list : " + list);
		String searchStatus = vo.getSearchStatus();//유료 무료 전체 체크
		String searchOrder = vo.getSearchOrder();//정렬 기준 선택
		List<LikeVO> list = new ArrayList<LikeVO>();
		/////
		List<LikeVO> likeList = userService.getLikeList(vo);
		for(LikeVO cvo : likeList) {
			int a = 0;//별점 사람 수 용
			int b = 0;//별점 평균 용
			int c = 0;//주문한 상품인지 아닌지 체크 용
			a = userService.getReviewCnt(cvo);
			b = userService.getReviewRate(cvo);
			c = userService.getOrderCh(cvo);
			if (c == 0) {
				cvo.setOrderCh(c);				
			} else {
				cvo.setOrderCh(1);
			}
			cvo.setReviewCnt(a);//리뷰에 참가한 사람 수
			cvo.setReviewRate(b);// 리뷰에 별점 평균
			cvo.setReviewAverage();
			cvo.setLectureSalePrice();//세일되서 총금액
			cvo.setRealSalePrice();//세일 되는 금액
		}
		/////list = list.stream().sorted(Comparator.comparing(Student::getMath)).collect(Collectors.toList());
		if (searchOrder.equalsIgnoreCase("reviewAverage")) {
			System.out.println(">>>likeList : "+likeList);
			for(LikeVO cvo : likeList) {
				double v = userService.getReviewAverage(cvo);
				int test = (int)(v*10);
				cvo.setReviewSearchAverage(test);
				System.out.println(cvo.getReviewSearchAverage());
			}
			System.out.println("여기까지는 오는거지?");
			likeList = likeList.stream().sorted(Comparator.comparing(LikeVO::getReviewSearchAverage).reversed()).collect(Collectors.toList());
			System.out.println(">>>이게 진짜 된다고? likeList!!!!"+likeList);
			if(searchStatus.equals("전체")) {
				System.out.println("전체 검색");
				return likeList;
			} else if(searchStatus.equals("유료")) {
				for (int i = 0; i < likeList.size(); i++) {
					if(likeList.get(i).getLecturePrice() > 0) {
						list.add(likeList.get(i));
					}
				}
				return list;
			} else if(searchStatus.equals("무료")) {
				for (int i = 0; i < likeList.size(); i++) {
					if(likeList.get(i).getLecturePrice() == 0) {
						list.add(likeList.get(i));
					}
				}
				return list;
			}
			
		}else {
			if(searchStatus.equals("전체")) {
				System.out.println("전체 검색");
				System.out.println("이값을 보내줍니다 vo : " + vo);
				list = userService.getSearchLikeList(vo);					
			} else if(searchStatus.equals("유료")) {
				System.out.println("유료 검색");
				list = userService.getSearchPaidLikeList(vo);
			} else if(searchStatus.equals("무료")) {
				list = userService.getSearchFreeLikeList(vo);
			}
			
			for(LikeVO cvo : list) {
				int a = 0;//별점 사람 수 용
				int b = 0;//별점 평균 용
				int c = 0;//주문한 상품인지 아닌지 체크 용
				a = userService.getReviewCnt(cvo);
				b = userService.getReviewRate(cvo);
				c = userService.getOrderCh(cvo);
				if (c == 0) {
					cvo.setOrderCh(c);				
				} else {
					cvo.setOrderCh(1);
				}
				cvo.setReviewCnt(a);//리뷰에 참가한 사람 수
				cvo.setReviewRate(b);// 리뷰에 별점 평균
				cvo.setReviewAverage();
				cvo.setLectureSalePrice();//세일되서 총금액
				cvo.setRealSalePrice();//세일 되는 금액
			}
		}
		
		System.out.println("리턴 전 list : " + list);
		
		
		return list;
	}
	
	//관리자페이지를 위한 추가 기능=========================
	@RequestMapping("/rejectResumeMail.do")
	@ResponseBody
	public String rejectResumeMail(String email) {
		System.out.println("수신 이메일 주소 : " + email);
		return mailService.rejectResumeMail(email);
	}

	@RequestMapping("/approveResumeMail.do")
	@ResponseBody
	public String approveResumeMail(String email) {
		System.out.println("수신 이메일 주소 : " + email);
		return mailService.approveResumeMail(email);
	}
	//==============================
	
}
