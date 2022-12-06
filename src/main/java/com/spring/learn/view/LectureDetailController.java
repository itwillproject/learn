package com.spring.learn.view;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.learn.lecture.ClassVO;
import com.spring.learn.lecture.LectureCommentVO;
import com.spring.learn.lecture.LectureDetailService;
import com.spring.learn.lecture.LectureVO;
import com.spring.learn.lecture.OfftimetableVO;
import com.spring.learn.order.OrderCartVO;
import com.spring.learn.user.UserVO;

@RequestMapping({"/Common", "/Member"})
@Controller
public class LectureDetailController {
	
	@Autowired
	private LectureDetailService lectureDetailService;
	
	//강의를 눌렀을때 자세한 정보들 가져오면서 여러가지 체크요소들 확인
	@RequestMapping("/getLecture.do") 
	public String getLectureDetail(LectureVO vo, Model model, HttpSession session) {
		LectureVO lecture = lectureDetailService.getLectureDetail(vo);
		model.addAttribute("lecture",lecture); 
		getLectureLike(vo, model); 
		checkLecturer(model, session, lecture.getUserId());
		checkLike(vo.getLectureNo() ,model, session);
		System.out.println(lectureDetailService.getLectureDetail(vo));
		
		LectureCommentVO count = new LectureCommentVO();
		count.setLectureNo(Integer.parseInt(vo.getLectureNo()));
		System.out.println(count);
		count = lectureDetailService.getCounts(count);
		System.out.println(count);
		model.addAttribute("count",count );
		System.out.println("온라인? 오프라인? : " + lecture.getLectureOnOff());
		
		//온라인 수업인 경우
		if (lecture.getLectureOnOff().equals("0")) {
			System.out.println("온라인");
			getClasses(vo.getLectureNo(), model);
		} else if (lecture.getLectureOnOff().equals("1")) {
			System.out.println("오프라인");
			getTimetables(vo.getLectureNo(), model);
		}
		
//		return "/Lecture/lectureDetail.jsp";
		return "/Lecture/lectureDetail-prac.jsp";
		
	}
	//해당 강의의 좋아요수 확인
	public void getLectureLike(LectureVO vo, Model model) {
		System.out.println("getLectureLike()");
		model.addAttribute("lectureLike",lectureDetailService.getLectureLike(vo)); 
		System.out.println(lectureDetailService.getLectureLike(vo));
		
	}
	//로그인한 유저의 좋아요 여부 확인
	public void checkLike(String lectureNo, Model model, HttpSession session) {
		System.out.println("checkLike()");
		UserVO vo =(UserVO) session.getAttribute("user");
		HashMap<String, String> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("userId", vo.getUserId());
		System.out.println(map);
		
		model.addAttribute("checkLike",lectureDetailService.checkLike(map)); 
//		System.out.println("checkLike : " + lectureDetailService.checkLike(map));
		
	}
	
	//로그인한 유저가 해당강의의 강의자인지 확인
	public void checkLecturer(Model model, HttpSession session, String lecturerId ) {
		UserVO vo = (UserVO) session.getAttribute("user");
		String userId = vo.getUserId();
		
		//로그인한 유저아이디와 해당강의 아이디가 같은경우 
		if (userId.equals(lecturerId)){
			model.addAttribute("lecturer", "lecturer");
		} else {
			model.addAttribute("lecturer", "student");			
		}
		
	}
	
	//온라인 강의의 경우에 클래스들 정보 가져오기
	public void getClasses(String lectureNo, Model model) {
		List<ClassVO> list = lectureDetailService.getClasses(lectureNo);
		System.out.println("getClasses() : " + list);
		model.addAttribute("classes", list);
		
	}
	
	//오프라인 강의의 경우 시간표 정보들 가져오기
	public void getTimetables(String lectureNo, Model model) {
		List<OfftimetableVO> list = lectureDetailService.getTimetables(lectureNo);
		System.out.println("getTimetables() : " + list);
		model.addAttribute("timetables", list);
		System.out.println(list);
	}
	
	//장바구니에 추가
	@RequestMapping("/insertCart.do")
	public String insertCart(String lectureNo, HttpSession session, String timetableNo) {
		System.out.println("카트에 추가~ 카트로 이동");
		UserVO user = (UserVO) session.getAttribute("user");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", user.getUserId());
		map.put("lectureNo", lectureNo);
		map.put("timetableNo", timetableNo);
		System.out.println(map);
		lectureDetailService.insertCart(map);
		
		
		return "myCartGo.do?userId=" + user.getUserId();
	}
	
}
