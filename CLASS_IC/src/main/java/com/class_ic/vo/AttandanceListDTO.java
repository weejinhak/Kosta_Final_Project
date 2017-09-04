package com.class_ic.vo;

import java.sql.Date;

public class AttandanceListDTO {

	private String name;
	private Date attendDate;
	private String inClass;
	private String outClass;
	private String attendState;
	private String classCode;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getAttendDate() {
		return attendDate;
	}
	public void setAttendDate(Date attendDate) {
		this.attendDate = attendDate;
	}
	public String getInClass() {
		return inClass;
	}
	public void setInClass(String inClass) {
		this.inClass = inClass;
	}
	public String getOutClass() {
		return outClass;
	}
	public void setOutClass(String outClass) {
		this.outClass = outClass;
	}
	public String getAttendState() {
		return attendState;
	}
	public void setAttendState(String attendState) {
		this.attendState = attendState;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

}
