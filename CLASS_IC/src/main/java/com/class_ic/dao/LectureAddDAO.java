package com.class_ic.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.class_ic.vo.LectureDTO;

public interface LectureAddDAO {

	// 이메일에 맞는 강의기수 정보 얻기 (강사)
	public List<LectureDTO> getlecture(@Param("email") String email);

	// 이메일에 맞는 강의 기수 정보 얻기 (학생)
	public List<LectureDTO> getlectureStudent(@Param("email") String email);

	// 강의 추가
	public int insert(LectureDTO lecture);

	// 학생 강사, 강의 최초 등록
	public int inputMyClassCode(String email, String classCode);
	
	// ClassMember테이블에 ID가 존재하는지.
	public int searchMemberClassMember(String email, String classCode);

	//강사 가입시 최초 classCode 에 email 값 넣기 
	public int insertDefault (LectureDTO lecture);
}
