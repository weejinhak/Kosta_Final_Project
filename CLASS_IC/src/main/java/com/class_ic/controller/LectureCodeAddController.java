/*
* @FileName		:	LectureCodeAddController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.18
* @Author		:	위진학
*/
package com.class_ic.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.LectureCodeAddService;
import com.class_ic.vo.LectureDTO;

/*
* @Class: LectureCodeAddController
* @Date: 2017.06. 18.
* @Author: 위진학
* @Desc: 강사가 기수 추가시 동작하는 Controller
*/
@Controller
@RequestMapping("common")
public class LectureCodeAddController {

	@Autowired
	private LectureCodeAddService lecturecodeaddservice;
	
	/*
	@description : 강사가 입력하는 input을 parameter로 받아 service로 넘김.
	*/
	@RequestMapping(value = "lecturecodeadd.htm", method = RequestMethod.POST)
	public String lectureinsert(HttpServletRequest request,Model model){
		
		String classstart = request.getParameter("classstart");
		String classend= request.getParameter("classend");
		SimpleDateFormat simpledataformat = new SimpleDateFormat("yyyy-mm-dd");
		
		LectureDTO lectureDto = new LectureDTO();	
		String viewpage="";
		try {
			java.util.Date startdate=simpledataformat.parse(classstart);
			java.util.Date enddate = simpledataformat.parse(classend);			
			Date start = new Date(startdate.getTime());
			Date end = new Date(enddate.getTime());
			
			lectureDto.setClassCode(request.getParameter("classcode"));
			lectureDto.setClassTitle(request.getParameter("classtitle"));
			lectureDto.setClassStart(start);
			lectureDto.setClassEnd(end);
			lectureDto.setClassOpenTime(request.getParameter("classopentime"));
			lectureDto.setClassCloseTime(request.getParameter("classclosetime"));
			lectureDto.setEmail(request.getParameter("email"));
			
			try {
				viewpage=lecturecodeaddservice.addclasscode(lectureDto);
				List<LectureDTO> lecturelist=lecturecodeaddservice.lecturelistselect(request.getParameter("email"));	
				System.out.println(lecturelist.size());
				model.addAttribute("lecturelist", lecturelist); 			
			} catch (Exception e) {
				System.out.println("insert가 안되는 경우");
				e.printStackTrace();
			}
			
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return viewpage; 		
	}
	
	/*
	@description : 페이지 로드시 QR코드를 불러내기 위한 URL
	*/
	@RequestMapping("/createCode.htm")
    public ModelAndView createCode(@RequestParam String content){
		//ModelAndView 바로 리턴 
		return new ModelAndView("qrcodeview", "content", content);
	}
	
	/*
	@description : 페이지 로드시 email에 맞는 기수를 가져오기 위한 함수
	*/
	@RequestMapping(value ="lecturecodeSelect.htm", method = RequestMethod.POST)
	public String lectureSelect(HttpSession session,Model model){
		try {
			String email=(String)session.getAttribute("email");
			List<LectureDTO> lecturelist=lecturecodeaddservice.lecturelistselect(email);	
			model.addAttribute("lecturelist", lecturelist); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return "common/lectureList";
	}
	
	@RequestMapping(value ="lecturecodeSelectST.htm", method = RequestMethod.POST)
	public String lectureSelectStudent(@RequestParam String email,Model model){
		try {

			List<LectureDTO> lecturelistStudent=lecturecodeaddservice.lecturelistselectStudent(email);	
			model.addAttribute("lecturelist", lecturelistStudent); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return "common/lectureListStudent";
	}

}
