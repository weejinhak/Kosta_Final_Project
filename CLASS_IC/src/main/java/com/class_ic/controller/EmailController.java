/*
* @FileName		:	EmailController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.07.16
* @Author		:	위진학
*/
package com.class_ic.controller;

import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.dao.MailDAO;


/*
* @Class: EmailController
* @Date: 2017.07.16
* @Author: 위진학
* @Desc: 비밀번호 재설정을 위해 메일을 보내는 컨트롤러
*/
@Controller
public class EmailController {
	
	  @Autowired
	  private JavaMailSender mailSender;
	
	  @Autowired
      private SqlSession sqlsession;
	  
	  @Autowired
		private BCryptPasswordEncoder bCryptPasswordEncoder;

		
	  @RequestMapping(value = "sendEmail" , method =RequestMethod.GET)
	  public String mailSend(Model model,String email) {
		  
		  //임시로 값 줌
		  String code = Integer.toString((int)(Math.random()*100000));
		  
		  
          MailDAO maildao = sqlsession.getMapper(MailDAO.class);
		  //디비에 저장
          maildao.update_Rand(email,code);
		  
		  boolean chkBoolean = true;
		  
		  String link = "www.naver.com?email=hwan@naver.com"; //링크		  
	      String id = "5tulips";
	      String e_mail = "1231tjrghks@gmail.com";
	      String pw = "1004";
	      String setfrom  = " kolsun93@gmail.com";
	  	  String setfrompw  =  "whtjdah7";
	  	  String tomail  =  email;
	  	  String title   =  email+" 님의 비밀번호 안내입니다.";  //제목
	  	  String content = "인증코드 : "+code+"\n\n인증코드를 입력하여 비밀번호를 변경하세요♥"; //내용
	      
	  	  Properties p = new Properties();
	  	  
	      p.put("mail.smtp.host", "smtp.gmail.com");
	      p.put("mail.smtp.port", "587");
		  p.put("mail.smtp.username", setfrom); // Google계정@gmail.com으로 설정
		  p.put("mail.smtp.password", setfrompw); // Google계정@gmail.com으로 설정
		  
	      p.put("mail.transport.protocol", "true");     
	      p.put("mail.smtp.auth", "true");
	      p.put("mail.smtp.debug", "true");
		  p.put("mail.smtp.starttls.enable","true");
		  
	  
		  try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		      
		      messageHelper.setTo(email);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		     
		      mailSender.send(message);
		      
		    } catch(Exception e){
		      
		      e.getMessage() ;
		    }

		  return "join/searchPW";
	    }
	  
	  @RequestMapping(value = "updatePW" , method =RequestMethod.POST)
	  public String updatePW (String pwd,String email,String code) {
		  
          MailDAO maildao = sqlsession.getMapper(MailDAO.class);
          String enc_pwd = this.bCryptPasswordEncoder.encode(pwd);
		  maildao.update_Pw(enc_pwd,email,code);
		  
		  return "common/main";
		  
	  }
	  

}
