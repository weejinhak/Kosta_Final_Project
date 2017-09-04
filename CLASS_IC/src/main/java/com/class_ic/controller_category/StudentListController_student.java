/*
* @FileName		:   StudentListController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.25
* @Author		:	이현정
* @Desc         :   
*/
package com.class_ic.controller_category;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.StudentListService;
import com.class_ic.service.StudentListService_student;
import com.class_ic.vo.AttandanceDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("student")
public class StudentListController_student {

	@Autowired
	private StudentListService_student studentListService;

	@RequestMapping(value = "selectStudent.htm", method = RequestMethod.POST)
	public void studentList(String classCode, HttpServletResponse response) throws IOException {

		List<AttandanceDTO> studentList = studentListService.selectStudent(classCode);

		JSONArray array = new JSONArray();

		for (int i = 0; i < studentList.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("photoSrc", studentList.get(i).getPhotoSrc());
			obj.put("email", studentList.get(i).getEmail());
			obj.put("name", studentList.get(i).getName());
			obj.put("phone", studentList.get(i).getPhone());
			obj.put("inClass", studentList.get(i).getInClass());
			obj.put("outClass", studentList.get(i).getOutClass());
			array.add(obj);

		}

		response.getWriter().println(array);

	}

	@RequestMapping(value = "selectAllInsert.htm", method = RequestMethod.POST)
	public String insertTeam(HttpServletRequest request) throws IOException {

		String cateCode = request.getParameter("cateCode");
		String partyName = request.getParameter("partyName");
		String classCode = request.getParameter("classCode");
		String name = request.getParameter("selected");

		String[] nameArr = name.split(",");
		// " , " 구분된 문자열 분해

		studentListService.insertTeamStudent(cateCode, partyName, classCode, nameArr);

		return "redirect:makeGroup.htm";

	}

}
