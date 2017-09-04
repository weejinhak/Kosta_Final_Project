package com.class_ic.controller_category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.MemberService_Web;
import com.class_ic.service_category.StudentManagementService;
import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.StudentGroupDTO;
import com.class_ic.vo.StudentTableDTO;

@Controller
@RequestMapping("teacher")
public class StudentManagementController {

	@Autowired
	StudentManagementService studentmanagerservice;

	@Autowired
	MemberService_Web memberservice;

	// 마지막 조를 나눠볼까 일단 조나누기 edit page 호출하자
	@RequestMapping(value = "groupEdit.htm", method = RequestMethod.GET)
	public ModelAndView groupEdit(ModelAndView mv, String classCode) {
		// get 호출이여도 기본으로
		// 1. member total count
		// GroupCategory의 bindnum null/값이 있을 대로 나눠서 처리 > nvl() 으로 null 을 0으로 할
		// 것인가
		// 2. 저장된 student group 값 반영해서 출력해야하므로 list 또 출력

		ModelAndView MnV = memberservice.getMemberGp(mv);
		// 추가 조편성한 내용 저장
		// ModelAndView MnV = memberservice.getStudentAll(mv, member);

		return MnV;
	}

	// 조편성 저장
	@RequestMapping(value = "saveGroup.htm", method = RequestMethod.POST)
	public String saveGroup(HttpServletRequest request, StudentGroupDTO sgroup) {
		// data : {"email":email, "order":order, "groupTable":groupTable },
		String email = request.getParameter("email");
		String groupName = request.getParameter("groupName");
		String groupCode = request.getParameter("groupCode");
		String classCode = request.getParameter("classCode");
		;
		String groupLeaderState = request.getParameter("groupLeaderState");
		String[] emailArr = email.split(",");
		String[] groupArr = groupName.split(",");

		studentmanagerservice.studentGroup(emailArr, groupArr, groupCode, classCode, groupLeaderState);
		return "teacher/group_ajax";
	}

	// save하고 나서 list에서 저장된 값 불러옵니다. call your save
	@RequestMapping(value = "getSave.htm", method = RequestMethod.POST)
	public String getSave(Model m, @RequestParam String classCode, @RequestParam String groupCode) {

		List<StudentGroupDTO> grouplist = studentmanagerservice.getstudentGroup(m, classCode, groupCode);
		m.addAttribute("grouplist", grouplist);

		return "teacher/final_group_ajax";
	}

	// 학적부 페이지
	@RequestMapping(value = "student_table.htm", method = RequestMethod.GET)
	public String studentTable(Model m) {
		return "teacher.student_table_final";
	}

}
