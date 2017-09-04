package com.class_ic.controller_category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.BoardListService;
import com.class_ic.service_category.MainService_Student;
import com.class_ic.service_category.MainService_Teacher;

@Controller
@RequestMapping("student")
public class MainController_Student {
   @Autowired
   private BoardListService boardlistservice;

	@Autowired	
	private MainService_Student mainteacherservice;	   

   @RequestMapping(value = "main.htm", method = RequestMethod.POST)
   public String student(HttpSession session, String classCode) {
      session.setAttribute("classCode", classCode);

      return "student.student_main";
   }

   // student main POST
   @RequestMapping(value = "main.htm", method = RequestMethod.GET)
   public String student() {

      return "student.student_main";
   }

   // student memo
   @RequestMapping(value = "memo.htm", method = RequestMethod.GET)
   public String studentMemo() {

      return "memo.memo";
   }



   // homework_board게시판 이동
   @RequestMapping(value = "homework.htm", method = RequestMethod.GET)
   public String homework() {

      return "student.homework_board";
   }

   // BoardListService
   // 링크 게시판 이동
   @RequestMapping(value = "linkFile.htm", method = RequestMethod.GET)
   public ModelAndView linkfile(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
      ModelAndView viewpage = boardlistservice.linkfileviewbyStudent(request, response, mv);
      return viewpage;

   }

   // 달력 게시판 이동
   @RequestMapping(value = "calendar.htm", method = RequestMethod.GET)
   public String calendar() {

		return "student.calendar";
	}
	//학생부 게시판 이동
	@RequestMapping(value = "studentList_student.htm", method = RequestMethod.GET)
	public String selectStudent() {

		return "student.attendance_student";
	}

   // 출석 데이터 테이블
   @RequestMapping("attend.htm")
   public String attend() {

      return "student.data_table";
   }

   
   //메인 상단의 기본 정보를 불러옴
   @RequestMapping(value="basicInformations.htm", method = RequestMethod.GET )
   public ModelAndView basicInformations(HttpSession session){

			
			ModelAndView viewpage = mainteacherservice.selectMains(session);
					
         
         return viewpage;
   }
     
}