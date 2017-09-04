/*
* @FileName   :   MessageService.java
*
* @Project      :   CLASS-IC
* @Date         :   2017.07.26
* @Author      :    위진학
*/
package com.class_ic.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.MessageDAO;
import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.MessageDTO;

/*
* @Class: MessageService
* @Date: 2017.07. 26.
* @Author: 위진학
* @Desc: 메시지를 보낼 때 선택되어지는 아이디, 로그인한 아이디에 맞는 받은 메시지를 가져오는 service
*/
@Service
public class MessageService implements MessageDAO{
   

   @Autowired
   private SqlSession sqlsession;

	/*
	@description : 메시지를 보낼때 아이디를 선택할때 같은 기수의 모든 아이디들이 보여지게 ArrayList에 담음
	*/
   @Override
   public ArrayList<MemberDTO> selectSameMemberList(String classCode) {

      MessageDAO msgDao= sqlsession.getMapper(MessageDAO.class);
      
      ArrayList<MemberDTO> msgmemberlist= msgDao.selectSameMemberList(classCode);
      
      return msgmemberlist;
   }

   
	/*
	@description : 로그인한 아이디에서 받은 메시지들을 모두 ArrayList에 담음
	*/
   @Override
   public ArrayList<MessageDTO> selectMsgContentList(String email) {
      
      MessageDAO msgDao= sqlsession.getMapper(MessageDAO.class);
      
      ArrayList<MessageDTO> msgcontentlist= msgDao.selectMsgContentList(email);
      
      return msgcontentlist;
   }


   

}