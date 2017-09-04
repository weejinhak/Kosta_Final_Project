package com.class_ic.vo;

public class ClassByLectureDTO {

	private boolean select;
	private int lectureNo;
	private String classCode;
	public boolean isSelect() {
		return select;
	}
	public void setSelect(boolean select) {
		this.select = select;
	}
	public int getlectureNo() {
		return lectureNo;
	}
	public void setlectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	@Override
	public String toString() {
		return "ClassByLectureDTO [select=" + select + ", lectureNo=" + lectureNo + ", classCode=" + classCode + "]";
	}
	
	
	
	
}
