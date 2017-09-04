package com.class_ic.dao;


public interface MailDAO {  
	
	//통합 게시판 글입력
	int update_Rand(String email,String code);
	
	int update_Pw(String pwd, String email, String code);

}
