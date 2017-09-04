/*
* @FileName	:	JoinService.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.LectureAddDAO;
import com.class_ic.dao.MemberDAO;
import com.class_ic.vo.LectureDTO;
import com.class_ic.vo.MemberDTO;

@Service
public class JoinService {

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 회원가입
	public String join(MemberDTO member, HttpServletRequest request) throws Exception {

		// 사진 파일 업로드 관련
		List<CommonsMultipartFile> files = member.getFiles();
		List<String> filenames = new ArrayList<String>();// 파일명만 추출

		if (files != null && files.size() > 0) {
			// 업로드한 파일이 하나라도 있다면
			for (CommonsMultipartFile multifile : files) {
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/resources/upload");
				String fpath = path + "\\" + filename;
				if (!filename.equals("")) {
					// 서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
				}
				filenames.add(filename);// 실제 DB insert 할 파일명
			}
		}

		// DB작업
		member.setPhotoSrc(filenames.get(0));
		// board.setFileSrc2(filenames.get(1));

		// 사진 파일 업로드 끝

		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		String email = member.getEmail();
		String classCode = email;
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);
		LectureDTO lecture = new LectureDTO();
		lecture.setClassCode(email);
		lecture.setEmail(email);
		String viewpage = "";

		try {
			int result = member_dao.join(member);
			if (result > 0) {
				// 권한처리
				member_dao.insertAuthority(member);
				String memberAuthority = member_dao.confirmAuthority(email);
				if (memberAuthority.equals("ROLE_TEACHER")) {
					// class에 email 값으로 classCode 입력
					lectureDao.insertDefault(lecture);
					// classmember에 classCode와 email 입력
					lectureDao.inputMyClassCode(email, classCode);
				}

				viewpage = "common/main";
			} else {
				viewpage = "join/joinus";
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return viewpage;
	}

}
