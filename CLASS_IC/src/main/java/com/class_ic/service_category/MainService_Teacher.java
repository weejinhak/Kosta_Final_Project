package com.class_ic.service_category;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.TeacherMainDAO;
import com.class_ic.vo.ClassDTO;

@Service
public class MainService_Teacher {

	@Autowired
	private SqlSession sqlsession;
	
	public ModelAndView selectMain(HttpSession session){
		TeacherMainDAO dao = sqlsession.getMapper(TeacherMainDAO.class);

		ClassDTO mainlist = dao.teacherMain((String)session.getAttribute("classCode"));
		int mainmembercount=dao.memberCountByTeacher((String)session.getAttribute("classCode"));
		
		ModelAndView m = new ModelAndView();
		m.setViewName("common/mainBasicInformation");
		m.addObject("list", mainlist);
		m.addObject("membercount",mainmembercount);
		
		return m;
	}
}
