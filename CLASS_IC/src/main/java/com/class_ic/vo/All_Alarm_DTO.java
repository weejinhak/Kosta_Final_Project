package com.class_ic.vo;

public class All_Alarm_DTO {
	private String emailS;
	private String emailR;

	private String msContent;
	private String msSendTime;
	private int messageNo;
	private int readState=1;
	private int deleteStateR=1;
	private int deleteStateS=1;

	
	public String getEmailS() {
		return emailS;
	}
	public void setEmailS(String emailS) {
		this.emailS = emailS;
	}
	public String getEmailR() {
		return emailR;
	}
	public void setEmailR(String emailR) {
		this.emailR = emailR;
	}
	public String getMsContent() {
		return msContent;
	}
	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}
	public String getMsSendTime() {
		return msSendTime;
	}
	public void setMsSendTime(String msSendTime) {
		this.msSendTime = msSendTime;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getReadState() {
		return readState;
	}
	public void setReadState(int readState) {
		this.readState = readState;
	}
	public int getDeleteStateR() {
		return deleteStateR;
	}
	public void setDeleteStateR(int deleteStateR) {
		this.deleteStateR = deleteStateR;
	}
	public int getDeleteStateS() {
		return deleteStateS;
	}
	public void setDeleteStateS(int deleteStateS) {
		this.deleteStateS = deleteStateS;
	}
	
	

}
