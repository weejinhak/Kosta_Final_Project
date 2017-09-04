/*
* @FileName		:   AttendanceController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.25
* @Author		:	위진학
* @Desc         :   출석부에 학생(자신의 출석)//강사(기수에 맞는 모든학생출석)Select해오기 위한 Contoller.
*/
package com.class_ic.controller_category;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/*
* @Class: AttendanceController
* @Date: 2017.06. 25.
* @Author: 위진학
* @Desc: 
*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.AttandanceListDTO;
import com.class_ic.vo.MemberDTO;
import com.mysql.fabric.Response;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.class_ic.dao.MemberDAO;
import com.class_ic.service.AttendanceListService;


/*
* @Class: AttendanceController
* @Date: 2017.07. 26.
* @Author: 위진학
* @Desc: 출석현황과 출석 차트에 맞는 값들을 가져오기 위한 Controller
*/
@Controller
public class AttendanceController {

	@Autowired
	private AttendanceListService attendanceListService;

	/*
	 * @description : 학생용 출석리스트
	 */
	@RequestMapping(value = "student/attendanceTable.htm", method = RequestMethod.POST)
	public void studentlistPage(Model model, String email, String classcode, HttpServletResponse response)
			throws Exception {

		List<AttandanceDTO> memberattendacnelist = attendanceListService.attendanceSelect(email, classcode);

		JSONArray attendanceListArray = new JSONArray();

		DateFormat transDate = new SimpleDateFormat("yyyy-MM-dd");
		String attenddate = transDate.format(memberattendacnelist.get(0).getAttendDate());
		for (int i = 0; i < memberattendacnelist.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("attendDate", transDate.format(memberattendacnelist.get(i).getAttendDate()));
			obj.put("inClass", memberattendacnelist.get(i).getInClass());
			obj.put("outClass", memberattendacnelist.get(i).getOutClass());
			obj.put("attendState", memberattendacnelist.get(i).getAttendState());
			obj.put("classCode", memberattendacnelist.get(i).getClassCode());
			attendanceListArray.add(obj);
		}
		response.getWriter().print(attendanceListArray);
	}

	/*
	 * @description : 강사용 출석리스트
	 */
	@RequestMapping(value = "teacher/attendanceTable.htm", method = RequestMethod.POST)
	public void teacherlistPage(String email, String classcode, HttpServletResponse response) throws Exception {
		
		List<AttandanceListDTO> memberattendacnelist = attendanceListService.attendanceSelectByTeacher(email,
				classcode);
		JSONArray attendanceListArray = new JSONArray();
		DateFormat transDate = new SimpleDateFormat("yyyy-MM-dd");

		for (int i = 0; i < memberattendacnelist.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("name", memberattendacnelist.get(i).getName());
			obj.put("attendDate", transDate.format(memberattendacnelist.get(i).getAttendDate()));
			obj.put("inClass", memberattendacnelist.get(i).getInClass());
			obj.put("outClass", memberattendacnelist.get(i).getOutClass());
			obj.put("attendState", memberattendacnelist.get(i).getAttendState());
			obj.put("classCode", memberattendacnelist.get(i).getClassCode());
			attendanceListArray.add(obj);
		}
		response.getWriter().print(attendanceListArray);
	}

	/*
	 * @description : 차트용 출석률(학생)
	 */
	@RequestMapping(value = "student/attendchart.htm", method = RequestMethod.POST)
	public void chart(String email, String classcode, HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		String[] labels = {"","","",""};
		int[] series = { 0, 0, 0, 0 };

		classcode = "151";
		float attendancetotalcount = attendanceListService.attendanceTotalCount(email, classcode);
		float attendnomalcount = attendanceListService.attendanceNomalCount(email, classcode);
		float attendlatecount = attendanceListService.attendLateCount(email, classcode);
		float attendabsencecount = attendanceListService.attendAbsenceCount(email, classcode);
		float attendearlyleavecount = attendanceListService.attendEarlyLeaveCount(email, classcode);

		if (attendancetotalcount == 0) {
			System.out.println("데이터 없음.");
		} else {
			
			labels[0] = String.valueOf((int)((attendnomalcount/ attendancetotalcount) * 100)) + "%";
			labels[1] = String.valueOf((int)((attendlatecount / attendancetotalcount) * 100)) + "%";
			labels[2] = String.valueOf((int)((attendabsencecount / attendancetotalcount) * 100)) + "%";
			labels[3] = String.valueOf((int)((attendearlyleavecount / attendancetotalcount) * 100)) + "%";
			series[0] = (int)((attendnomalcount / attendancetotalcount) * 100);
			series[1] = (int)((attendlatecount / attendancetotalcount) * 100);
			series[2] = (int)((attendabsencecount / attendancetotalcount) * 100);
			series[3] = (int)((attendearlyleavecount / attendancetotalcount) * 100);

		}

		JSONObject obj = new JSONObject();
		JSONArray attendanceChartArray = new JSONArray();

		obj.put("labels", labels);
		obj.put("series", series);
		attendanceChartArray.add(obj);
		response.getWriter().print(attendanceChartArray);

	}

	/*
	 * @description : 차트용 출석률(강사)
	 */
	@RequestMapping(value = "teacher/attendchart.htm", method = RequestMethod.POST)
	public void teacherchart(String email, String classcode, HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		// 출석현황을 담고있는 배열
		// index [0]출석률, [1]지각률,[2]결석률,[3]조퇴율

		ArrayList<AttandanceDTO> list = attendanceListService.selectEachStudent(email, classcode);

		String[] labels = { "", "", "", "" };
		int[] series = { 0, 0, 0, 0 };

		int attendancetotalcount = 1;
		if (list.size() != 0) {
			attendancetotalcount = list.size();
		}
		float attendnomalcount = 0;
		float attendlatecount = 0;
		float attendabsencecount = 0;
		float attendearlyleavecount = 0;

		for (AttandanceDTO eachlist : list) {

			if (eachlist.getAttendState().equals("출석")) {
				attendnomalcount++;
			} else if (eachlist.getAttendState().equals("지각")) {
				attendlatecount++;
			} else if (eachlist.getAttendState().equals("조퇴")) {
				attendearlyleavecount++;
			} else if (eachlist.getAttendState().equals("결석")) {
				attendabsencecount++;
			} else {
			}

		}		
		
		labels[0]= String.valueOf((int)((attendnomalcount / attendancetotalcount) * 100))+"%";
		labels[1]=String.valueOf((int)((attendlatecount / attendancetotalcount) * 100))+"%";
		labels[2]=String.valueOf((int)((attendabsencecount / attendancetotalcount) * 100))+"%";
		labels[3]=String.valueOf((int)((attendearlyleavecount / attendancetotalcount) * 100))+"%";
		series[0]=(int)((attendnomalcount / attendancetotalcount) * 100);
		series[1]=(int)((attendlatecount / attendancetotalcount) * 100);
		series[2]=(int)((attendabsencecount / attendancetotalcount) * 100);
		series[3]=(int)((attendearlyleavecount / attendancetotalcount) * 100);
		
		JSONObject obj =new JSONObject();
		JSONArray attendancChartArray= new JSONArray();
		
		obj.put("labels", labels);
		obj.put("series", series);
		attendancChartArray.add(obj);
		try {
			response.getWriter().print(attendancChartArray);
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

}
