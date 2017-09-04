<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


       

                 	<c:forEach var="SubCategoryDTO" items="${catelist}" begin="0" end="3" step="1">
                      <!--JAVA-->
                       <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="${SubCategoryDTO.color}">
                                    <h4 class="card-title">${SubCategoryDTO.cateCode}</h4>
                          			 <p class="category">${SubCategoryDTO.cateCode}의 게시글을 보시려면 details를 눌러주세요.</p> 
                                </div>
                                
                                <div class="card-content table-responsive" style="height: 260px">
                                    <table class="table table-hover">
                               
                                        <thead class="text-warning">
                                            <tr><th>No</th>
                                             <th>Title</th>
                                            <th>subCategory</th>
                               
                    
                               
                                        </tr></thead>
                                        <tbody >
                                        	<c:forEach var="LectureBoardDTO" items="${SubCategoryDTO.boardlist}" >
                                            <tr>
                                        
                                                <td>${LectureBoardDTO.lectureNo}</td>
                                                <td>${LectureBoardDTO.lectureTitle}</td>
                                                <td>${LectureBoardDTO.subcateCode}</td>
                                      
                                            </tr>
                                       
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                  
                                </div>
                                    <div align="center" style="margin-bottom: 20px"> 
                                          <button type="button" 
                                          class="btn btn-round btn-default details" 
                                          value="${SubCategoryDTO.cateCode}">
                                                            Details
                                                        </button>
                                                        </div>
                            </div>
                        </div>
                        
                    
                        </c:forEach>
            

<script type="text/javascript">



     function cratecate(){

         swal({
             title: '카테고리 생성',
             text: '통합게시판에서 생성 됩니다.',
             type: 'warning',
             showCancelButton: true,
             confirmButtonText: '통합게시판에서 생성',
             cancelButtonText: '나중에 생성 할래요 ',
             confirmButtonClass: "btn btn-info",
             cancelButtonClass: "btn btn-rose",
             buttonsStyling: false
         }).then(function() {
         location.href="allboard.htm";
         }, function(dismiss) {
           // dismiss can be 'overlay', 'cancel', 'close', 'esc', 'timer'
           if (dismiss === 'cancel') {
             swal({
               title: 'Cancelled',
               text: '카테고리 생성이 취소 되었습니다',
               type: 'error',
               confirmButtonClass: "btn btn-rose",
               buttonsStyling: false
             })
           }
         })
     }
     
     
    $().ready(function() {

   	 $('.details').click(function click() {
		 var cateCode=$(this).val()
   		 location.href="catedetails.htm?cateCode="+cateCode;
	});
   	 

        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
</html>