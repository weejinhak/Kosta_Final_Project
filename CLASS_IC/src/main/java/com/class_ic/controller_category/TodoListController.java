package com.class_ic.controller_category;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.CalendarDAO;
import com.class_ic.dao.TodoListDAO;
import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.TodoListDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "student")
public class TodoListController {

	@Autowired
	private SqlSession sqlSession;

	/*
	 * @description : TodoList에서의 값들을 받아와 DB에 저장
	 */
	@RequestMapping(value = "TodoListInsertOk.htm", method = RequestMethod.GET)
	public String TodoListInsertOk(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		TodoListDAO todolistdao = sqlSession.getMapper(TodoListDAO.class);
		TodoListDTO dto = new TodoListDTO();

		String listContent = request.getParameter("listContent");

		dto.setTodoList(listContent);
		dto.setEmail(email);

		todolistdao.TodoListOk(dto);

		return "student.student_main";
	}

	/*
	 * @description : DB에 저장된 일정들을 TodoList에 출력
	 */
	@RequestMapping(value = "todoListselect.htm", method = RequestMethod.GET)
	public ModelAndView ModelAndView(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		TodoListDAO todolistdao = sqlSession.getMapper(TodoListDAO.class);

		ArrayList<TodoListDTO> todolist = todolistdao.TodoList(email);

		ModelAndView model = new ModelAndView();

		model.addObject("list", todolist);
		model.setViewName("common/todoList");

		return model;
	}

	/*
	 * @description : TodoList삭제
	 */
	@RequestMapping(value = "TodoListDelete.htm", method = RequestMethod.GET)
	public void TodoListDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		TodoListDAO todolistdao = sqlSession.getMapper(TodoListDAO.class);
		TodoListDTO dto = new TodoListDTO();

		int todoNo = Integer.parseInt(request.getParameter("listNo"));

		todolistdao.TodoListDelete(todoNo);

	}

}