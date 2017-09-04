package com.class_ic.controller_category;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service_category.BoardService_Teacher;
import com.class_ic.vo.LectureBoardDTO;

@Controller
@RequestMapping("teacher")
public class BoardController_Teacher {

	@Autowired
	private BoardService_Teacher boarservice;

	//boardList 글쓰기 view 페이지 이동 (테스트용)
	@RequestMapping(value="boardWriteOk.htm", method=RequestMethod.GET)
	public String boardWriteOK(){

		return "teacher.board_content";
	}
	//boardList 글쓰기 값 넘기기 (테스트용)
	@RequestMapping(value="boardWriteOk.htm", method=RequestMethod.POST)
	public String boardWriteOK(LectureBoardDTO board, HttpServletRequest request ){

		
		return "teacher.board_content";
	}

}
