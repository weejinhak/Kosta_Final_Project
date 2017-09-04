package com.class_ic.vo;

public class TodaysLectureDTO {

	private String lectureBM;
	private int lectureNo;
	
	public String getLectureBM() {
		return lectureBM;
	}
	public void setLectureBM(String lectureBM) {
		this.lectureBM = lectureBM;
	}
	public int getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	@Override
	public String toString() {
		return "TodaysLectureDTO [lectureBM=" + lectureBM + ", lectureNo=" + lectureNo + "]";
	}
	
}

