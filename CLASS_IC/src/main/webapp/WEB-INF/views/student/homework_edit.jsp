<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<br>
<br>
<br>
<br>

   
   

<div class="col-md-12">
   <div class="card">
      <div class="card-header card-header-text"  data-background-color="purple">
         <h4 class="card-title">과제 게시판 글 수정</h4>
      </div>
      
   
   <c:set var="list" value="${list}" />
      <div class="card-content">
         <div class="row">

            <div class="dataTables_length" id="datatables_length" style="margin-top: -20px; margin-left: -10px;">&nbsp; &nbsp; &nbsp; &nbsp;
               <label class="form-group form-group-sm">조 이름  <br>
                  ${list.partyName }
               <span
                  class="material-input">
               </span>
               </label> &nbsp; &nbsp; &nbsp; &nbsp; <label
                  class="form-group form-group-sm">카테고리 <br>
                   ${list.cateCode }
                   
                   <span class="material-input"></span></label>
            </div>
            <form id="editForm">
            <label class="col-sm-2 label-on-left" style="margin-top: 30px;">제목  </label><div class="col-sm-10">
               <div class="form-group label-floating is-empty">
                  <label class="control-label"></label>
                   <input type="text" class="form-control"  style="width: 90%"
               id="assignTitle"   name="assignTitle" value="${list.assignTitle}"> 
                  
               </div>
            </div>
         </div>

         <input type="hidden" id="assignNo" name="assignNo" value="${list.assignNo}">
         
         <div class="row">
            <label class="col-sm-2 label-on-left"  style="margin-top: 20px;">내용  </label>
            <div class="col-sm-10">
               <div class="form-group label-floating is-empty">
                  <label class="control-label"></label>
                  <textarea cols="50" style="width: 90%; height: 600px; color: gray"
                     id="assignContent" name="assignContent">${list.assignContent}</textarea>

               </div>
            </div>
         </div>
         </form>

         <div class="td-actions text-center">
         
         
            <button type="button" rel="tooltip" class="btn btn-info btn-round"
               id="list" name="list" onclick="location.href='homework.htm' ">
               <i class="material-icons">list</i>
            </button>

         
            <button type="submit" rel="tooltip"
               class="btn btn-success btn-round" id="editOk" name="editOk">
               <i class="material-icons">done</i>
            </button>
            
         
            <button type="button" rel="tooltip" onclick="myFunction()" class="btn btn-danger btn-round">
               <i class="material-icons" >close</i>
            </button>
      
         </div>
         <br> <br> <br>
      
      </div>
     
   
   </div>

</div>

<script type="text/javascript">

var email="<%=(String)session.getAttribute("email")%>";

function myFunction() {
    document.getElementById("editForm").reset();
}


$("#editOk").click(function() {
   editOk(); 
   
});

function editOk(){
   var assignTitle =$("#assignTitle").val();
   var assignContent = $("#assignContent").val();
   var assignNo = $("#assignNo").val();
	var email = "<%=(String)session.getAttribute("email")%>";
	var classCode = "<%=(String)session.getAttribute("classCode")%>";
   $.ajax({ 
      type: 'post' ,
      url: 'homeworkEdit.htm', 
      data:{assignTitle:assignTitle,assignContent:assignContent,assignNo:assignNo,email:email,classCode:classCode},
     
        success : function(data){
           
            swal({
                title: '수정 완료',
                text: '수정이 완료 되었습니다.',
                type: 'success',
                confirmButtonClass: "btn btn-success",
                buttonsStyling: false
                }).then(function() {
					
               	 location.href="homework.htm"
				})

        },
        error:function(request, status, error){
           alert("수정 실패")
        } 
        });   
   
}
</script>