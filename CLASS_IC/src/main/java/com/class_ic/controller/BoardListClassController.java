package com.class_ic.controller;



import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.app.dto.MemberDTO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.service.BoardClassListService;
import com.class_ic.service.BoardListService;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;



/*
* 
* @Project      :   CLASS-IC
* @Date          :   2017.07.1
* @Author      :   노지영
*/

/*
* @Class: BoardListClassController 
* @Date: 2017.07. 1
* @Author: 노지영
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/



@Controller
public class BoardListClassController {
   

   @Autowired
   private BoardClassListService boardclasslistservice;
   
   //boardList 게시판 이동
   @RequestMapping(value="teacher/board.htm", method=RequestMethod.GET)
   public ModelAndView board(ModelAndView modal,HttpServletRequest request,HttpServletResponse response){

      modal=boardclasslistservice.selectCate(request, response);
      
      return modal;
   }
   
   
   //a
   @RequestMapping(value="teacher/boardmain.htm", method=RequestMethod.GET)
   public ModelAndView boardMain(ModelAndView modal,HttpServletRequest request,HttpServletResponse response){

      System.out.println("teacher/boardmain.htm탐");
      modal=boardclasslistservice.selectCateMain(request, response);
      
      return modal;
   }
   
   
   @RequestMapping("teacher/boardcontentclass.htm")
   public ModelAndView boardContent(HttpServletRequest request,ModelAndView model){
      
      model=boardclasslistservice.boardContent(request, model);
      
      
      return model;

   
   }
   
         
   //게시글 insert(게시판 insert 수업담기 insert) 
   @RequestMapping(value = "classboardcontentsave.htm", method = RequestMethod.POST)
   public String boardContentSave(HttpServletRequest request, LectureBoardDTO lecture) throws IOException{
      
      boardclasslistservice.boardContentSaveService(request, lecture);
      
     return "common/board_content";

    }
   
   //카테고리에서 상세보기 누르면 서브카테고리와 게시글 상세로 들어감
   @RequestMapping(value="teacher/catedetails.htm", method=RequestMethod.GET)
   public ModelAndView cateDetails(ModelAndView modal,HttpServletRequest request,HttpServletResponse response,String cateCode){

   
      modal=boardclasslistservice.cateDetails(modal, request, response, cateCode);
      
      return modal;
   }
   
   //카테고리 서브 카테고리에 알맞는 게시글을 모두 가져옴.
   @RequestMapping(value="teacher/selectcatesubcateboard.htm", method=RequestMethod.GET)
   public ModelAndView selectCateSubcateboard(ModelAndView modal,HttpServletRequest request,HttpServletResponse response,SubCategoryDTO dto){

   
      
      modal=boardclasslistservice.selectCateSubcateboard(modal, request, response, dto);
      
      return modal;
   }
   
   
    
    //수업보드의 action의 x버튼 누르기 삭제 
    @RequestMapping(value="teacher/classBoard_delete.htm", method = RequestMethod.POST ) 
    public String delete(HttpServletRequest request, HttpServletResponse response){ 
        System.out.println("*****************삭제 컨트롤러러러럴럴ㄹ");
       
       String viewpage = boardclasslistservice.delete(request, response);
       
        return viewpage;
    }
    
    //다중삭제 
    @RequestMapping(value="teacher/classtotalBoard_multi_delete.htm" ) 
    public String multi_del(HttpServletRequest request, HttpServletResponse response,Model model) {
       String viewpage =boardclasslistservice.multi_del(request, response,model);
         
         return viewpage;
    }
    
    //통합게시판 수정화면 처리
    @RequestMapping(value="teacher/totalclassboardEdit.htm",method = RequestMethod.GET)
    public ModelAndView  totalboardEdit(LectureBoardDTO dto,HttpServletRequest request,int lectureNo){
         ModelAndView viewpage = boardclasslistservice.totalboardEdit(dto, request, lectureNo);
          
          return viewpage;
           
    }
    
    //수업보드 게시판 글 수정시 형상관리.
    @RequestMapping(value="teacher/totalclassboardEdit.htm", method = RequestMethod.POST )
    public String totalboardEditOk(LectureBoardDTO dto, HttpServletRequest request){
       String viewpage = boardclasslistservice.totalboardEditOk(dto,request);
          
          return viewpage;
    }
    

    
    //게시판 글 상세보기
    @RequestMapping("teacher/totalclassBoard_contentview.htm") 
    public ModelAndView boardContentDetail(HttpServletRequest request, HttpServletResponse response,LectureBoardDTO bvo ){
       ModelAndView viewpage = boardclasslistservice.boardContentDetail(request, response, bvo);
        
      return viewpage;
       
    }
    

    
}

