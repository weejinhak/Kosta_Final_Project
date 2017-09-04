package com.class_ic.vo;

public class HomeworkDTO {

	private String classCode; // 기수
	private String email; //이메일
	private String name;
	private String cateCode; //메인카테고리 코드
	private String cateTitle; //카테고리 명
	private String partyName; //조 명
	private int assignNo;
	private String assignTitle; //글 제목
	private String assignContent; //글 내용
	private String assignDate; //글 등록일
	private String assignNotice; //공지사항 여부
	private String groupCateNo; //groupCateNo번호
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAssignNo() {
		return assignNo;
	}
	public void setAssignNo(int assignNo) {
		this.assignNo = assignNo;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateTitle() {
		return cateTitle;
	}
	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	public String getAssignTitle() {
		return assignTitle;
	}
	public void setAssignTitle(String assignTitle) {
		this.assignTitle = assignTitle;
	}
	public String getAssignContent() {
		return assignContent;
	}
	public void setAssignContent(String assignContent) {
		this.assignContent = assignContent;
	}
	public String getAssignDate() {
		return assignDate;
	}
	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}
	public String getAssignNotice() {
		return assignNotice;
	}
	public void setAssignNotice(String assignNotice) {
		this.assignNotice = assignNotice;
	}
	public String getGroupCateNo() {
		return groupCateNo;
	}
	public void setGroupCateNo(String groupCateNo) {
		this.groupCateNo = groupCateNo;
	}
	
	
	
}
