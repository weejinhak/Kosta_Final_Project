package com.class_ic.vo;



public class CalendarDTO {
	private int calNo;
	private String classCode;
	private String calStart;
	private String calEnd;
	private String calTitle;
	private String calContent;
	private String color;
	
	public CalendarDTO() {
		
		
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getCalStart() {
		return calStart;
	}

	public void setCalStart(String calStart) {
		this.calStart = calStart;
	}

	public String getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(String calEnd) {
		this.calEnd = calEnd;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public CalendarDTO(int calNo, String classCode, String calStart, String calEnd, String calTitle, String calContent,
			String color) {
		super();
		this.calNo = calNo;
		this.classCode = classCode;
		this.calStart = calStart;
		this.calEnd = calEnd;
		this.calTitle = calTitle;
		this.calContent = calContent;
		this.color = color;
	}


	
	
}
