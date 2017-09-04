package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.AttandanceListDTO;

public interface AttendanceListDAO {

	//이메일과 기수에 맞는출석 테이블을 select 해서 모두가져온다.(학생)
	public ArrayList<AttandanceDTO> attendanceSelect(String email, String classcode);

	//이메일과 기수에 맞는 출석 테이블을 select 해서 모두가져온다.(강사)
	public ArrayList<AttandanceListDTO> attendanceSelectByTeacher(String email, String classcode);

	//아이디와 기수에 맞는 출석테이블의 총 수(학생)
	public int attendanceTotalCount(String email, String classcode);

	//아이디와 기수에 맞는 출석테이블의 출석 수(학생)
	public int attendanceNomalCount(String email, String classcode);

	//아이디와 기수에 맞는 출석테이블의 지각 수(학생)
	public int attendLateCount(String email, String classcode);

	//아이디와 기수에 맞는 출석테이블의 결석 수(학생)
	public int attendAbsenceCount(String email, String classcode);

	//아이디와 기수에 맞는 출석테이블의 조퇴 수(학생)
	public int attendEarlyLeaveCount(String email, String classcode);
	
	//이메일에 맞는 출석 결과를 모두 가져와줌(강사)(지영)
	public ArrayList<AttandanceDTO> selectEachStudent(String email,String classcode);

	//강사이메일에서 학생을 입력해 학생들의 엑셀 다운로드를 하기위함(강사)
	public ArrayList<AttandanceListDTO> selectStudentListByTeacher(String tEmail,String classCode,String sEmail);

}
