package com.spring.learn.view;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.learn.user.UserService;
import com.spring.learn.user.UserVO;


@RestController
@RequestMapping("/member")
public class SkUserAjaxController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSender sender;
	
	private int size;
	
	public SkUserAjaxController() {
		System.out.println("SkUserAjaxController() 실행");
	}


	@RequestMapping("/findUserIdList.do")
	public List<String> findUserIdList (@RequestBody UserVO user) {
		System.out.println("==== SkUserAjaxController findUserIdList() 실행 ====");
		
		System.out.println(user.getUserName());
		System.out.println(user.getUserBirth());
		
		List<String> findUserId = userService.findUserIdList(user);
		//System.out.println("findUserId: " + findUserId);
		return findUserId;
	}

	
	@RequestMapping("/findPassword.do")
	public List<String> findUserId (@RequestBody UserVO user) {
		System.out.println("==== SkUserAjaxController findUserId() 실행 ====");
		
		System.out.println(user.getUserId());
		
		List<String> data = new ArrayList<String>();
		
		String userId = userService.findUserId(user);
		
		if (userId != null) {
			MimeMessage message = sender.createMimeMessage();
			try {
				
			    
				message.setSubject("[아웃런] 비밀번호 변경 인증번호입니다.", "UTF-8");
				
				String htmlStr = "";
				String verifyNO = String.valueOf(getKey(6));
				System.out.println(verifyNO);
				htmlStr += "<h3>아웃런 비밀번호 재설정 인증 번호입니다</h3>";
				htmlStr += "<p>인증번호 "+verifyNO+"를 화면에 입력 후<br>";
				htmlStr += "비밀번호 변경 페이지로 이동합니다.<br>";
				htmlStr += "해당 인증번호는 전송 후 3 분 간 유효합니다.</p>";
				
				message.setText(htmlStr, "UTF-8", "html");
				
				message.addRecipient(RecipientType.TO, new InternetAddress(userId));
			
				sender.send(message);
				
				//메일 전송 후 verifyNo랑 시간까지 전송
				
				
				data.add(userId);
				data.add(verifyNO);

				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return data;
	}
	
    //인증키 생성
    private String getKey (int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode () {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;
        
        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }
        
        return buffer.toString();
    }
}
