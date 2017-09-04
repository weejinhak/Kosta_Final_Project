package com.class_ic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.HomeworkDAO;
import com.class_ic.vo.HomeworkDTO;
import com.class_ic.vo.LectureBoardDTO;

@Service
public class HomeworkService {

	@Autowired
	private SqlSession sqlsession;

	// 메인 카테고리 출력
	public List<HomeworkDTO> selectCate(String email) {

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> cateList = dao.selectCate(email);

		return cateList;
	}

	// 카테고리별 조 등록
	public void addTeamService(String email, String classCode, String cateCode, String partyName) {

		HomeworkDTO dto = new HomeworkDTO();
		dto.setEmail(email);
		dto.setClassCode(classCode);
		dto.setCateCode(cateCode);
		dto.setPartyName(partyName);

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		int result = dao.addTeamDao(dto);

	}

	// 카테고리 선택시 조 출력
	public List<HomeworkDTO> selectTeamService(String email, String classCode, String cateCode) {

		HomeworkDTO dto = new HomeworkDTO();
		dto.setEmail(email);
		dto.setClassCode(classCode);
		dto.setCateCode(cateCode);

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> teamList = dao.selectTeamDao(dto);

		return teamList;
	}

	// 공지사항 등록
	public void addNoticeService(String email, String classCode, String cateCode, String assignNotice,
			String assignTitle, String assignContent) {

		HomeworkDTO dto = new HomeworkDTO();
		dto.setEmail(email);
		dto.setClassCode(classCode);
		dto.setCateCode(cateCode);
		dto.setAssignNotice(assignNotice);
		dto.setAssignTitle(assignTitle);
		dto.setAssignContent(assignContent);

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		int result = dao.addNoticeDao(dto);

	}

	// 과제게시판 전체 출력
	public List<HomeworkDTO> selectAllList(HomeworkDTO dto) {

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> AllList = dao.selectAll(dto);

		return AllList;
	}

	// 과제게시판 partyName별 출력 (추가.진학)
	public List<HomeworkDTO> homeworkSelectList(HttpSession session, HttpServletRequest request, Model model,
			String cateCode) {

		String partyName = request.getParameter("partyName");
		String classCode = (String) session.getAttribute("classCode");

		HomeworkDTO dto = new HomeworkDTO();
		dto.setPartyName(partyName);
		dto.setClassCode(classCode);
		dto.setCateCode(cateCode);

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> selectAllList = dao.selectAllByTeacher(dto);

		return selectAllList;
	}

	/////////////////////////////////////////////// 학생
	// student 메인 카테고리 출력
	public List<HomeworkDTO> studentMainCate(String classCode) {

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> cateList = dao.studentMainCate(classCode);

		return cateList;
	}

	// 카테고리 선택시 조 출력
	public List<HomeworkDTO> studentTeamService(String classCode, String cateCode) {

		HomeworkDTO dto = new HomeworkDTO();
		dto.setClassCode(classCode);
		dto.setCateCode(cateCode);

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> teamList = dao.selectTeamStudent(dto);

		return teamList;
	}

	// 과제게시판 전체 출력
	public List<HomeworkDTO> selectAllStudent(HomeworkDTO dto) {

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> AllList = dao.selectAllStudent(dto);

		return AllList;
	}

	// 과제게시판 partyName별 출력 : 학생 (추가.진학)
	public List<HomeworkDTO> homeworkSelectListStudent(HttpSession session, HttpServletRequest request, Model model) {

		String partyName = request.getParameter("partyName");
		String classCode = (String) session.getAttribute("classCode");

		HomeworkDTO dto = new HomeworkDTO();
		dto.setPartyName(partyName);
		dto.setClassCode(classCode);

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> selectAllList = dao.selectAllByStudent(dto);

		return selectAllList;
	}

	// 과제 등록
	public void addHomeworkService(String email, String classCode, String cateCode, String assignNotice,
			String assignTitle, String assignContent, String partyName) {

		HomeworkDTO dto = new HomeworkDTO();
		dto.setEmail(email);
		dto.setClassCode(classCode);
		dto.setCateCode(cateCode);
		dto.setAssignNotice(assignNotice);
		dto.setAssignTitle(assignTitle);
		dto.setAssignContent(assignContent);
		dto.setPartyName(partyName);

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		int result = dao.addHomeworkDao(dto);

	}

	// 과제게시판 상세보기
	public ModelAndView homeworkContent(HttpServletRequest request, HttpServletResponse response, HomeworkDTO dto) {
		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);

		HomeworkDTO contentlist = dao.selectContent(dto);

		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.homework_detail");
		m.addObject("list", contentlist);

		return m;
	}

	// 수정화면으로 이동
	public ModelAndView homeworkEdit(HttpServletRequest request, HttpServletResponse response, HomeworkDTO dto) {
		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);

		HomeworkDTO contentlist = dao.selectContent(dto);

		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.homework_edit");
		m.addObject("list", contentlist);

		return m;
	}

	// 수정한 데이터 DB저장
	public void homeworkEditOk(HomeworkDTO dto) {
		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		dao.homeworkEditOk(dto);
	}

	// 과제게시판 삭제
	public void homeworkDelete(HttpServletRequest request, HttpServletResponse response) {
		String delete = request.getParameter("data");

		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);

		String[] array = delete.split(",");
		int assignNo = 0;
		for (int i = 0; i < array.length; i++) {

			assignNo = Integer.parseInt(array[i]);
			int result = dao.homeworkDelete(assignNo);

		}

	}
}
