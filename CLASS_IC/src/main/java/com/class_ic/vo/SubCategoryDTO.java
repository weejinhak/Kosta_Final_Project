package com.class_ic.vo;

import java.util.ArrayList;

public class SubCategoryDTO {

	private String subcateCode;
	private String cateCode;
	private String subcateTitle;
	private String email;
	private String color;
	private ArrayList<LectureBoardDTO> boardlist;
	public ArrayList<LectureBoardDTO> getBoardlist() {
		return boardlist;
	}
	public void setBoardlist(ArrayList<LectureBoardDTO> boardlist) {
		this.boardlist = boardlist;
	}
	public String getSubcateCode() {
		return subcateCode;
	}
	public void setSubcateCode(String subcateCode) {
		this.subcateCode = subcateCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getSubcateTitle() {
		return subcateTitle;
	}
	public void setSubcateTitle(String subcateTitle) {
		this.subcateTitle = subcateTitle;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "SubCategoryDTO [subcateCode=" + subcateCode + ", cateCode=" + cateCode + ", subcateTitle="
				+ subcateTitle + ", email=" + email + ", color=" + color + ", boardlist=" + boardlist + "]";
	}

	
	

}
