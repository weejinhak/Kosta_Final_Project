package com.class_ic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.StudentListDAO;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.StudentGroupDTO;

@Service
public class StudentListService_student {

	@Autowired
	private SqlSession sqlsession;

	/*
	 * @description : 학적부 학생리스트 출력(강사페이지)
	 */

	public List<AttandanceDTO> selectStudent(String classCode) {

		StudentListDAO dao = sqlsession.getMapper(StudentListDAO.class);
		List<AttandanceDTO> studentList = dao.selectStudent(classCode);

		return studentList;
	}

	// 조편성
	public void insertTeamStudent(String cateCode, String partyName, String classCode, String[] nameArr) {

		StudentGroupDTO dto = new StudentGroupDTO();

		for (int i = 0; i < nameArr.length; i++) {
			dto = new StudentGroupDTO();
			dto.setCateCode(cateCode);
			dto.setPartyName(partyName);
			dto.setClassCode(classCode);
			dto.setName(nameArr[i]);
		}

		StudentListDAO dao = sqlsession.getMapper(StudentListDAO.class);
		int result = dao.insertTeamStudent(dto);

	}

}
