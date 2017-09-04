/*
* @FileName		:	MessageDAO.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.07.26
* @Author		:	위진학
*/
package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.MessageDTO;

public interface MessageDAO {
	
	//나랑 같은 기수의 학생,선생의 아이디와 이름을 가져오는 메소드.
	public ArrayList<MemberDTO> selectSameMemberList(String classCode);
	   
		
    //로그인한 아이디가 받은 메시지를 가져오는 메소드
   public ArrayList<MessageDTO> selectMsgContentList(String email);
      	
}
