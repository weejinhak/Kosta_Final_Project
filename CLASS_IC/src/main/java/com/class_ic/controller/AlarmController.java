/*
* @FileName		:	AlarmController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
* @Desc         :   쪽지 전달시 Message관련 테이블에 Insert 및 Select해오기 위한 Controller
*/
package com.class_ic.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.class_ic.dao.AlarmDAO;
import com.class_ic.service.MessageService;
import com.class_ic.vo.All_Alarm_DTO;
import com.class_ic.vo.MessageDTO;

@Controller
public class AlarmController {

	@Autowired
	private SqlSession sqlsession;

	/*
	 * @description : 보내온 메시지를 Table에 Insert시키기위한 함수
	 */
	@RequestMapping(value = "common/sendMessage.htm")
	public String sendMessage(@RequestParam(value = "sendmessage") String sendmessage, HttpSession session,
			@RequestParam(value = "remail") String remail) throws ClassNotFoundException, SQLException {

		All_Alarm_DTO dto = new All_Alarm_DTO();

		dto.setEmailS((String) session.getAttribute("email"));// 보내는사람
		Calendar cal = Calendar.getInstance();
		java.util.Date date = cal.getTime();
		dto.setMsSendTime(new SimpleDateFormat("yyyyMMddHHmmss").format(date));// 메시지받는시간
		dto.setMsContent(sendmessage);// 메시지내용
		// 확인상태,삭제여부 처음에 1

		AlarmDAO alarm_DAO = sqlsession.getMapper(AlarmDAO.class);

		int result = alarm_DAO.insertAlarm(dto);
		if (result > 0) {
			dto = alarm_DAO.selectMessageNum();
			dto.setEmailR(remail);// 받는사람
			alarm_DAO.insertMessageReceive(dto);
			alarm_DAO.insertMessageSend(dto);
		}

		return "student.student_main";

	}

	/*
	 * @description :소켓에 연결 되어 있을 시 실시간 안읽은 쪽지의 TotalCount를 상대방에게 전송하기 위한 함수
	 */
	@RequestMapping(value = "common/newAlarm.htm")
	public String newAlarm(@RequestParam(value = "newAlarm") String newAlarm, HttpSession session)
			throws ClassNotFoundException, SQLException {


		AlarmDAO alarm_DAO = sqlsession.getMapper(AlarmDAO.class);

		int totalCount = alarm_DAO.totalCount(newAlarm);

		session.setAttribute("totalCount", totalCount);

		return "newAlarm";

	}

	/*
	 * @description : 읽은 쪽지의 Count Update 하기 위한 함수
	 */
	@RequestMapping(value = "common/alarmCountUpdate.htm")
	public String updateAlarm(HttpServletRequest request, HttpSession session,Model model) {

		String email = request.getParameter("email");

		AlarmDAO alarm_DAO = sqlsession.getMapper(AlarmDAO.class);

		alarm_DAO.updateAlarmCount(email);

		int totalCount = alarm_DAO.totalCount(email);

		session.setAttribute("totalCount", totalCount);

		return "updateAlarm";

	}

}
