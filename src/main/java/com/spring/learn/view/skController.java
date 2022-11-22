package com.spring.learn.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.learn.user.UserService;
import com.spring.learn.user.UserVO;

@RequestMapping("/member")
@Controller
public class skController {
	
	@Autowired
	private UserService userService;
	
	
	
	public skController() {
		super();
		System.out.println("skController() 실행");
	}

	@RequestMapping("/changePasswordPage.do")
	public String moveToChangePage (HttpSession session) {
		System.out.println("==== skController moveToChangePage() 실행 ====");
		String userId = ((UserVO)session.getAttribute("user")).getUserId();
		System.out.println("userId: " + userId);		
		return "/Member/changePassword.jsp";
	}
	
	
	@RequestMapping("/changePassword.do")
	public String changePassword (@ModelAttribute UserVO user, HttpSession session) {
		System.out.println("==== skController changePassword() 실행 ====");
		//System.out.println("userId: " + ((UserVO)session.getAttribute("user")).getUserId());		
		String userId = ((UserVO)session.getAttribute("user")).getUserId();
		//user.setUserId(userId);
		user.setUserId(userId);
		
		userService.changePwd(user);
		
		System.out.println("userPassword: " + user.getUserPwd());		
		
		return "/Member/changePasswordOK.jsp";
	}
	
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser (HttpSession session) {
		System.out.println("==== skController deleteUser() 실행 ====");
		//UserVO user = (UserVO)session.getAttribute("user");
		//System.out.println("userId: " + ((UserVO)session.getAttribute("user")).getUserId());		
		
		//연결 전이라 임의값
		UserVO user = new UserVO();
		user.setUserId("outputlearn.manager@gmail.com");
		
		userService.deleteUser(user);
		
		System.out.println("userPassword: " + user.getUserPwd());		
		
		return "/Member/index.jsp";
	}
}
