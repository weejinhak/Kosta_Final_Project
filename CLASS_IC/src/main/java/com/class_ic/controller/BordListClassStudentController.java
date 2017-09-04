/*
* 
* @Project      :  CLASS-IC
* @Date          : 2017.07.4
* @Author      :   노지영
*/
package com.class_ic.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.BordListClassStudentService;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

/*
* @Class: BoardListClassController 
* @Date: 2017.07. 1
* @Author: 노지영
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/

@Controller
@RequestMapping("student")
public class BordListClassStudentController {
	 @Autowired
	   private BordListClassStudentService boardclasslistdervice;  
	 
	   //boardList 게시판 이동
	   @RequestMapping(value="board.htm", method=RequestMethod.GET)
	   public ModelAndView board(ModelAndView modal,HttpServletRequest request,HttpServletResponse response){
	      modal=boardclasslistdervice.selectCate(request, response);
	      return modal;
	   }
	
	   @RequestMapping(value="boardmain.htm", method=RequestMethod.GET)
	   public ModelAndView boardMain(ModelAndView modal,HttpServletRequest request,HttpServletResponse response){
	      modal=boardclasslistdervice.selectCateMain(request, response);
	      return modal;
	   }
	   
	   @RequestMapping("boardcontentclass.htm")
	   public ModelAndView boardContent(HttpServletRequest request,ModelAndView model){
	      model=boardclasslistdervice.boardContent(request, model);
	      return model;
	   }

	   //카테고리에서 상세보기 누르면 서브카테고리와 게시글 상세로 들어감
	   @RequestMapping(value="catedetails.htm", method=RequestMethod.GET)
	   public ModelAndView cateDetails(ModelAndView modal,HttpServletRequest request,HttpServletResponse response,String cateCode){
	      modal=boardclasslistdervice.cateDetails(modal, request, response, cateCode);
	      return modal;
	   }
	   
	   //카테고리 서브 카테고리에 알맞는 게시글을 모두 가져옴.
	   @RequestMapping(value="selectcatesubcateboard.htm", method=RequestMethod.GET)
	   public ModelAndView selectCateSubcateboard(ModelAndView modal,HttpServletRequest request,HttpServletResponse response,SubCategoryDTO dto){
	      modal=boardclasslistdervice.selectCateSubcateboard(modal, request, response, dto);
	      return modal;
	   }
	    //게시판 글 상세보기
	    @RequestMapping("totalclassBoard_contentview.htm") 
	    public ModelAndView boardContentDetail(HttpServletRequest request, HttpServletResponse response,LectureBoardDTO bvo ){
	       ModelAndView viewpage = boardclasslistdervice.boardContentDetail(request, response, bvo);
	      return viewpage;
	       
	    }
	   
}
