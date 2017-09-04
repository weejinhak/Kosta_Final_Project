<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>


   <div class="row">

      <div class="col-md-12">

         <div class="card">
         
            <div class="card-content">
               <h4 class="card-title">${cateCode}/${subcateCode}</h4>
               <div class="toolbar">
                  <!--        Here you can write extra buttons/actions for the toolbar              -->
               </div>
               <div class="material-datatables">

              
                  <div id="list">
                     <table id="datatables"
                        class="table table-striped table-no-bordered table-hover"
                        cellspacing="0" width="100%" style="width: 100%">
                        <thead>
                           <tr>
                              <th class="text-center">check</th>
                              <th class="text-center">글번호</th>
                              <th class="text-center">category</th>
                              <th class="text-center">sub category</th>
                              <th class="text-center">제목</th>
                              <th class="text-center">작성날짜</th>
                              <th class="text-center">Actions</th>
                           </tr>
                        </thead>


                        <tbody>
                           <!-- 여기부터 포문  -->
                           <c:forEach var="LectureBoardDTO" items="${boardlist}">
                              <tr>
                                 <td>
                                   
                                 </td>


                                 <td class="text-center" id="lectureNo">${LectureBoardDTO.lectureNo}</td>
                                 <td class="text-center">${LectureBoardDTO.cateCode}</td>
                                 <td class="text-center">${LectureBoardDTO.subcateCode}</td>


                                 <td class="text-center"><a
                                    href="totalclassBoard_contentview.htm?lectureNo=${LectureBoardDTO.lectureNo}"
                                    class="btn btn-simple btn-info btn-icon edit">${LectureBoardDTO.lectureTitle}</a>
                                 </td>

                                 <td class="text-center">${LectureBoardDTO.lectureDate}</td>
                                 <td class="text-center">
                                    
                                 </td>
                              
                              </tr>

                           </c:forEach>
                     </table>
                  </div>

                  
                  <input type="text" value="${cateCode}" hidden="" name="cateCode">
                  <input type="text" value="${subcateCode}" hidden="" name="subcateCode">
             
               </div>
            </div>
            <!-- end content-->
         </div>
         <!--  end card  -->
      </div>
      <!-- end col-md-12 -->
   </div>
   <!-- end row -->




   <script type="text/javascript">

   var email="<%=(String)session.getAttribute("email")%>";
   var cateCode="<%=(String)request.getAttribute("cateCode")%>";

   
   
//멀티컨텐츠 (삭제 )선택받기
function multi_del()
{

var cnt2 = $("input[name='multy[]']:checked").length;

if(cnt2 < 1){
      swal({
           title: '선택된 게시글이 없습니다.',
           text: '게시글을 선택해주세요.',
           type: 'warning',
           confirmButtonClass: "btn btn-danger",
           buttonsStyling: false
         })
   return;
}

var chk = document.getElementsByName("multy[]");
var len = chk.length;    //체크박스의 전체 개수 
// var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수 
var checkCnt = 0;        //체크된 체크박스의 개수 
var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수  
var cnt = 0;    
var rowid = new Array();   //체크된 체크박스의 모든 value 값을 담는다 

for(var i=0; i<len; i++){

   if(chk[i].checked == true){ 
   checkCnt++;        //체크된 체크박스의 개수 
   checkLast = i;     //체크된 체크박스의 인덱스 
   } 
   }  
  
var count=0;
for(var i=0; i<len; i++){ 
if(chk[i].checked == true){  //체크가 되어있는 값 구분  
rowid.push(chk[i].value); 
count++;
}

}

var data="";
 for(var i=0;i<count;i++){
    if(i==count-1){
     data+= rowid[i];
    
    }else{
       
       data+= rowid[i]+",";
   
    }   
    
    
 
 }


// alert(rowid);    //'value1', 'value2', 'value3' 의 형태로 출력된다.
   //ajax 로  보낼데이터를 배열형태로 허용해준당 
   jQuery.ajaxSettings.traditional = true;

    $.ajax({
        type: 'POST',
        url: 'classtotalBoard_multi_delete.htm',
        data: { data: data } ,
        dataType: 'text',
   
  
        success: function() {
           
            
            swal({
                title: 'Deleted!',
                text: '삭제가 완료 되었습니다.',
                type: 'success',
                confirmButtonClass: "btn btn-success",
                buttonsStyling: false
                }).then(function() {
               location.href="catedetails.htm?cateCode="+cateCode;
               
            })
                
    
        
        },
        error: function() {
           alert('bad');
        } 

    });
 



}





//카테고리,서브카테고리 select 박스 
   $(document).ready(
         function() {

            $('#datatables').DataTable(
                  {
                     "pagingType" : "full_numbers",
                     "lengthMenu" : [ [ 10, 25, 50, -1 ],
                           [ 10, 25, 50, "All" ] ],
                     responsive : true,
                     language : {
                        search : "_INPUT_",
                        searchPlaceholder : "Search records",
                     }

                  });

            var table = $('#datatables').DataTable();


                     
            // Delete a record
            table.on('click', '.remove', function(e) {
               $tr = $(this).closest('tr');
               table.row($tr).remove().draw();
               e.preventDefault();
            });


            $('.card .material-datatables label').addClass('form-group');
         });
    
   
   
   
</script>