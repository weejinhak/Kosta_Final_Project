package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.StudentGroupDTO;

public interface StudentListDAO {
	
	//기수별 학생 전체 목록, 입실체크(학적부)
	public List<AttandanceDTO> selectStudent(String classCode);

	//조편성 저장
	public int insertTeamStudent(StudentGroupDTO dto);
	
	//편성된 조 출력
	public List<StudentGroupDTO> selectStudentTeam(StudentGroupDTO dto);

}
