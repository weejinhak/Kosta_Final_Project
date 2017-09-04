package com.class_ic.controller_category;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.MemoDAO;
import com.class_ic.vo.MemoVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
@RequestMapping("teacher")
public class MemoController_teacher {
	
	@Autowired
	private SqlSession sqlsession;
		
		
		//글 등록 : 2017.06.21 최은혜
		@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
		public @ResponseBody void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		      
		       String email=request.getParameter("email");
		       String checkListItem=request.getParameter("checkListItem");
			
			MemoVO vo = new MemoVO();
			vo.setEmail(email);
			vo.setMemoText(checkListItem);
			
			MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
			
			int result = dao.insertMemo(vo);
			
		}
		
		//memo.jsp 글 출력 : 2017.06.21 최은혜
		@RequestMapping(value="selectMemo.htm", method= RequestMethod.POST)
		   public void select(HttpServletRequest request, HttpServletResponse response) throws IOException {
		      
		      String email= request.getParameter("email");
		      
		      MemoVO vo = new MemoVO();
		      vo.setEmail(email);
		      
		      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		      List<MemoVO> memoList = dao.selectMemo(vo);
		   
		       JSONArray array = new JSONArray();

		       for(int i=0;i<memoList.size();i++){
		          JSONObject obj= new JSONObject();
		          obj.put("memotext",memoList.get(i).getMemoText());
		          obj.put("memono", memoList.get(i).getMemoNo());
		          array.add(obj);
		       }
		      response.getWriter().println(array);      
		   }
		
		//memo.jsp 글 출력 : 2017.06.21 최은혜
		@RequestMapping(value="selectMemo2.htm", method= RequestMethod.GET)
		   public ModelAndView select2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		      ModelAndView view= new ModelAndView();
		      view.setViewName("teacher.teacher_main");
		      String email= request.getParameter("email");
		      
		      MemoVO vo = new MemoVO();
		      vo.setEmail(email);
		      
		      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		      List<MemoVO> memoList = dao.selectMemo(vo);
		   
		       JSONArray array = new JSONArray();

		       for(int i=0;i<memoList.size();i++){
		          JSONObject obj= new JSONObject();
		          obj.put("memotext",memoList.get(i).getMemoText());
		          obj.put("memono", memoList.get(i).getMemoNo());
		          array.add(obj);
		       }
		      response.getWriter().println(array);
			return view;      
		   }
		
		//단일 글 출력
		@RequestMapping(value="oneText.htm", method= RequestMethod.POST)
		   public void oneText(HttpServletRequest request, HttpServletResponse response) throws IOException {
		      
		      String email= request.getParameter("email");
		      String memo = request.getParameter("memoNo");
		      int memoNo = Integer.parseInt(memo);
		      		      
		      MemoVO vo = new MemoVO();
		      vo.setEmail(email);
		      vo.setMemoNo(memoNo);
		      
		      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		      MemoVO oneMemo = dao.oneText(vo);
		       
		          JSONObject obj= new JSONObject();
		          obj.put("memotext",oneMemo.getMemoText());
		          obj.put("memono", oneMemo.getMemoNo());
		          
		      response.getWriter().println(obj);      
		   }
		
		
		//글 삭제 : 2017.06.21 최은혜
		@RequestMapping(value="deleteMemo.htm", method=RequestMethod.POST)
		public @ResponseBody void delete(@RequestParam(value="email") String email, @RequestParam(value="memoNo") int memoNo) {
					
			MemoVO vo = new MemoVO();
			vo.setEmail(email);
			vo.setMemoNo(memoNo);
			
			MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
			int result = dao.deleteMemo(vo);
			
			
		}

}
