package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.LectureDTO;
import com.class_ic.vo.MemberDTO;

public interface AttendanceDAO {
	
	//attendance 테이블에  insert
	public void insert(AttandanceDTO dto);
	
	//member 테이블에 있는 모든 데이터를  받아옴.
	public ArrayList<MemberDTO> memberSelectAll();
	
	//이메일에 알맞는 classcode를 select 해옴
	public String selectClassNumber(String email);
	
    //오늘 날짜에 맞는 출석 테이블을 select 해서 모두가져온다.
	public ArrayList<AttandanceDTO> todayAttendaceData();
	
	//기수에 알맞는 시작, 종료 시간을 가지고 온다
	public 	LectureDTO selectStartEndTime(String classCode); 
	
	//오늘 출결 사항을 계산해서 update 해주는 메소드
	public int updateAttendaceState(String attendState,String email);
	
}
