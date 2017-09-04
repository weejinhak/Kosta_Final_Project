package com.class_ic.controller_category;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.TodayLectureDAO;
import com.class_ic.vo.TodayLectureVO;

@Controller
@RequestMapping("teacher")
public class TodayLectureController {

	@Autowired
	SqlSession sqlsession;

	// 전체 오늘의 목록 조회

	@RequestMapping("todayLectureList.htm")
	public ModelAndView todayLectureList(TodayLectureVO bvo) {

		TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class);

		ArrayList<TodayLectureVO> blist = bdao.todayLectureList();
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.todayLecture_storage");

		m.addObject("bvo", blist);

		return m;

	}

	@RequestMapping(value = "multi_storage.htm", method = RequestMethod.POST)
	public String multi_storage(HttpServletRequest request, HttpServletResponse response) {

		String test = request.getParameter("data");

		TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class);

		String[] array = test.split(",");

		for (int i = 0; i < array.length; i++) {

			bdao.insertTodayLect(Integer.parseInt(array[i]));

		}

		return "teacher.board_details_view";

	}

	// 오늘의 강의 삭제

	@RequestMapping(value = "todayLectureDelete.htm")
	public String delete(HttpServletRequest request, HttpServletResponse response) {

		int todayNo = Integer.parseInt(request.getParameter("todayNo"));

		TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class);

		bdao.deleteTodayLect(todayNo);

		return "redirect:todayLectureList.htm";

	}

}