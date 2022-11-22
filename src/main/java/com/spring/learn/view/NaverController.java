package com.spring.learn.view;

import com.spring.learn.user.UserService;
import com.spring.learn.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/Member")
@RestController
public class NaverController {

  @Autowired
  private UserService userService;

  @RequestMapping("/naverLogin.do")
  public UserVO naverLogin(@RequestBody UserVO vo) {
    System.out.println(">>> 네이버 로그인");
    String userBirth = vo.getUserBirth();
    vo.setUserBirth(userBirth.substring(0, 6) + userBirth.substring(7));

    System.out.println("vo : " + vo);
    UserVO user = userService.confirmUser(vo);
    if(user == null) {
      userService.insertUser(vo);
    }
    user = vo;
    System.out.println("user : " + user);

    return user;

  }
}
