/*@Project : CLASS-IC
@File name : TodayLectureVO 
@Author : 김은영
@Data : 2017.06.15
@Desc :*/
package com.class_ic.vo;

import java.sql.Date;

public class TodayLectureVO {
   
   
   public TodayLectureVO() {}
   
 

  

   @Override
   public String toString() {
      return "TodayLectureVO [lectureNo=" + lectureNo + ", classCode=" + classCode + ", cateCode=" + cateCode
            + ", subcateCode=" + subcateCode + ", lectureTitle=" + lectureTitle + ", lectureContent="
            + lectureContent + ", lectureDate=" + lectureDate + ", duplicate=" + duplicate + ", todayNo=" + todayNo
            + ", lectureBM=" + lectureBM + ", toString()=" + super.toString() + "]";
   }

 

   private int lectureNo ; 

   private String classCode;
   private String cateCode;
   private String subcateCode;
   private String lectureTitle;
   private String lectureContent; 
   private Date lectureDate; 
   private int duplicate ;



   private int todayNo ; 
   
   public int getTodayNo() {
      return todayNo;
   }






   public void setTodayNo(int todayNo) {
      this.todayNo = todayNo;
   }




   
   
   public int getDuplicate() {
      return duplicate;
   }



   public void setDuplicate(int duplicate) {
      this.duplicate = duplicate;
   }




   
   public Date getLectureBM() {
      return lectureBM;
   }

   public void setLectureBM(Date lectureBM) {
      this.lectureBM = lectureBM;
   }

   private Date lectureBM ;

   
   
   
   public int getLectureNo() {
      return lectureNo;
   }
   public void setLectureNo(int lectureNo) {
      this.lectureNo = lectureNo;
   }
   public String getClassCode() {
      return classCode;
   }
   public void setClassCode(String classCode) {
      this.classCode = classCode;
   }
   public String getCateCode() {
      return cateCode;
   }
   public void setCateCode(String cateCode) {
      this.cateCode = cateCode;
   }
   public String getSubcateCode() {
      return subcateCode;
   }
   public void setSubcateCode(String subcateCode) {
      this.subcateCode = subcateCode;
   }
   public String getLectureTitle() {
      return lectureTitle;
   }
   public void setLectureTitle(String lectureTitle) {
      this.lectureTitle = lectureTitle;
   }
   public String getLectureContent() {
      return lectureContent;
   }
   public void setLectureContent(String lectureContent) {
      this.lectureContent = lectureContent;
   }
   public Date getLectureDate() {
      return lectureDate;
   }
   public void setLectureDate(Date lectureDate) {
      this.lectureDate = lectureDate;
   }

 
}