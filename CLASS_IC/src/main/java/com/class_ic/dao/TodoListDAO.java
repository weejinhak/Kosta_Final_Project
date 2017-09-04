/*
* @FileName	:	MemberDAO.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/

package com.class_ic.dao;

import java.util.ArrayList;
import java.util.List;

import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.TodoListDTO;

public interface TodoListDAO {
	
	//To do list 보기
	public ArrayList<TodoListDTO> TodoList(String email);
	
	//To do list 등록
	public int TodoListOk(TodoListDTO dto);
	
	//To do list 삭제
	public int TodoListDelete(int todoNo);
	
	
	

}
