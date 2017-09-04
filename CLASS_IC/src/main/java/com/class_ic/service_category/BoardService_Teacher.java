package com.class_ic.service_category;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.class_ic.vo.LectureBoardDTO;

@Service
public class BoardService_Teacher {

	@Autowired
	private SqlSession sqlsession;

	public String boardWriteServie(LectureBoardDTO board, HttpServletRequest request) throws IOException {

		List<CommonsMultipartFile> files = board.getFiles();
		List<String> filenames = new ArrayList<String>();// 파일명만 추출

		if (files != null && files.size() > 0) {
			// 업로드한 파일이 하나라도 있다면
			for (CommonsMultipartFile multifile : files) {
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/customer/upload");
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
		board.setFileSrc(filenames.get(0));

		LectureBoardDTO lectureboard_dto = sqlsession.getMapper(LectureBoardDTO.class);

		return "redirect:notice.htm";
	}

}
