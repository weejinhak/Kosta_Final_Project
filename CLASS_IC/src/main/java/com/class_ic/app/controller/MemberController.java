/*
* @FileName		:	MemberController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
*/
package com.class_ic.app.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.app.dao.AttendDAO;
import com.class_ic.app.dto.LoginDTO;
import com.class_ic.dao.LectureAddDAO;
import com.class_ic.dao.MemberDAO;
import com.class_ic.vo.MemberDTO;

/*
* @Class: MemberController
* @Date: 2017.06. 16.
* @Author: 위진학
* @Desc: 안드로이드 로그인과 QR출석을 DB에 넣기 위해 dao와 접촉
*/
@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	/*
	@description : app에서 ID와 비번 일치여부를 검사시켜 json형태로 Return.
	*/
	@RequestMapping("/applogin")
	@ResponseBody
	public LoginDTO LogIn(@RequestParam("id") String email, @RequestParam("pw") String rawPassword, Principal principal, HttpSession session) {
		
		
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO member = member_dao.login(email);
		String encodedPassword = member.getPwd();
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
		LoginDTO ld = new LoginDTO();
		AttendDAO attendDao= sqlsession.getMapper(AttendDAO.class);
		ld.setCount(attendDao.login(email));
		
		//처리
		if(result){
			return ld;
		}else{
			return ld;
		}		
	
	}

	/*
	@description : app에서 QR_Code 의 값들을 받아와 DB에 저장.
	*/
	@RequestMapping("/attendance")
	@ResponseBody
	public void memberAttendance(HttpServletRequest request) throws Exception {
		
		AttendDAO memberDao = sqlsession.getMapper(AttendDAO.class);
		LectureAddDAO lecDao= sqlsession.getMapper(LectureAddDAO.class);
		
		String state=request.getParameter("state");
		String email=request.getParameter("email");
		String time=request.getParameter("time");
		String classCode=request.getParameter("qr");
		
		lecDao.inputMyClassCode(email,classCode);
		
		//입실일 경우
		if(state.equals("inClass")){			
			memberDao.attendanceMember(email,time,state);
		}
		//퇴실일 경우
		else{
			memberDao.attendanceMember(email,time,state);
		}	
		
	}

}
