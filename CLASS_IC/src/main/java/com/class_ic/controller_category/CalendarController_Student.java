/*
* @FileName		:	CalendarController_Student.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.26
* @Author		:   박소현,노지영
*/
package com.class_ic.controller_category;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.CalendarDAO;
import com.class_ic.service.CalendarService_Student;
import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.TodayLectureVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "student", method = RequestMethod.POST)
public class CalendarController_Student {

	@Autowired
	private CalendarService_Student calendarservice_student;


	/*
	 * @description : DB에 저장된 일정들을 캘린더에 출력
	 */
	@RequestMapping(value = "CalendarList.htm", method = RequestMethod.GET)
	public void CalendarIList(HttpServletRequest request, HttpServletResponse response, @ModelAttribute CalendarDTO dto2) throws ParseException {
			calendarservice_student.CalendarIList(request, response, dto2);
	}
	
	
	/*
	 * @description : 오늘의 강의 출력
	 */
	@RequestMapping(value = "todayclass.htm", method = RequestMethod.POST)
	public void CalendarTodayClass(HttpServletRequest request, HttpServletResponse response) throws IOException {
			calendarservice_student.CalendarTodayClass(request, response);
	}

	
	/*
	 * @description : DB에 저장된 일정들을 히스토리에 출력
	 */
	@RequestMapping(value = "historyList.htm", method = RequestMethod.GET)
	public ModelAndView HistoryList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView viewpage = calendarservice_student.HistoryList(request, response);
		return viewpage;
	}
	
	

}