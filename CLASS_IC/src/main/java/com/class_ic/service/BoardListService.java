package com.class_ic.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.vo.MemberDTO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.ClassByLectureDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

/*
* @Project      :   CLASS-IC
* @Date          :   2017.06.27
* @Author      :   노지영
*/

/*
* @Class: BoardListController 
* @Date: 2017.06. 27
* @Author: 노지영
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/

@Service
public class BoardListService {

	@Autowired
	private SqlSession sqlsession;

	public void boardContentSaveService(HttpServletRequest request, LectureBoardDTO lecture) throws IOException {

		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		String cate = (String) request.getParameter("cate");
		String subcate = (String) request.getParameter("subcate");
		String classCode = request.getParameter("classCode");

		LectureBoardDTO dto = new LectureBoardDTO();
		dto.setClassCode(classCode);
		dto.setCateCode(cate);
		dto.setSubcateCode(subcate);
		dto.setLectureContent(content);
		dto.setLectureTitle(title);
		// 파일 업로드 추가 부분
		/*
		 * dto.setFileSrc(filenames.get(0));
		 */
		// dto.setFileSrc2(filenames.get(1));

		// 파일 업로드 추가 부분
		BoardDAO board = sqlsession.getMapper(BoardDAO.class);

		board.insertBoardContent(dto);

	}

	public String selectCategoryService(Model model, HttpServletRequest request) {

		BoardDAO board = sqlsession.getMapper(BoardDAO.class);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		List<CategoryDTO> totalcate = board.selectCategory(email);

		model.addAttribute("listcategory", totalcate);

		String viewpage = "common/boardCateList";

		return viewpage;

	}

	public String selectSubCategoryService(Model model, HttpServletRequest request) {

		String cate = request.getParameter("cate");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		BoardDAO board = sqlsession.getMapper(BoardDAO.class);
		List<SubCategoryDTO> subcate = board.selectSubCategory(email);

		ArrayList<SubCategoryDTO> subcate2 = new ArrayList<SubCategoryDTO>();
		for (SubCategoryDTO value : subcate) {
			if (value.getCateCode().equals(cate)) {
				subcate2.add(value);
			}
		}

		model.addAttribute("subcategory", subcate2);
		String viewpage = "common/boardSubCateList";

		return viewpage;

	}

	public String selectMember(Model model, HttpServletRequest request, HttpSession session) {

		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);

		String email = (String) session.getAttribute("email");

		ArrayList<MemberDTO> memberlist = dao.selectMember(email);

		model.addAttribute("memberlist", memberlist);

		String viewpage = "common/boardMemberList";

		return viewpage;

	}

	public String boardMultiSend(String lectureNo, String classCode) {

		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);

		String[] array = lectureNo.split(",");
		ClassByLectureDTO dto = new ClassByLectureDTO();
		dto.setClassCode(classCode);

		ArrayList<ClassByLectureDTO> list = dao.selectClassByLecture();

		boolean exist = false;
		for (int i = 0; i < array.length; i++) {

			for (ClassByLectureDTO all : list) {
				if (all.getlectureNo() == Integer.parseInt(array[i])) {
					exist = true;

				}
			}
			if (exist) {
				break;
			}

			dto.setlectureNo(Integer.parseInt(array[i]));
			dao.boardMultiSend(dto);

		}

		String viewpage = "teacher.totalLectureBoard";
		return viewpage;

	}

	// 여기서 부터 합침
	// 통합게시판 리스트 출력
	public ModelAndView allBoard(LectureBoardDTO bvo, HttpServletRequest request) {

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		ArrayList<LectureBoardDTO> blist = bdao.allList(email);

		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.totalLectureBoard");
		m.addObject("bvo", blist);

		return m;
	}

	// 통합게시판 카테고리,서브카테고리 select box
	public ModelAndView totalBoard(LectureBoardDTO bvo, HttpServletRequest request) {

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		String cateCode = request.getParameter("cate");
		String subcateCode = request.getParameter("subcate");
		SubCategoryDTO dto = new SubCategoryDTO();
		dto.setEmail(email);
		dto.setSubcateCode(subcateCode);
		dto.setCateCode(cateCode);

		ArrayList<LectureBoardDTO> blist = bdao.allBoard(dto);

		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.totalLectureBoard");
		m.addObject("bvo", blist);

		return m;
	}

	// 통합게시판 수정화면 처리
	public ModelAndView totalboardEdit(LectureBoardDTO dto, HttpServletRequest request, int lectureNo) {

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		int lectureNo1 = lectureNo;

		ArrayList<LectureBoardDTO> list = bdao.totalboardEdit(lectureNo1);

		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.totalLectureBoard_Edit");
		m.addObject("list", list);

		return m;
	}

	// 통합게시판 수정된 데이터 DB저장
	public String totalboardEditOk(LectureBoardDTO dto) {

		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.totalboardEditOk(dto);

		return "redirect:allboard.htm";
	}

	// 다중삭제
	public String multi_del(HttpServletRequest request, HttpServletResponse response) {

		String test = request.getParameter("data");

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		String[] array = test.split(",");

		for (int i = 0; i < array.length; i++) {

			// 삭제로 바꿈
			bdao.deleteLect(Integer.parseInt(array[i]));

		}
		return "redirect:allboard.htm";

	}

	// action의 x버튼 누르기 삭제
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		int lectureNo = Integer.parseInt(request.getParameter("lectureNo"));

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		bdao.deleteLect(lectureNo);

		return "redirect:allboard.htm";
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
		m.setViewName("teacher.board_content_view");
		m.addObject("bvo", blist);
		m.addObject("bfile", bfilelist);
		m.addObject("blink", blinklist);

		return m;
	}

	// 카테고리 insert
	public ModelAndView insertCate(HttpServletRequest request, HttpServletResponse response, CategoryDTO dto) { // lectureNo
		// 올걸

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		int result = bdao.insertCate(dto);

		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.totalLectureBoard");

		return m;
	}

	// 서브 카테고리 insert
	public ModelAndView insertSubcate(HttpServletRequest request, HttpServletResponse response, SubCategoryDTO dto) { // lectureNo
		// 올걸
		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		int result = bdao.insertSubcate(dto);

		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.totalLectureBoard");

		return m;
	}

	// 링크파일 뷰 (강사)
	public ModelAndView linkfileviewByTeacher(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {// classcode올걸

		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		// 여기서 오류..
		ArrayList<LectureBoardDTO> llist = bdao.linkList(classCode);

		mv.setViewName("teacher.link");
		mv.addObject("lvo", llist);

		return mv;
		// 클래스 코드를 받아서
	}

	// 링크파일 뷰 (학생)
	public ModelAndView linkfileviewbyStudent(HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv) {// classcode올걸

		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		// 여기서 오류..
		ArrayList<LectureBoardDTO> llist = bdao.linkList(classCode);

		mv.setViewName("student.link");
		mv.addObject("lvo", llist);

		return mv;
		// 클래스 코드를 받아서
	}

	// 링크 추가
	public void linkInsert(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);
		LectureBoardDTO bdto = new LectureBoardDTO();
		// 링크 제목
		String linkTitle = request.getParameter("linkTitle");
		// 링크 주소
		String linkSrc = request.getParameter("linkSrc");

		bdto.setLinkTitle(linkTitle);
		bdto.setLinkSrc(linkSrc);
		bdto.setClassCode(classCode);
		bdao.linkInsert(bdto);
	}

	// 링크 다중삭제
	public String link_multi_del(HttpServletRequest request, HttpServletResponse response) {

		String test = request.getParameter("data");

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		String[] array = test.split(",");

		for (int i = 0; i < array.length; i++) {

			// 삭제로 바꿈
			bdao.deleteLink(Integer.parseInt(array[i]));

		}
		return "redirect:linkFile.htm";

	}

	// 링크게시판 수정화면 처리
	public ModelAndView linkboardEdit(LectureBoardDTO dto, HttpServletRequest request, int linkNo) {

		BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);

		int linkNo1 = linkNo;

		ArrayList<LectureBoardDTO> list = bdao.linkboardEdit(linkNo1);

		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.link_Edit");
		m.addObject("list", list);

		return m;
	}

	// 링크게시판 수정된 데이터 DB저장
	public String linkboardEditOk(LectureBoardDTO dto) {

		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.linkboardEditOk(dto);

		return "redirect:linkFile.htm";
	}

}