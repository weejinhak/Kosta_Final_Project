package com.class_ic.vo;

public class Test {
	private int boardnum;
	private String title;
	private String content;
	
	public Test() {}
	
	public Test(int boardnum, String title, String content) {
		this.boardnum = boardnum;
		this.title = title;
		this.content = content;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
