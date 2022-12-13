/*
 * package com.spring.learn.echo;
 * 
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * import com.spring.learn.user.UserVO;
 * 
 * @Controller
 * 
 * @RequestMapping public class EchoController { private static Logger logger =
 * LoggerFactory.getLogger(EchoHandler.class);
 * 
 * @GetMapping("/echo") public void echo(UserVO vo, Model model) {
 * System.out.println("2번째 EchoHandler() 실행:::");
 * System.out.println("2번째 EchoHandler() 실행::: vo : " + vo);
 * logger.info("==================================");
 * logger.info("@ChatController, GET Chat / Username : " + vo.getUserName());
 * 
 * model.addAttribute("userid", vo.getUserName()); }
 * 
 * }
 */