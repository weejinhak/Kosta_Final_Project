package com.class_ic.vo;

public class StudentTableDTO {
	private int groupNo;
	
	private String email;
	private String name;

	private String groupCode;
	private String groupName;
	private int bindNum;
	private int groupNum;
	private String order;
	private String classCode;
	private String groupLeaderState;
	
	public StudentTableDTO() {}

	public StudentTableDTO(int groupNo, String email, String name, String groupCode, String groupName, int bindNnum,
			int groupNum, String order, String classCode, String groupLeaderState) {

		this.groupNo = groupNo;
		this.email = email;
		this.name = name;
		this.groupCode = groupCode;
		this.groupName = groupName;
		this.bindNum = bindNnum;
		this.groupNum = groupNum;
		this.order = order;
		this.classCode = classCode;
		this.groupLeaderState = groupLeaderState;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getBindNnum() {
		return bindNum;
	}

	public void setBindNnum(int bindNnum) {
		this.bindNum = bindNnum;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getGroupLeaderState() {
		return groupLeaderState;
	}

	public void setGroupLeaderState(String groupLeaderState) {
		this.groupLeaderState = groupLeaderState;
	}
	

}
