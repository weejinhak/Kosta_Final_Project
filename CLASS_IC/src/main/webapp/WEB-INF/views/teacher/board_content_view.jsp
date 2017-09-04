<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link href="${pageContext.request.contextPath}/resources/assets/css/board_content.css" rel="stylesheet" />
   <!-- 
@Project : CLASS-IC
@File name : board_details_
@Author : 김은영
@Data : 2017.06.21
@Desc :
 --> 
 
 
 <div class="content">
 
       <div class="container-fluid">


      <div class="col-md-12">
         <div class="card">
            <c:set var="LectureBoardDTO" value="${bvo}" />


            <div class="card-header card-header-text"
               data-background-color="rose">
               <h4 class="card-title">&nbsp; &nbsp;&nbsp;${LectureBoardDTO.cateCode}&nbsp;
                  &nbsp;&nbsp; | ${LectureBoardDTO.subcateCode}&nbsp; &nbsp;&nbsp;</h4>

            </div>

            <div class="card-content ">
               <div id="face">
                  <div class="singlepage old-singlepage">
                     <div class="entry-wrap">
                        <div class="entry">
                           <div id="single-title-wrap">
                              <div id="single-title-block">


                                 <h1 class="new-single-title">${LectureBoardDTO.lectureTitle}</h1>

                                 <div class="single-meta-wrap">
                                    <div class="single-meta-line"></div>
                                    <div class="single-meta">
                                       <span class="sm-dot">·</span> <a>작성일자: ${LectureBoardDTO.lectureDate}</a><span class="sm-dot">·</span> 
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="single-top-ads">
                              <!-- BuySellAds.com Zone Code -->
                              <div id="bsap_672" class="bsap" data-serve="CA7DP">

                                 <article class="entry-content alert alert" >
                                    <p class="single-first-p">${LectureBoardDTO.lectureContent}</p>
                                    <p class="fixed-empty-p">&nbsp;</p>

                                 </article>
                                 <!-- enty-content -->
                              </div>
                              <!-- entry -->
                              
                           </div>
                           <!-- entry-wrap -->
                              
                        </div>
                        
                     </div>
                     
                  </div>
                  
                  <br><br><br><br><br><br><br><br><br><br>
                        <br><br><br><br><br><br><br><br><br><br>

               </div>
               <!--  row 끝-->
               
                  <div class="row">
                     <div class="col-sm-2"></div>
                     <div class="col-sm-2 label-on-left" style="margin-left: -20px; ">첨부 파일</div>

                     <%-- <c:set var="file" value="${bfile}" /> --%>
                     <!-- 파일 첨부  -->
                     <div class="col-md-4 " style="margin-left: -170px;">
                        <div class="card">
                           <div class="card-header"></div>
                           <div class="card-content ">

                              <!-- 여기 파일 뿌려준다  -->
                              <c:forEach var="file" items="${bfile}">
                                 <ul class="mailbox-attachments clearfix">

                                    <li><span class="mailbox-attachment-icon"><i
                                          class="fa fa-file-pdf-o"></i></span>
                                       <div class="mailbox-attachment-info">
                                          <a href="#" class="mailbox-attachment-name"><i
                                             class="fa fa-paperclip"></i> ${file.fileSrc}</a> <span
                                             class="mailbox-attachment-size"> 1,245 KB </span>
                                       </div></li>
                                    <li><span class="mailbox-attachment-icon"><i
                                          class="fa fa-file-word-o"></i></span>

                                       <div class="mailbox-attachment-info">
                                          <a href="#" class="mailbox-attachment-name"><i
                                             class="fa fa-paperclip"></i> App Description.docx</a> <span
                                             class="mailbox-attachment-size"> 1,245 KB </span>
                                       </div></li>
                                    <li><span class="mailbox-attachment-icon has-img"><img
                                          src=" " alt="Attachment"></span>

                                       <div class="mailbox-attachment-info">
                                          <a href="#" class="mailbox-attachment-name"><i
                                             class="fa fa-camera"></i> photo1.png</a> <span
                                             class="mailbox-attachment-size"> 2.67 MB </span>
                                       </div></li>
                                 </ul>

                              </c:forEach>
                           </div>

                        </div>
                        <!--card end  -->
                     </div>
                     <!--col-md-5 end   -->

                     <!-- 파일 첨부 끝 -->

                     <!-- 링크  첨부  -->
                     <label class="col-sm-2 ">관련 링크 </label>
                     <div class="col-md-4" style="margin-left: -160px;">

                        <div class="card">
                           <div class="card-header"></div>

                           <div class="card-content">
                              <c:forEach var="link" items="${blink }">
                                 <%--    <c:set var="link" value= /> --%>
                                 <!--여기에 뿌려준다   -->
                                 <ul class="mailbox-attachments clearfix">
                                    <%--           <li>      링크 제목:${link.linkTitle} </li> 
                                <li>      링크 URL: <a href="${link.linkSrc}">${link.linkSrc}</a> </li><br> --%>
                                    <li>링크 제목:</li>
                                    <li>링크 URL:</li>
                                    <br />

                                 </ul>
                              </c:forEach>
                           </div>

                        </div>
                     </div>
                     <div class="col-sm-1"></div>
                     <!-- 링크 첨부 끝 -->
            <br><br><br><br><br><br>
               <div class="td-actions text-center">
    <button type="button" rel="tooltip" class="btn btn-info btn-round"
               id="list" name="list" onclick="location.href='allboard.htm' ">
               <i class="material-icons">list</i>
            </button>

          <a href="totalboardEdit.htm?lectureNo=${LectureBoardDTO.lectureNo}">
            <button type="submit" rel="tooltip"
               class="btn btn-success btn-round edit">
               <i class="material-icons">done</i>
            </button>
            </a>
            
               </div>

                  </div>
            </div>
            <!-- 카드 끝 -->

         </div>
         <!--12 end  -->

      </div>


   </div> 
<script type="text/javascript">
function myFunction() {
    document.getElementById("editForm").reset();
}


$("#editOk").click(function() {
   editOk(); 
   
});

function editOk(){
   var lectureTitle =$("#lectureTitle").val();
   var lectureContent = $("#lectureContent").val();
   var lectureNo = $("#lectureNo").val();

   $.ajax({ 
      type: 'post' ,
      url: 'totalboardEdit.htm', 
      data:{lectureTitle:lectureTitle,lectureContent:lectureContent,lectureNo:lectureNo },
      dataType:'text',
        success : function(data){
           
            swal({
                title: '수정 완료',
                text: '수정이 완료 되었습니다.',
                type: 'success',
                confirmButtonClass: "btn btn-success",
                buttonsStyling: false
                }).then(function() {
               
                   location.href="allboard.htm"
            })

        },
        error:function(request, status, error){
           alert("수정 실패")
        } });   
   
}
</script>
 