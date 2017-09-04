package com.class_ic.dao;

import java.util.ArrayList;
import java.util.List;

import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.ClassByLectureDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

public interface BoardDAO {

	// 통합 게시판 글입력
	int insertBoardContent(LectureBoardDTO lectureBoardDTO);

	// 통합 게시판 카테고리 모두가져오기
	List<CategoryDTO> selectCategory(String email);

	// 통합 게시판 서브 카테고리 모두가져오기
	ArrayList<SubCategoryDTO> selectSubCategory(String email);

	// 자료 DB에 insert (파일 등록)
	public int insertFile(LectureBoardDTO lectureBoardDTO);

	// LectureBoard DAO 옮겨옴

	// 통합게시판 카테고리,서브카테고리 select box
	public ArrayList<LectureBoardDTO> allBoard(SubCategoryDTO dto);

	// action의 x버튼 누르기 삭제
	public void deleteLect(int lectureNo);

	// 모든 글을 긁어옴.
	public ArrayList<LectureBoardDTO> allList(String email);

	// 수정화면에 출력
	public ArrayList<LectureBoardDTO> totalboardEdit(int lectureNo);

	// 수정 완료
	public int totalboardEditOk(LectureBoardDTO dto);

	// 글 상세보기
	public LectureBoardDTO totalBoard_contentview(int lectureNo);

	// 기수 불러오기
	ArrayList<MemberDTO> selectMember(String email);

	// 글 이동하기
	public void boardMultiSend(ClassByLectureDTO dto);

	// ClassByLecture 데이터 모두 가져오기

	public ArrayList<ClassByLectureDTO> selectClassByLecture();

	// 카테고리 추가
	public int insertCate(CategoryDTO dto);

	// 서브 카테고리 추가
	public int insertSubcate(SubCategoryDTO dto);

	// 글 상세보기 (파일 가져오기)
	public ArrayList<LectureBoardDTO> totalBoard_contenFile(int lectureNo);

	// 글 상세보기 (링크 가져오기)
	public ArrayList<LectureBoardDTO> totalBoard_contenLink(int lectureNo);

	// 링크 파일 게시판
	// 링크 리스트
	public ArrayList<LectureBoardDTO> linkList(String classCode);

	// 링크 입력
	public void linkInsert(LectureBoardDTO dto);

	// 링크 삭제
	public void deleteLink(int linkNo);

	// 수정화면에 출력
	public ArrayList<LectureBoardDTO> linkboardEdit(int linkNo);

	// 수정 완료
	public int linkboardEditOk(LectureBoardDTO dto);

}
