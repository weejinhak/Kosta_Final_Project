<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>
<div align="center">
   <h3>교사 통합 관리 페이지</h3>
</div>
<div class="container-fluid">

   <div class="row">

      <div class="col-md-12">

         <div class="card">
            <div class="card-header card-header-icon"
               data-background-color="purple">
               <i class="material-icons">assignment</i>
            </div>
            <div class="card-content">
               <h4 class="card-title">integrated management system</h4>
               <div class="toolbar">
                  <!--        Here you can write extra buttons/actions for the toolbar              -->
               </div>
               <div class="material-datatables">
               
                      <button class="btn btn-just-icon btn-round btn-primary"  data-toggle="modal"
                        data-target="#cateModal">
                        <i class="material-icons">library_add</i><div class="ripple-container"></div></button>
                        &nbsp; &nbsp; &nbsp; &nbsp; 
                        <button class="btn btn-just-icon btn-round btn-primary"  data-toggle="modal"
                        data-target="#subcateModal">
                        <i class="material-icons">library_add</i><div class="ripple-container"></div></button>
        
               
                      <form action="totalboard.htm">
                  <!-- 카테고리 select start -->
                     <div class="dataTables_length" id="datatables_length">
                        <label class="form-group">카테고리<select id="cate"
                           name="cate" aria-controls="datatables"
                           class="form-control input-sm"></select>
                           
                        </label> 
                        &nbsp; &nbsp; &nbsp; &nbsp;
                       <label class="form-group">서브
                           카테고리<select name="subcate" aria-controls="datatables"
                           class="form-control input-sm" id="subcate">
                           </select>
                        </label>
                        &nbsp; &nbsp; &nbsp; &nbsp; 
                  <button type="submit" class="btn btn-just-icon btn-round btn-primary">
                           <i class="material-icons">search</i>
                        </button>                             
                     </div>
                 </form>         
                        
                  <!-- 카테고리 select end -->
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
                           <c:forEach var="LectureBoardDTO" items="${bvo}">
                              <tr>
                                 <td>
                                    <div class="text-center" style="margin-top: -12px;">
                                       <div id="">
                                          <label class="text-center"> <input type="checkbox"
                                             name="multy[]" value="${LectureBoardDTO.lectureNo}">
                                             <span class="checkbox-material"></span>
                                          </label>
                                       </div>
                                    </div>
                                 </td>


                                 <td class="text-center" id="lectureNo">${LectureBoardDTO.lectureNo}</td>
                                 <td class="text-center">${LectureBoardDTO.cateCode}</td>
                                 <td class="text-center">${LectureBoardDTO.subcateCode}</td>


                                 <td class="text-center"><a
                                    href="totalBoard_contentview.htm?lectureNo=${LectureBoardDTO.lectureNo}"
                                    class="btn btn-simple btn-info btn-icon edit">${LectureBoardDTO.lectureTitle}</a>
                                 </td>

                                 <td class="text-center">${LectureBoardDTO.lectureDate}</td>
                                 <td class="text-center"><a
                                    href="totalboardEdit.htm?lectureNo=${LectureBoardDTO.lectureNo}"
                                    class="btn btn-simple btn-primary btn-icon edit"><i class="material-icons">border_color</i></a><%--  <a
                                    class="btn btn-simple btn-danger btn-icon remove"><i
                                       class="material-icons" onclick="deletex()">close</i></a>
                                       <input type="hidden" id="lectureNum" name="lectureNum" value="${LectureBoardDTO.lectureNo}"> --%>
                                 </td>
                              
                              </tr>

                           </c:forEach>
                     </table>
                  </div>

                  <form action="boardcontent.htm">
                     <button type="submit" id="submitFrm"
                        class="btn btn-info btn-round"
                        style="margin-left: 730px; margin-top: 10px; float: left;">
                        <i class="material-icons">done</i>글쓰기
                     </button>
                  </form>

                  <button type="button"class="btn btn-info btn-round"
                     style="margin-left: 20px;" data-toggle="modal"data-target="#noticeModal" id="membersend" >
                     <i class="material-icons">send</i> 기수 보내기
                  </button>


                  <button type="button" id="submitFrm"
                     class="btn btn-info btn-round" style="margin-left: 20px;"
                     onclick="multi_del()">
                     <i class="material-icons">clear</i>체크 삭제
                  </button>
               </div>
            </div>
            <!-- end content-->
         </div>
         <!--  end card  -->
      </div>
      <!-- end col-md-12 -->
   </div></div>
   <!-- end row -->

   <!-- 기수로 보내기 모달 시작 -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->

         <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">


   
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">
                           <i class="material-icons">clear</i>
                        </button>
                        <h5 class="modal-title" id="myModalLabel">기수보내기</h5>
                     </div>
                     <div class="modal-body">
                        <div class="instruction">
                        
                           <!-- 체크한 기수 -->
                           <div class="row" style="margin-left:2px;">
                              <div class="dataTables_length" id="datatables_length">
                                 <label class="form-group">게시글을 보낼 기수를 선택해주세요.
                                 <select id="sendnum" name="send" aria-controls="datatables"
                                    class="form-control input-sm"></select>
                                 </label>
                              </div>
                           </div>

                        </div>
                     </div>
                     <div class="modal-footer text-center">
                        <button type="button" class="btn btn-success btn-simple" onclick="multi_send()">작성</button>
                        <button type="button" class="btn btn-simple" data-dismiss="modal">취소</button>

                     </div>

                  </div>
            

            </div>
         </div>
      </div>
   </div>
   <!--기수로 보내기 모달 끝 -->
