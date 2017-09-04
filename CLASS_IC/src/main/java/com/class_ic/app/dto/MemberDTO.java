/*
* @FileName		:	LoginDTO.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
* @Desc         :   App 로그인시 안드로이드에서 넘오는 값을 GET,SET하기위한 DTO
*/
package com.class_ic.app.dto;

public class MemberDTO {
	private String email;
	private String time;
	private String attendState;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAttendState() {
		return attendState;
	}

	public void setAttendState(String attendState) {
		this.attendState = attendState;
	}

}
