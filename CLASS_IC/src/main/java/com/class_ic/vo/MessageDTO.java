package com.class_ic.vo;
/*
* @FileName      :   MessageDTO.java
* 
* @Project      :   CLASS-IC
* @Date          :   2017.07.03
* @Author      :   위진학
*/
public class MessageDTO {
   
   int messageNo;
   String msContent;
    String msSendTime;
    String emailS;
    String name;
    

   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public int getMessageNo() {
      return messageNo;
   }
   public void setMessageNo(int messageNo) {
      this.messageNo = messageNo;
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
   public String getEmailS() {
      return emailS;
   }
   public void setEmailS(String emailS) {
      this.emailS = emailS;
   }
   
   
}