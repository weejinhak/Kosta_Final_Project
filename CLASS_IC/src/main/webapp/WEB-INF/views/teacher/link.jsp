<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
 <div class="content">
                <div class="container-fluid">
                
                   <input type="hidden" value="${sessionScope.classCode}" id="classCode" name="classCode">
        
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="orange">
                                    <i class="material-icons">assignment</i>
                                </div>
                                
                                <div class="card-content">
                                    <h4 class="card-title">링크 게시판</h4>
                                       <div class="toolbar">
                  <!--        Here you can write extra buttons/actions for the toolbar              -->
               </div>
                                     
 
         
         <!-- tab-content -->
 
                
             
                  <!-- 여기서 부터 링크 데이터 테이블           -->
                                                
                                    <div class="material-datatables">
                                        <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                            <thead>
                                            
                                            
                                                <tr>
                              <th class="text-center">check</th>
                                                    <th align="center">링크 제목</th> 
                                                    <th align="center">링크 주소</th> 
                                         
                                                    <th class="disabled-sorting text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <!--  여기서부터 tr td-->
                                                      <c:forEach var="lvo" items="${lvo}">
                                                <tr>
                                                <td>
                                                    <div class="text-center" style="margin-top: -12px;">
                                       <div id="">
                                          <label class="text-center"> <input type="checkbox"
                                             name="multy[]" value="${lvo.linkNo}">
                                             <span class="checkbox-material"></span>
                                          </label>
                                       </div>
                                    </div>
                                                
                                                </td>
                                                    <td>
                                                    ${lvo.linkTitle}
                                                    </td>
                                                    <td>
                                                      <a href="http://${lvo.linkSrc}"  target="_blank">
                                                    ${lvo.linkSrc}</a>  
                                                    </td> 
                                    
                                                    <td class="text-right">
                                                 
                                                    <a href="linkboardEdit.htm?linkNo=${lvo.linkNo}" class="btn btn-simple btn-primary btn-icon edit"><i class="material-icons">border_color</i></a>
                                                     </td>
                                                 
                                                </tr>
                                                </c:forEach>
                                         <!--   tr td 끝-->
                                         
                                         
                                         
                                            </tbody>
                                        </table>
                                        </div>
                                   
                                       <!-- 여기서 부터 링크 데이터 테이블  끝         -->
                                               
                                </div>
                                
                            </div><!--카드 끝  -->
                           
                        </div>
                      
        
                                  <!--  넣어주기 끝-->   
                      
                                     <div align="right">
                  <button class="btn btn-info btn-round" data-toggle="modal"
                     data-target="#noticeModal">
                     <span class="btn-label"> <i class="material-icons">check</i>
                     </span>링크 추가
                  </button>
                  
                        <button type="button" id="submitFrm"
                     class="btn btn-danger btn-round" style="margin-left: 20px;"
                     onclick="multi_del()">
                     <i class="material-icons">clear</i>체크 삭제
                  </button>
               </div>
                  
                        
        
           </div> 
           </div>
       
       <!--  -->
       
    <!-- 모달  -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->
         
         <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
            
            
         <form action="linkInsert.htm" method="POST">         
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="material-icons">clear</i>
                     </button>
                     <h5 class="modal-title" id="myModalLabel">링크 추가</h5>
                  </div>
                  <div class="modal-body">
                     <div class="instruction">
                     
                          
                        
                           <div class="row">
                           <div class="col-md-12">
                            
                              
                           <input type="text" class="form-control" placeholder="링크 이름" id="linkTitle" name="linkTitle">
                           </div>
                         
                        </div>
                        
                              <div class="row">
                           <div class="col-md-12">
                            
                              
                           <input type="text" class="form-control" placeholder="링크 주소" id="linkSrc" name="linkSrc">
                           </div>
                         
                        </div>
                        
                         
                        
                     </div>
                      
                      
                  </div>
                  <div class="modal-footer text-center" >
                     <button type="submit" class="btn btn-success btn-simple" >작성</button>
                     <button type="button" class="btn btn-simple" data-dismiss="modal">취소
                        </button>
                     
                  </div>
               
               </div>
            </form>
               
            </div>
         </div>
           </div>
                  </div>
              
         <!-- end notice modal -->
     
        </div>
         
    
<!-- 단어검색, 게시물표시, 페이징 Javascript -->
 <script type="text/javascript">
 //링크 선택 삭제 
 
 
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
        url: 'linkBoard_multi_delete.htm',
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
               
                   location.href="linkFile.htm"
            })
                
    
        
        },
        error: function() {
           alert('bad');
        } 

    });
 



}

 
 
 
 
 
 //데이터 테이블 
    $(document).ready(function() {
       
       
        $('#datatables').DataTable({
            "pagingType": "full_numbers",
            "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ], //게시물 표시
            responsive: true,
            language: {
                search: "_INPUT_",
                searchPlaceholder: "단어를 입력하세요", //단어검색
            }

        }); 


        var table = $('#datatables').DataTable();

   

        // 삭제 a record
        table.on('click', '.remove', function(e) {
            $tr = $(this).closest('tr');
            table.row($tr).remove().draw();
            e.preventDefault();
        });

 
        

        $('.card .material-datatables label').addClass('form-group');
        
        
    });
    
   
</script>
 <!-- end 단어검색, 게시물표시, 페이징 Javascript -->