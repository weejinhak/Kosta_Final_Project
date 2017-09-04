package com.class_ic.vo;



public class ClassDTO {
	private String classCode;
	private String classTitle;
	private String classStart;
	private String classEnd;
	private String email;
	
	
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public String getClassStart() {
		return classStart;
	}
	public void setClassStart(String classStart) {
		this.classStart = classStart;
	}
	public String getClassEnd() {
		return classEnd;
	}
	public void setClassEnd(String classEnd) {
		this.classEnd = classEnd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "ClassDTO [classCode=" + classCode + ", classTitle=" + classTitle + ", classStart=" + classStart
				+ ", classEnd=" + classEnd + ", email=" + email + "]";
	}
	
	
	
}
