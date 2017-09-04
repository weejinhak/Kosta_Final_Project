package com.class_ic.vo;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MemberDTO {
	
	private String email; //이메일
	private String name; //이름
	private String pwd; //비번
	private String phone; //전화번호
	private String photoSrc; //이미지 주소
	private String authority;	//security 권한
	private String classCode; 	//기수
	private List<CommonsMultipartFile> files;
	public static final String STUDENT_AUTHORITY = "ROLE_STUDENT";
	
	public MemberDTO(){};
	
	
	
	public MemberDTO(String email, String name, String pwd, String phone, String photoSrc, String authority,
			String classCode, List<CommonsMultipartFile> files) {

		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.photoSrc = photoSrc;
		this.authority = authority;
		this.classCode = classCode;
		this.files = files;
	}



	public List<CommonsMultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhotoSrc() {
		return photoSrc;
	}
	public void setPhotoSrc(String photoSrc) {
		this.photoSrc = photoSrc;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	//임시 toString
	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", name=" + name + ", pwd=" + pwd + ", phone=" + phone + ", photoSrc="
				+ photoSrc + ", classCode=" + classCode + "]";
	}
	
	
	
	

}
