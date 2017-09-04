package com.class_ic.vo;

public class LinkDTO {
	private int linkNo;
	private String linkTitle;
	private String linkSrc;
	private int lectureNo;
	public int getLinkNo() {
		return linkNo;
	}
	public void setLinkNo(int linkNo) {
		this.linkNo = linkNo;
	}
	public String getLinkTitle() {
		return linkTitle;
	}
	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}
	public String getLinkSrc() {
		return linkSrc;
	}
	public void setLinkSrc(String linkSrc) {
		this.linkSrc = linkSrc;
	}
	public int getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}
	@Override
	public String toString() {
		return "LinkDTO [linkNo=" + linkNo + ", linkTitle=" + linkTitle + ", linkSrc=" + linkSrc + ", lectureNo="
				+ lectureNo + "]";
	}
	
	
	
}
