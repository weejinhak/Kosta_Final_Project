package com.class_ic.vo;

public class BookmarkDTO {
	private int bookmarkNo;
	private String email;
	private int lectureNo;
	private String bookmarkDate;
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}
	public String getBookmarkDate() {
		return bookmarkDate;
	}
	public void setBookmarkDate(String bookmarkDate) {
		this.bookmarkDate = bookmarkDate;
	}
	@Override
	public String toString() {
		return "BookmarkDTO [bookmarkNo=" + bookmarkNo + ", email=" + email + ", lectureNo=" + lectureNo
				+ ", bookmarkDate=" + bookmarkDate + "]";
	}
	
	
}
