package com.spring.learn.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping({"/", "/Common", "/Member"})
@Controller
public class FileController {
	
	@RequestMapping("/download.do")
	public void download(HttpServletResponse response, String item, String filename) throws Exception {
        try {
        	
        	System.out.println("hihi");
        	String path = "\\\\192.168.18.11\\temp\\" + item;
//        	String path = "F:\\uploadFile\\jarzip.PNG"; // 경로에 접근할 때 역슬래시('\') 사용
        	
        	File file = new File(path);
        	
        	response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";"); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
        	System.out.println("getName() : " + file.getName());
        	
        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
        	OutputStream out = response.getOutputStream();
        	
        	int read = 0;
                byte[] buffer = new byte[1024];
                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
                    out.write(buffer, 0, read);
                }
                
        } catch (Exception e) {
        	System.out.println("hierror");
            throw new Exception("download error");
        }
    }
}