<!-- 카테고리 모달 시작 -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->

         <div class="modal fade" id="cateModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">


   
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">
                           <i class="material-icons">clear</i>
                        </button>
                        <h5 class="modal-title" id="myModalLabel">카테고리 추가</h5>
                     </div>
                     <div class="modal-body">
                        <div class="instruction">
                  
                           <!-- 체크한 글의 타이틀 -->
                           <div class="row">
                              <div class="col-md-12">
                                 <input type="text" class="form-control" placeholder="추가할 카테고리를 입력하세요."
                                     name="lectureTitle" value="" id="insertcate">
                              </div>
                           </div>
                           
                     



                        </div>
                     </div>
                     <div class="modal-footer text-center">
                        <button type="button" class="btn btn-success btn-simple" onclick="insertcate()">카테고리 만들기</button>
                        <button type="button" class="btn btn-simple" data-dismiss="modal">취소</button>

                     </div>

                  </div>
            

            </div>
         </div>
      </div>
   </div>
   <!--카테고리 모달 끝 -->
   <!-- 서브 카테고리 모달 시작 -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->

         <div class="modal fade" id="subcateModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">


   
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">
                           <i class="material-icons">clear</i>
                        </button>
                        <h5 class="modal-title" id="myModalLabel">서브 카테고리 추가</h5>
                     </div>
                     <div class="modal-body">
                        <div class="instruction">
                  
                           <!-- 체크한 기수 -->
                           <div class="row" style="margin-left:2px;">
                              <div class="dataTables_length" id="datatables_length">
                                 <label class="form-group">카테고리를 먼저 선택 해주세요
                                 <select id="cate2" name="send" aria-controls="datatables"
                                    class="form-control input-sm"></select>
                                 </label>
                              </div>
                           </div>

                           <!-- 체크한 글의 타이틀 -->
                           <div class="row">
                              <div class="col-md-12">
                                 <input type="text" class="form-control" placeholder="추가할 서브 카테고리를 입력하세요."
                                     name="lectureTitle" value="" id="insertsubcate">
                               </div>
                           </div>
                           



                        </div>
                     </div>
                     <div class="modal-footer text-center">
                        <button type="button" class="btn btn-success btn-simple" onclick="insertsubcate()">서브 카테고리 생성</button>
                        <button type="button" class="btn btn-simple" data-dismiss="modal">취소</button>

                     </div>

                  </div>
            

            </div>
         </div>
      </div>
   </div>
   <!--서브카테고리 모달 끝 -->
   </div>
   

   <script type="text/javascript">

   var email="<%=(String)session.getAttribute("email")%>";

   //카테고리 추가하는 함수
   function insertcate(){
      
      var insertcate=$('#insertcate').val();

       $.ajax({
              type: 'POST',
              url: 'insertcate.htm',
              data: {cateCode:insertcate,cateTitle:insertcate,email:email} ,
              dataType: 'text',
              success: function() {
                  swal({
                      title: 'Success!',
                      text: '카테고리가 추가 되었습니다.',
                      type: 'success',
                      confirmButtonClass: "btn btn-success",
                      buttonsStyling: false
                      }).then(function() {
                     
                         location.href="allboard.htm"
                  })
              },
              error: function() {
                 alert('bad');
              } 

          });
      
   }

   //서브 카테고리 추가하는 함수
   function insertsubcate(){

      var insertsubcate=$('#insertsubcate').val();
      var cateCode=$('#cate2').val();


       $.ajax({
              type: 'POST',
              url: 'insertsubcate.htm',
              data: {subcateCode:insertsubcate,cateCode:cateCode,subcateTitle:insertsubcate,email:email} ,
              dataType: 'text',
              success: function() {
                  swal({
                      title: 'Success!',
                      text: '서브 카테고리가 추가 되었습니다.',
                      type: 'success',
                      confirmButtonClass: "btn btn-success",
                      buttonsStyling: false
                      }).then(function() {
                     
                         location.href="allboard.htm"
                  })
              },
              error: function() {
                 alert('bad');
              } 

          });
   }
   
   //x표시 눌러서 삭제
   function deletex(){
      var lectrueNo = $('#lectureNum').val();
      
          $.ajax({
              type: 'POST',
              url: 'totalBoard_delete.htm',
              data: { lectureNo: lectrueNo} ,
              success: function() {
                  swal({
                      title: 'Deleted!',
                      text: '선택된 글이 삭제되었습니다.',
                      type: 'success',
                      confirmButtonClass: "btn btn-success",
                      buttonsStyling: false
                      }).then(function() {
                     
                         location.href="allboard.htm"
                  })
              },
              error: function() {
                 alert('삭제 실패');
              } 

          }); 
   }
   
   //멀티컨텐츠 기수로 보내기
      function multi_send()
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

       var classCode=$('#sendnum').val();
         jQuery.ajaxSettings.traditional = true;

          $.ajax({
              type: 'GET',
              url: '${pageContext.request.contextPath}/totalBoard_multi_send.htm',
              data: { lectureNo: data, classCode:classCode} ,
              dataType: 'text',
              success: function() {
                  swal({
                      title: 'Success!',
                      text: '선택된 기수로 글이 이동되었습니다.',
                      type: 'success',
                      confirmButtonClass: "btn btn-success",
                      buttonsStyling: false
                      }).then(function() {
                     
                         location.href="allboard.htm"
                  })
              },
              error: function() {
                 alert('bad');
              } 

          });
       

      }
   
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
        url: 'totalBoard_multi_delete.htm',
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
               
                   location.href="allboard.htm"
            })
                
    
        
        },
        error: function() {
           alert('bad');
        } 

    });
 



}


