package com.class_ic.vo;

import java.sql.Date;

public class TodayClassDTO {
   private int lectureBM;
   private int calNO;
   private int lectureNo;
   private String classCode;
   private String cateCode;
   private String subcateCode;
   private String lectureContent;
   private Date lectureDate;
   private String lectureTitle;
   
   

   public TodayClassDTO() {
      
      
   }



   public int getLectureBM() {
      return lectureBM;
   }



   public void setLectureBM(int lectureBM) {
      this.lectureBM = lectureBM;
   }



   public int getCalNO() {
      return calNO;
   }



   public void setCalNO(int calNO) {
      this.calNO = calNO;
   }



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



   public String getLectureTitle() {
      return lectureTitle;
   }



   public void setLectureTitle(String lectureTitle) {
      this.lectureTitle = lectureTitle;
   }



   @Override
   public String toString() {
      return "TodayClassDTO [lectureBM=" + lectureBM + ", calNO=" + calNO + ", lectureNo=" + lectureNo
            + ", classCode=" + classCode + ", cateCode=" + cateCode + ", subcateCode=" + subcateCode
            + ", lectureContent=" + lectureContent + ", lectureDate=" + lectureDate + ", lectureTitle="
            + lectureTitle + "]";
   }





   
   
}