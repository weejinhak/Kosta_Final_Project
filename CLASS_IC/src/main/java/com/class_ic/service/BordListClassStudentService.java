package com.class_ic.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.BoardClassDAO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.ClassByLectureDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

@Service
public class BordListClassStudentService {

	@Autowired
	private SqlSession sqlsession;

	// 카테고리 select
	public ModelAndView selectCate(HttpServletRequest request, HttpServletResponse response) { // lectureNo

		ModelAndView m = new ModelAndView();
		// 올걸
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);

		String[] color = { "rose", "blue", "green", "orange", "red" };
		int count = 0;
		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		String email = bdao.selectTeacher(classCode);
		ArrayList<SubCategoryDTO> catelist = bdao.selectCate(email);
		ArrayList<LectureBoardDTO> boardlist = null;
		SubCategoryDTO dto = new SubCategoryDTO();

		dto.setEmail(email);

		for (SubCategoryDTO list : catelist) {
			list.setColor(color[count % 4]);
			count++;

			dto.setCateCode(list.getCateCode());
			boardlist = bdao.selectCateboard(dto);
			list.setBoardlist(boardlist);

		}

		m.addObject("catelist", catelist);
		m.setViewName("student.board");

		return m;
	}

	// 카테고리에서 상세보기 누르면 서브카테고리와 게시글 상세로 들어감
	public ModelAndView cateDetails(ModelAndView modal, HttpServletRequest request, HttpServletResponse response,
			String cateCode) { // lectureNo
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);
		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		String email = bdao.selectTeacher(classCode);

		SubCategoryDTO dto = new SubCategoryDTO();
		dto.setCateCode(cateCode);
		dto.setEmail(email);

		ArrayList<SubCategoryDTO> sublist = bdao.selectSubcate(dto);

		modal.setViewName("student.board_details");
		modal.addObject("cateCode", cateCode);
		modal.addObject("sublist", sublist);

		return modal;
	}

	// 카테고리 서브 카테고리에 알맞는 게시글을 모두 가져옴.
	public ModelAndView selectCateSubcateboard(ModelAndView modal, HttpServletRequest request,
			HttpServletResponse response, SubCategoryDTO dto) { // lectureNo
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);
		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		String email = bdao.selectTeacher(classCode);
		SubCategoryDTO dto2 = new SubCategoryDTO();
		dto2.setCateCode(dto.getCateCode());
		dto2.setEmail(email);
		dto2.setSubcateCode(dto.getSubcateCode());

		ArrayList<LectureBoardDTO> boardlist = bdao.selectCateSubcateboard(dto2);

		modal.setViewName("common/classboardlist_data_table_student");
		modal.addObject("boardlist", boardlist);
		modal.addObject("cateCode", dto.getCateCode());
		modal.addObject("subcateCode", dto.getSubcateCode());

		return modal;
	}

	// 수업보드 게시판 글 수정시 형상관리.
	public String totalboardEditOk(LectureBoardDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		BoardClassDAO dao2 = sqlsession.getMapper(BoardClassDAO.class);

		if (dto.getClassCode().equals(classCode)) {

			dao.totalboardEditOk(dto);
		} else {

			ClassByLectureDTO dto2 = new ClassByLectureDTO();
			dto2.setClassCode(classCode);
			dto2.setlectureNo(dto.getLectureNo());
			ArrayList<LectureBoardDTO> board = dao2.totalboardEdit(dto.getLectureNo());
			board.get(0).setClassCode(classCode);
			dao2.deletx(dto2);
			dto.setClassCode(classCode);
			dao.insertBoardContent(dto);
			dao2.boardMultiSend(dto2);

		}

		return "redirect:allboard.htm";
	}

	// 통합게시판 수정화면 처리
	public ModelAndView totalboardEdit(LectureBoardDTO dto, HttpServletRequest request, int lectureNo) {

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		int lectureNo1 = lectureNo;

		ArrayList<LectureBoardDTO> list = bdao.totalboardEdit(lectureNo1);

		ModelAndView m = new ModelAndView();
		m.setViewName("student.totalLectureclassBoard_Edit");
		m.addObject("list", list);

		return m;
	}

	// 게시판 글 상세보기
	public ModelAndView boardContentDetail(HttpServletRequest request, HttpServletResponse response,
			LectureBoardDTO bvo) { // lectureNo 올걸

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		int lectureNo = Integer.parseInt(request.getParameter("lectureNo"));
		LectureBoardDTO blist = bdao.totalBoard_contentview(lectureNo);
		ArrayList<LectureBoardDTO> bfilelist = bdao.totalBoard_contenFile(lectureNo);
		ArrayList<LectureBoardDTO> blinklist = bdao.totalBoard_contenLink(lectureNo);
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("student.board_content_view_class");
		m.addObject("bvo", blist);
		m.addObject("bfile", bfilelist);
		m.addObject("blink", blinklist);

		return m;
	}

	public ModelAndView boardContent(HttpServletRequest request, ModelAndView model) {

		String cateCode = request.getParameter("cateCode");
		String subcateCode = request.getParameter("subcateCode");
		model.addObject("cateCode", cateCode);
		model.addObject("subcateCode", subcateCode);
		model.setViewName("studnet.board_content_class");
		return model;

	}

	// 카테고리 select
	public ModelAndView selectCateMain(HttpServletRequest request, HttpServletResponse response) { // lectureNo

		ModelAndView m = new ModelAndView();
		// 올걸
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);

		String[] color = { "rose", "blue", "green", "orange", "red" };
		int count = 0;
		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		String email = bdao.selectTeacher(classCode);
		ArrayList<SubCategoryDTO> catelist = bdao.selectCate(email);
		ArrayList<LectureBoardDTO> boardlist = null;
		SubCategoryDTO dto = new SubCategoryDTO();

		dto.setEmail(email);

		for (SubCategoryDTO list : catelist) {

			list.setColor(color[count % 4]);
			count++;
			dto.setCateCode(list.getCateCode());
			boardlist = bdao.selectCateboard(dto);
			list.setBoardlist(boardlist);

		}

		m.addObject("catelist", catelist);
		m.setViewName("common/board_main_student");

		return m;
	}

}
