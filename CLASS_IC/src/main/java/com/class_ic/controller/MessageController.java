/*
* @FileName		:	MessageController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.07.26
* @Author		:	위진학
*/
package com.class_ic.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.MessageService;
import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.MessageDTO;


/*
* @Class: MessageController
* @Date: 2017.07. 26.
* @Author: 위진학
* @Desc: 받은 메시지를 볼때 내용과 이름을 가져오기 위한 컨트롤러
*/
@Controller
public class MessageController {
   
   @Autowired
   private MessageService messageService;
   
	/*
	@description : 메시지를 보낼때 아이디를 선택할때 같은 기수의 모든 아이디들이 보여지게 model에 담아 페이지 넘김
	*/
   @RequestMapping(value="messagememberlist.htm",method=RequestMethod.POST)
   public String messageMemberList(String classCode,Model model){
      ArrayList<MemberDTO> msgmemberlist= new ArrayList<MemberDTO>();
      
      msgmemberlist=messageService.selectSameMemberList(classCode);
      
      model.addAttribute("member", msgmemberlist);
   
      return "common/senderlist";
      
   }
   
	/*
	@description : 로그인한 아이디에서 받은 메시지들을 모두 가져와 model에 담아 페이지 넘김
	*/
   @RequestMapping(value="messagecontentlist.htm",method=RequestMethod.POST)
   public String messageContentList(String email,Model model){
      
      ArrayList<MessageDTO> msgcontentlist= new ArrayList<MessageDTO>();
      
      msgcontentlist=messageService.selectMsgContentList(email);      
      
      model.addAttribute("msgcontentlist", msgcontentlist);
   
      return "common/message_data_table";
      
   }   
   
   
}