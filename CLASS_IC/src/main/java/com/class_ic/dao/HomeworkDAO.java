package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.HomeworkDTO;

public interface HomeworkDAO {
	
	//강사
	//과제게시판 카테고리 출력
	public List<HomeworkDTO> selectCate(String email);
	
	//카테고리별 조 등록
	public int addTeamDao(HomeworkDTO dto);
	
	//카테고리 선택시 조 출력
	public List<HomeworkDTO> selectTeamDao(HomeworkDTO dto);
	
	//공지사항 등록 : 강사
 	public int addNoticeDao(HomeworkDTO dto);

 	//과제게시판 전체 출력
 	public List<HomeworkDTO> selectAll(HomeworkDTO dto);
 	
 	//partyName별 출력 
 	public List<HomeworkDTO> selectAllByTeacher(HomeworkDTO dto);
 	
 	//강사 이메일, 기수 출력
 	public HomeworkDTO teacherClassCode(HomeworkDTO dto);
 	
 	//과제게시판 상세보기, 과제게시판 수정 화면 출력
    public HomeworkDTO selectContent(HomeworkDTO dto);

    //과제게시판 수정한 데이터 DB저장
    public int homeworkEditOk(HomeworkDTO dto);
    
    //과제게시판 삭제
    public int homeworkDelete(int assignNo);
 	
 	
 	//학생
 	//과제 게시판 카테고리 출력
 	public List<HomeworkDTO> studentMainCate(String classCode);
 	
 	//카테고리 선택시 조 출력
 	public List<HomeworkDTO> selectTeamStudent(HomeworkDTO dto);
 		
 	//과제게시판 전체 출력
 	public List<HomeworkDTO> selectAllStudent(HomeworkDTO dto);
 	
 	//partyName별 출력 
 	 public List<HomeworkDTO> selectAllByStudent(HomeworkDTO dto);
 	 
 	 //partyName 출력(등록페이지)
 	public String selectPartyName(String email);
 	
 	//과제 등록 : 학생
 	 public int addHomeworkDao(HomeworkDTO dto);
 	 
     
}
