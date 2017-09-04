package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.StudentGroupDTO;
import com.class_ic.vo.StudentTableDTO;

public interface StudentManagementDAO {
	
	//조편성 설정 입력(과제 카테고리 생성)
	public int studentGroupSetting(StudentTableDTO stable);
	
	//조편성 설정 가져오기 (과제 카테고리 가져오기)
	public List<StudentTableDTO>getStudentGroupSetting();
	
	//조나눈거 저장
	public void studentGroupping(StudentGroupDTO sgroup);
	
	//조나눈거 불러오기 (조 그룹 테이블 가져오기)
	public List<StudentGroupDTO> getStudentGroup(String classCode, String groupCode);
	
	//조 나눈 사람 불러오기 
	public List<StudentGroupDTO>getStudentGroupMember(String classCode, String groupCode);
	
	//학적부 get
	public List<StudentTableDTO> getStudentTable();
	
	
	

}
