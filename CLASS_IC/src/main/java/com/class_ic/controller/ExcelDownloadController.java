/*
* @FileName	:	ExcelDownloadController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.30
* @Author		:	위진학
*/
package com.class_ic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.AttendanceListService;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.AttandanceListDTO;

@Controller
public class ExcelDownloadController {

	@Autowired
	private AttendanceListService attendanceListService;

	/*
	 * @description :엑셀로 학생출석을 다운로드
	 */
	@RequestMapping(value = "student/excelDownload.htm", method = RequestMethod.POST)
	public ModelAndView attendanceExcelByStudent(HttpServletRequest request) {
		String email=request.getParameter("email");
		String classcode=request.getParameter("classcode");
		List<AttandanceDTO> memberattendacnelist = attendanceListService.attendanceSelect(email, classcode);

		// ModelAndView 바로 리턴
		return new ModelAndView("studentExcelview", "memberattendacnelist", memberattendacnelist);
	}
	
	/*
	 * @description :강사가 학생을 골라 출석을 다운로드
	 */
	@RequestMapping(value = "teacher/excelDownload.htm", method = RequestMethod.POST)
	public ModelAndView attendanceExcelByTeacher(HttpSession session,HttpServletRequest request) {
		String tEmail=(String)session.getAttribute("email");
		String classCode=(String)session.getAttribute("classCode");
		String sEmail=request.getParameter("sEmail");
		List<AttandanceListDTO> memberattendacnelist = attendanceListService.selectStudentListByTeacher(tEmail,classCode,sEmail);
		
		// ModelAndView 바로 리턴
		return new ModelAndView("teacherExcelview", "memberattendacnelist", memberattendacnelist);
	}

}