//기수 select 박스
            function sendclass() {
                 
               $.ajax({ 
                  type: 'post' ,
                  url: '${pageContext.request.contextPath}/selectmember.htm', 
                  dataType:'text',
                    success : function(data){
                       
                   $('#sendnum').html(data);
                    
               
                    },
                   error : function(){
                        alert('기수보내기실패!!');
                    } });
              }
             


//카테고리,서브카테고리 select 박스 
   $(document).ready(
         function() {
            
            
            cate();
            sendclass();  
            

            function cate() {
                 
               $.ajax({ 
                  type: 'post' ,
                  url: '${pageContext.request.contextPath}/selectcategory.htm', 
                  dataType:'text',
                    success : function(data){
                   $('#cate').html(data);
                   $('#cate2').html(data);
                   
                    
               
                    },
                   error : function(){
                        alert('통신실패!!');
                        alert(title);
                        alert(content);
                    } });
              }
             
              $('#cate').change(function(event){
                 
                 subcate();
              
              });

              function subcate() {
                 
                 
                 var cate = $("#cate").val();
                 console.log(cate);
                 
                                  $.ajax({
                      url: '${pageContext.request.contextPath}/selectsubcategory.htm',
                      data: {"cate":cate},
                      dataType:'text',
                      type: 'POST',
                      
                      success: function(data){
                    
                        $('#subcate').html(data);
                         
                      }
                  });
         
          }
         
          /* $("#subcate").change (function(){
             var cate = $("#cate").val();
              var subcate = $("#subcate").val();
              
              
             
              console.log("나는야 카테고리 " + cate);
              console.log("나는야 서브카테 " + subcate);
              
              
              if(subcate!='all'){
                 
               
              $.ajax({
                  url:"totalboard.htm",
                  data: {cateCode:cate, subcateCode:subcate},
                  dataType:'html',
                  success:function(data){
                     $('#list').html(data);
                  }
                  });
              
              }
          });
 */          
          

              
              
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