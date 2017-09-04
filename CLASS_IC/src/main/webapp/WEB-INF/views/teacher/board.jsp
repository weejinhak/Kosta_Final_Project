<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


           <div class="col-lg-12 col-md-12" style="height: 100px"></div>
<div class="row" style="padding-left: 150px ; padding-right: 150px">
                    
                 	<c:forEach var="SubCategoryDTO" items="${catelist}">
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
                                             </tr>
                                        </thead>
                                        <tbody >
                                        	<c:forEach var="LectureBoardDTO" items="${SubCategoryDTO.boardlist}">
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
                        <!--  board 추가 아이콘  -->
                      <div class="col-lg-6">
                                <div class="card card-pricing card-raised">
                                    <div class="content">
                                        <h6 class="category">plus category</h6>
                                        <div class="icon icon-rose">
                                            <i class="material-icons">note_add</i>
                                        </div>
                                        <h3 class="card-title">board count : ${fn:length(catelist)}</h3>
                                        <p class="card-description">
                                           새로운 게시판을 생성하려면 이곳을 눌러 생성 하십시오!
                                        </p>
                                        <a href="#pablo" class="btn btn-rose btn-round" onclick="cratecate()">add board<div class="ripple-container"></div></a>
                                    </div>
                                </div>
                            </div>  
                    </div>


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
           swal({
             title: '카테고리 생성 완료',
             text: '카테고리 생성이 완료 되었습니다.',
             type: 'success',
             confirmButtonClass: "btn btn-info",
             buttonsStyling: false
             })
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