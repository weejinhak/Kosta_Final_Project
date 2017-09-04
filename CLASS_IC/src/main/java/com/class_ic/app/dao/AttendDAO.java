/*
* @FileName		:	AttendDAO.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
*/
package com.class_ic.app.dao;

import org.apache.ibatis.annotations.Param;

import com.class_ic.app.dto.MemberDTO;

/*
* @Interface: AttendDAO
* @Date: 2017.06. 16.
* @Author: 위진학
* @Desc: 로그인 확인과 출석 insert를 위해 Mapper의 이름과 일치시킴.
*/
public interface AttendDAO {

	//로그인 확인
	public int login(@Param("email")String email);
	
	//출석 insert
	public void attendanceMember(@Param("email")String email,
								 @Param("time")String time,
								 @Param("attendState")String state);
	
}