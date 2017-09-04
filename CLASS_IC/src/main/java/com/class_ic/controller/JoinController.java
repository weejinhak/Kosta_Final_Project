/*
* @FileName	:	JoinController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.JoinService;
import com.class_ic.vo.MemberDTO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinservice;
	
	//회원가입 폼
	@RequestMapping("join.htm")
	public String join(){
		
		return "join/joinus";
	}
	
	//회원가입 학생
	@RequestMapping("join_st.htm")
	public String joinStudent(MemberDTO member, HttpServletRequest request){
		System.out.println("학생가입 데이터 넘겨받음 이메일: " + member.getEmail());
		String viewpage = "";
		try{
			viewpage = joinservice.join(member, request);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return viewpage; 
	}
	
	//회원가입 선생
		@RequestMapping("join_te.htm")
		public String joinTeacher(MemberDTO member ,HttpServletRequest request){

			String viewpage = "";
			try{
				viewpage = joinservice.join(member, request);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			return viewpage; 
		}
	

}
