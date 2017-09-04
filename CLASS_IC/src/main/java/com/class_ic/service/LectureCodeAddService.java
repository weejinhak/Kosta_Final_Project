/*
* @FileName		:	LectureCodeAddService.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
*/
package com.class_ic.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.LectureAddDAO;
import com.class_ic.vo.LectureDTO;

/*
* @Class: LectureCodeAddService
* @Date: 2017.06. 16.
* @Author: 위진학
* @Desc: Controller에서 받은 parameter를 실질적으로 Mapper에 넘겨주는 service
*/
@Service
public class LectureCodeAddService {

	
	@Autowired
	private SqlSession sqlsession;

	/*
	@description : 기수추가 insert하는 service
	*/
	public String addclasscode(LectureDTO lecture) throws Exception {
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);

		String opentime=lecture.getClassOpenTime().substring(0, 4);
		
		//am/pm시 바꾸기

		String closetime=lecture.getClassCloseTime().substring(0, 4);
		lecture.setClassOpenTime(opentime+":00");
		lecture.setClassCloseTime(closetime+":00");
	

		String viewpage = "";
		
		//classmember 테이블에 넣는 부분 추가
		String email = lecture.getEmail();
		String classCode = lecture.getClassCode();

		try {
			int result = lectureDao.insert(lecture);
			if (result > 0) {

				//ClassMember에 넣기 
				lectureDao.inputMyClassCode(email, classCode);
				viewpage = "common/lectureList";
				//viewpage = "redirect:thsSelect_teacher.jsp";

			} else {
			}
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "join.joinus";
			throw e;
		}
		return viewpage;
	}
	
	
	/*
	@description : email 맞는 기수 Select 하는 service
	*/
	public List<LectureDTO> lecturelistselect(String email) throws Exception {

		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);
		List<LectureDTO> lecturelist= lectureDao.getlecture(email);
		
		return lecturelist;
		
	}
	/*
	@description : email 맞는 기수 Select 하는 service(학생)
	*/
	public List<LectureDTO> lecturelistselectStudent(String email) throws Exception {
		
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);
		List<LectureDTO> lecturelistStudent= lectureDao.getlectureStudent(email);
		
		return lecturelistStudent;
		
	}

		
		
}
