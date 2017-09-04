/*@Project : CLASS-IC
@File name : board_details_view.jsp
@Author : 김은영
@Data : 2017.06.21
@Desc :
 */
package com.class_ic.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

//import java.util.List;

import com.class_ic.vo.TodayLectureVO;

public interface TodayLectureDAO {
 
 

   //게시판  리스트 조회 
            //원래는 boardvo일것 
      public  ArrayList<TodayLectureVO> allBoard(String subcateCode) ;
 
    //오늘 수업 전체 조회 
      public ArrayList<TodayLectureVO> todayLectureList() ;
      
      //오늘 수업 글 담기  
      public void insertTodayLect(int lectureNo);
      
      public void deleteTodayLect(int todayNo);
      
     
      
      
      
   

      



}