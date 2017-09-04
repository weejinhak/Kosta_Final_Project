package com.class_ic.vo;
/*
* @FileName		:	BoardVO.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.19
* @Author		:	최석환
*/
import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	
	private Integer lectureNo;
	private String classCode;
	private String cateCode;
	private String subcateCode;
	private String lectureTitle;
	private String lectureContent;
	private Date lectureDate;
	
	private String[] files;
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public Integer getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(Integer lectureNo) {
		this.lectureNo = lectureNo;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getSubcateCode() {
		return subcateCode;
	}
	public void setSubcateCode(String subcateCode) {
		this.subcateCode = subcateCode;
	}
	public String getLectureTitle() {
		return lectureTitle;
	}
	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}
	public String getLectureContent() {
		return lectureContent;
	}
	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}
	public Date getLectureDate() {
		return lectureDate;
	}
	public void setLectureDate(Date lectureDate) {
		this.lectureDate = lectureDate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [lectureNo=" + lectureNo + ", classCode=" + classCode + ", cateCode=" + cateCode
				+ ", subcateCode=" + subcateCode + ", lectureTitle=" + lectureTitle + ", lectureContent="
				+ lectureContent + ", lectureDate=" + lectureDate + ", files=" + Arrays.toString(files) + "]";
	}
	
}
