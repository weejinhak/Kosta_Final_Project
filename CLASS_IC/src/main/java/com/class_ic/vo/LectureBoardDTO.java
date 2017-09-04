package com.class_ic.vo;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class LectureBoardDTO {

	private int lectureNo;
	private String classCode;
	private String cateCode;
	private String subcateCode;
	private String lectureTitle;
	private String lectureContent;
	private String lectureDate;
	//파일 업로드
	private int fileNo;
	private String fileSrc;


	//링크게시판 
	private int linkNo ; 
	private String linkSrc; 
	private String linkTitle ;
	private String assignNo;

	//다중 파일 업로드
	private List<CommonsMultipartFile> files;

	//이후 생성자 함수와 getter setter

	public LectureBoardDTO() {

	}




	public LectureBoardDTO(int lectureNo, String classCode, String cateCode, String subcateCode, String lectureTitle,
			String lectureContent, String lectureDate, int fileNo, String fileSrc, int linkNo, String linkSrc,
			String linkTitle, String assignNo, List<CommonsMultipartFile> files) {
		this.lectureNo = lectureNo;
		this.classCode = classCode;
		this.cateCode = cateCode;
		this.subcateCode = subcateCode;
		this.lectureTitle = lectureTitle;
		this.lectureContent = lectureContent;
		this.lectureDate = lectureDate;
		this.fileNo = fileNo;
		this.fileSrc = fileSrc;
		this.linkNo = linkNo;
		this.linkSrc = linkSrc;
		this.linkTitle = linkTitle;
		this.assignNo = assignNo;
		this.files = files;
	}




	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
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

	public String getLectureDate() {
		return lectureDate;
	}

	public void setLectureDate(String lectureDate) {
		this.lectureDate = lectureDate;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileSrc() {
		return fileSrc;
	}

	public void setFileSrc(String fileSrc) {
		this.fileSrc = fileSrc;
	}

	public int getLinkNo() {
		return linkNo;
	}

	public void setLinkNo(int linkNo) {
		this.linkNo = linkNo;
	}

	public String getLinkSrc() {
		return linkSrc;
	}

	public void setLinkSrc(String linkSrc) {
		this.linkSrc = linkSrc;
	}

	public String getLinkTitle() {
		return linkTitle;
	}

	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}

	public String getAssignNo() {
		return assignNo;
	}

	public void setAssignNo(String assignNo) {
		this.assignNo = assignNo;
	}

	public List<CommonsMultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "LectureBoardDTO [lectureNo=" + lectureNo + ", classCode=" + classCode + ", cateCode=" + cateCode
				+ ", subcateCode=" + subcateCode + ", lectureTitle=" + lectureTitle + ", lectureContent=" + lectureContent
				+ ", lectureDate=" + lectureDate + ", fileNo=" + fileNo + ", fileSrc=" + fileSrc + ", linkNo=" + linkNo
				+ ", linkSrc=" + linkSrc + ", linkTitle=" + linkTitle + ", assignNo=" + assignNo + ", files=" + files + "]";
	}




}

