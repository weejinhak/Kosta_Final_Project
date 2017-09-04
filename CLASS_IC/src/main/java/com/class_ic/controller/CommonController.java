/*
* @FileName	:	CommonController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common")
public class CommonController {
	
	@RequestMapping("select.htm")
	public String theSelect(){
		
		return "common/thsSelect";
	}
	
	@RequestMapping("select_teacher.htm")
	public String theSelectTeacher(){
		
		return "common/thsSelect_teacher";
	}
	
	@RequestMapping("select_student.htm")
	public String theSelectStudent(){
		
		return "common/thsSelect_student";
	}

	
}
