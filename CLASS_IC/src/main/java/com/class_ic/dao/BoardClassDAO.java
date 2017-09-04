package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.ClassByLectureDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

public interface BoardClassDAO {
   
   //기수에 담겨져있는 알맞는 카테고리 select
   ArrayList<SubCategoryDTO > selectCate(String email);
   
   //카테고리에 맞는 게시글을 select 해옴
   ArrayList<LectureBoardDTO> selectCateboard(SubCategoryDTO dto);
   
   //카테고리와 서브카테고리에 알맞는 게시글을 select 해옴.
   ArrayList<LectureBoardDTO> selectCateSubcateboard(SubCategoryDTO dto);
   
   //각 카테고리에 알맞는 서브카테고리를 중복 없이 select 해옴.
   ArrayList<SubCategoryDTO> selectSubcate(SubCategoryDTO dto);
   
   // 출력된 게시글 중 x 버튼을 누를 경우에 수업담기에 담겨 있던 것을 지워줌.
   int deletx(ClassByLectureDTO dto);
   
   // 기수 담기테이블에 insert 
   public void boardMultiSend(ClassByLectureDTO dto);
   
   // 수정화면에 출력
   public ArrayList<LectureBoardDTO> totalboardEdit(int lectureNo);


   //학생에 맞는 강사님 이메일 찾기
   
   public String selectTeacher(String classCode);

   

}