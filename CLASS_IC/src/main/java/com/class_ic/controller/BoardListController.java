/*
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.24
* @Author		:	노지영, 김은영 , 박소현
*/

package com.class_ic.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.app.dto.MemberDTO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.service.BoardListService;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

/*
* @Class: BoardListController 
* @Date: 2017.06. 24
* @Author: 노지영, 김은영, 박소현
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/

@Controller
public class BoardListController {

	@Autowired
	private BoardListService boardlistservice;

	@RequestMapping(value = "teacher/boardcontent.htm", method = RequestMethod.GET)
	public String boardContentView(HttpServletRequest request) {
		return "teacher.board_content";
	}

	@RequestMapping("boardcontent.htm")
	public String boardContent(HttpServletRequest request) {
		return "common/board_content";
	}

	// 글 insert
	@RequestMapping(value = "boardcontentsave.htm", method = RequestMethod.POST)
	public String boardContentSave(HttpServletRequest request, LectureBoardDTO lecture) throws IOException {
		boardlistservice.boardContentSaveService(request, lecture);
		return "common/board_content";

	}

	// 카테고리 select
	@RequestMapping(value = "selectcategory.htm", method = RequestMethod.POST)
	public String selectCategory(Model model, HttpServletRequest request) {
		String viewpage = boardlistservice.selectCategoryService(model, request);
		return viewpage;

	}

	// 서브 카테고리 select
	@RequestMapping(value = "selectsubcategory.htm", method = RequestMethod.POST)
	public String selectSubCategory(Model model, HttpServletRequest request) {
		String viewpage = boardlistservice.selectSubCategoryService(model, request);
		return viewpage;
	}

	// 셀렉박스에 기수 불러오기
	@RequestMapping(value = "selectmember.htm", method = RequestMethod.POST)
	public String selectMember(Model model, HttpServletRequest request, HttpSession session) {
		String viewpage = boardlistservice.selectMember(model, request, session);
		return viewpage;

	}

	// 선택한 체크박스 기수로 보내기
	@RequestMapping(value = "totalBoard_multi_send.htm", method = RequestMethod.GET)
	public String boardMultiSend(String lectureNo, String classCode) {
		String viewpage = boardlistservice.boardMultiSend(lectureNo, classCode);
		return viewpage;
	}

	// 통합게시판 전체 출력
	@RequestMapping(value = "teacher/allboard.htm")
	public ModelAndView allBoard(LectureBoardDTO bvo, HttpServletRequest request) {
		ModelAndView viewpage = boardlistservice.allBoard(bvo, request);
		return viewpage;

	}

	// 통합게시판 카테고리,서브카테고리 select box 0
	@RequestMapping(value = "teacher/totalboard.htm")
	public ModelAndView totalBoard(LectureBoardDTO bvo, HttpServletRequest request) {
		ModelAndView viewpage = boardlistservice.totalBoard(bvo, request);

		return viewpage;

	}

	// 통합게시판 수정화면 처리
	@RequestMapping(value = "teacher/totalboardEdit.htm", method = RequestMethod.GET)
	public ModelAndView totalboardEdit(LectureBoardDTO dto, HttpServletRequest request, int lectureNo) {
		ModelAndView viewpage = boardlistservice.totalboardEdit(dto, request, lectureNo);
		return viewpage;

	}

	// 통합게시판 수정된 데이터 DB저장
	@RequestMapping(value = "teacher/totalboardEdit.htm", method = RequestMethod.POST)
	public String totalboardEditOk(LectureBoardDTO dto) {
		String viewpage = boardlistservice.totalboardEditOk(dto);
		return viewpage;
	}

	// 다중삭제
	@RequestMapping(value = "teacher/totalBoard_multi_delete.htm")
	public String multi_del(HttpServletRequest request, HttpServletResponse response) {
		String viewpage = boardlistservice.multi_del(request, response);
		return viewpage;
	}

	// action의 x버튼 누르기 삭제
	@RequestMapping(value = "teacher/totalBoard_delete.htm", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		String viewpage = boardlistservice.delete(request, response);
		return viewpage;
	}

	// 게시판 글 상세보기
	@RequestMapping("teacher/totalBoard_contentview.htm")
	public ModelAndView boardContentDetail(HttpServletRequest request, HttpServletResponse response,
			LectureBoardDTO bvo) {
		ModelAndView viewpage = boardlistservice.boardContentDetail(request, response, bvo);
		return viewpage;

	}

	// 카테고리 추가 함수
	@RequestMapping("teacher/insertcate.htm")
	public ModelAndView insertCate(HttpServletRequest request, HttpServletResponse response, CategoryDTO dto) {
		ModelAndView viewpage = boardlistservice.insertCate(request, response, dto);
		return viewpage;

	}

	// 서브 카테고리 추가 함수
	@RequestMapping("teacher/insertsubcate.htm")
	public ModelAndView insertSubate(HttpServletRequest request, HttpServletResponse response, SubCategoryDTO dto) {
		ModelAndView viewpage = boardlistservice.insertSubcate(request, response, dto);
		return viewpage;

	}

}
