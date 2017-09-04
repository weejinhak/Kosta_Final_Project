/*
* @FileName		:	Calendar.DAO.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.26
* @Author		:   박소현,노지영
*/
package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.TodayClassDTO;
import com.class_ic.vo.TodayLectureVO;

public interface CalendarDAO {

      //일정 등록  완료
      public int CalendarWriteOk(CalendarDTO dto);
      
      //일정 보기
      public ArrayList<CalendarDTO> CalendarList();
      
      //일정 수정
      public void CalendarEdit(CalendarDTO dto);
      
      //일정 삭제 
      public int CalendarDelete(int calendar_id);
      
      //오늘의 수업 보기

      public ArrayList<TodayLectureVO> CalendarTodayClass(String clickdate);
      
      //히스토리
      public ArrayList<CalendarDTO> HistoryList();



   }   