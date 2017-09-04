/*@Project : CLASS-IC
@File name : memo.xml
@Author : 최은혜
@Data : 2017.06.15
@Desc :*/
package com.class_ic.vo;

import java.sql.Date;

public class MemoVO {

	private int memoNo; //메모 글번호
	private String email; //이메일
	private String memoText; //내용
	private Date memoDate; //등록일
	
	
	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemoText() {
		return memoText;
	}
	public void setMemoText(String memoText) {
		this.memoText = memoText;
	}
	public Date getMemoDate() {
		return memoDate;
	}
	public void setMemoDate(Date memoDate) {
		this.memoDate = memoDate;
	}
	
	
}
