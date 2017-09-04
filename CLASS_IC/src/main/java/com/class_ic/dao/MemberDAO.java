/*
* @FileName	:	MemberDAO.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/

package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.MemberDTO;

public interface MemberDAO {
	
	//회원가입
	public int join(MemberDTO member);
	//회원 정보 수정
	public int modify(MemberDTO member);
	//회원 탈퇴
	public int delete(String email);
	//회원 email 값으로 1명 select (회원 수정시 페이지)
	public MemberDTO selectOne(String email);
	//회원 전체 목록 select
	public List<MemberDTO> selectAll();
	//회원 전체 수
	public int selectAllCount();
	//로그인
	public MemberDTO login(String email);	
	//권한주기
	public int insertAuthority(MemberDTO member);
	//email 값으로 권한 확인하기
	public String confirmAuthority(String email);

	//학생인 회원 전체 목록
	public List<MemberDTO> selectAllStudent();
	
	//학원 회원 전체 수 확인
	public int selectAllStudentCount();

}
