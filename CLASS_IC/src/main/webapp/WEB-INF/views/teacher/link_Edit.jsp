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
         <h4 class="card-title">링크 게시판 글 수정</h4>
      </div>
      
      
   
      <div class="card-content">
   
         <div class="row">

            <div class="dataTables_length" id="datatables_length" style="margin-top: -20px; margin-left: -10px;">&nbsp; &nbsp; &nbsp; &nbsp;
               <label class="form-group form-group-sm">링크 게시판 글 수정  <br>
                 
               <span
                  class="material-input">
               </span>
               </label>  
            </div>
            <c:forEach var="list" items="${list}">
                  <form id="editForm">
            <label class="col-sm-2 label-on-left" style="margin-top: 30px;">링크 제목  </label>
            <div class="col-sm-10">
               <div class="form-group label-floating is-empty">
                  <label class="control-label"></label>
                   <input type="text" class="form-control"  style="width: 90%"
               id="linkTitle"   name="linkTitle" value="${list.linkTitle}"> 
                  
               </div>
            </div>
         </div>

         <input type="hidden" id="linkNo" name="linkNo" value="${list.linkNo }">
         
         <div class="row">
            <label class="col-sm-2 label-on-left"  style="margin-top: 20px;"> URL  </label>
            <div class="col-sm-10">
               <div class="form-group label-floating is-empty">
                  <label class="control-label"></label>
                  <textarea cols="50" style="width: 90%; height: 300px; color: gray"
                     id="linkSrc" name="linkSrc">${list.linkSrc}</textarea>

               </div>
            </div>
         </div>
         </form>

         <div class="td-actions text-center">
         
         
            <button type="button" rel="tooltip" class="btn btn-info btn-round"
               id="list" name="list" onclick="location.href='linkFile.htm' ">
               <i class="material-icons">list</i>
            </button>

         
            <button type="submit" rel="tooltip"
               class="btn btn-success btn-round" id="editOk" name="editOk">
               <i class="material-icons">done</i>
            </button>
            
       
         </div>
         <br> <br> <br>
      
      </div>
      <!-- content 끝 -->
      </c:forEach>
   
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
   var linkTitle =$("#linkTitle").val();
   var linkSrc = $("#linkSrc").val();
   var linkNo = $("#linkNo").val();
 
   $.ajax({ 
      type: 'post' ,
      url: 'linkboardEdit.htm', 
      data:{linkTitle:linkTitle,linkSrc:linkSrc,linkNo:linkNo },
      dataType:'text',
        success : function(data){
           
            swal({
                title: '수정 완료',
                text: '수정이 완료 되었습니다.',
                type: 'success',
                confirmButtonClass: "btn btn-success",
                buttonsStyling: false
                }).then(function() {
               
                   location.href="linkFile.htm"
            })

        },
        error:function(request, status, error){
           alert("수정 실패")
        } });   
   
}
</script>