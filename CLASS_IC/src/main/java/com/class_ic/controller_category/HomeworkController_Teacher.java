package com.class_ic.controller_category;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.HomeworkService;
import com.class_ic.service.StudentListService;
import com.class_ic.vo.HomeworkDTO;
import com.class_ic.vo.LectureBoardDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("teacher")
public class HomeworkController_Teacher {

	@Autowired
	private HomeworkService homeworkService;

	// 과제 게시판 메인 카테고리 출력 : 2017.06.27 최은혜
	@RequestMapping(value = "selectCate.htm", method = RequestMethod.POST)
	public void MovePage(String email, HttpServletResponse response) throws IOException {

		List<HomeworkDTO> cateList = homeworkService.selectCate(email);

		JSONArray array = new JSONArray();
		for (int i = 0; i < cateList.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("cateCode", cateList.get(i).getCateCode());
			array.add(obj);
		}

		response.getWriter().println(array);

	}

	// 과제 게시판 조 등록 : 2017.06.28 최은혜
	@RequestMapping(value = "addHomework.htm", method = RequestMethod.POST)
	public String addCate(String email, String classCode, String cateCode, String partyName) {

		homeworkService.addTeamService(email, classCode, cateCode, partyName);

		return "redirect:homework.htm";
	}

	// 카테고리 선택시 조 출력 : 2017.06.29 최은혜
	@RequestMapping(value = "selectTeam.htm", method = RequestMethod.POST)
	public void MovePage(String email, String classCode, String cateCode, HttpServletResponse response)
			throws IOException {

		List<HomeworkDTO> teamList = homeworkService.selectTeamService(email, classCode, cateCode);

		JSONArray array = new JSONArray();
		for (int i = 0; i < teamList.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("partyName", teamList.get(i).getPartyName());
			array.add(obj);

		}

		response.getWriter().println(array);

	}

	// 과제 공지 페이지 이동 : 2017.06.29 최은혜
	@RequestMapping("homeworkNoticePage.htm")
	public String homeworkNotice(HttpServletRequest request) {

		return "teacher.homework_content";

	}

	// 공지사항 등록 : 강사 2017.06.28 최은혜
	@RequestMapping(value = "addNotice.htm", method = RequestMethod.POST)
	public String addNotice(String email, String classCode, String cateCode, String assignNotice, String assignTitle,
			String assignContent) {

		homeworkService.addNoticeService(email, classCode, cateCode, assignNotice, assignTitle, assignContent);

		return "redirect:homework.htm";
	}

	// 과제 게시판 전체 출력 : 2017.06.30 최은혜
	@RequestMapping(value = "selectAllList.htm", method = RequestMethod.POST)
	public String selectAllList(String classCode, String email, HttpServletResponse response, Model model)
			throws IOException {

		HomeworkDTO dto = new HomeworkDTO();
		dto.setClassCode(classCode);
		dto.setEmail(email);

		List<HomeworkDTO> AllList = homeworkService.selectAllList(dto);

		model.addAttribute("homeworkselectlist", AllList);

		return "teacher/homework_partyNameList";

	}

	// 팀별 게시물 출력 : 2017.06.30 위진학
	@RequestMapping(value = "homeworkSelectList.htm", method = RequestMethod.POST)
	public String homeworkSelectList(HttpSession session, HttpServletRequest request, Model model, String cateCode)
			throws IOException {

		List<HomeworkDTO> AllList = homeworkService.homeworkSelectList(session, request, model, cateCode);

		model.addAttribute("homeworkselectlist", AllList);

		return "teacher/homework_partyNameList";

	}

	// 상세보기 페이지로 이동 : 2017.07.02 박소현
	@RequestMapping(value = "homeworkContent.htm", method = RequestMethod.GET)
	public ModelAndView homeworkContent(HttpServletRequest request, HttpServletResponse response, HomeworkDTO dto) {

		ModelAndView viewpage = homeworkService.homeworkContent(request, response, dto);

		return viewpage;
	}

	// 과제게시판 수정화면 출력 : 2017.07.01 박소현
	@RequestMapping(value = "homeworkEdit.htm", method = RequestMethod.GET)
	public ModelAndView homeworkEdit(HttpServletRequest request, HttpServletResponse response, HomeworkDTO dto) {

		ModelAndView viewpage = homeworkService.homeworkEdit(request, response, dto);

		return viewpage;
	}

	// 과제게시판 수정한 데이터 DB저장 : 2017.07.01 박소현
	@RequestMapping(value = "homeworkEdit.htm", method = RequestMethod.POST)
	public String homeworkEditOk(HomeworkDTO dto) {
		homeworkService.homeworkEditOk(dto);

		return "redirect:homework.htm";
	}

	// 과제게시판 삭제 : 2017.07.01 박소현
	@RequestMapping(value = "homeworkDelete.htm")
	public String homeworkDelete(HttpServletRequest request, HttpServletResponse response) {

		homeworkService.homeworkDelete(request, response);

		return "redirect:homework.htm";
	}

}
