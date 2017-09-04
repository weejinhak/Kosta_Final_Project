<!--
   @Project : CLASS-IC
   @File Name : thsSelect.jsp
   @Author : 이현정
   @Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC ""src/main/webapp/WEB-INF/views/common/thsSelect.jsp"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>CLASS-IC</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' dname='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- common header -->
<jsp:include page="inc/common_header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
   /* 페이지 로드시 Session- email에 맞는 기수를 가져오고 그 수만큼 반복.   */
   var sessionId="";
   $(document).ready(function() {
       sessionId="<%=(String)session.getAttribute("email")%>";
        console.log(sessionId);
         $.ajax({
              type : "POST",
              url : "common/lecturecodeSelect.htm",
              dataType : "html",
              success : function(data){
                  $('#lecturelist').html(data);

              },
              error:function(request, status, error){
                      alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
                }
         });
   });
     function addClassCode(){
        
         var classcode =$("#classcode").val();         
         var classstart = $("#classstart").val();         
         var classend = $("#classend").val();         
         var classtitle= $("#classtitle").val();         
         var classopentime = $("#classopentime").val();         
         var classclosetime = $("#classclosetime").val();         
         
         $.ajax({ 
            type: 'post' ,
            url: 'common/lecturecodeadd.htm', 
            data:{
               classcode:classcode,
               classstart:classstart,
               classend:classend,
               classtitle:classtitle,
               classopentime:classopentime,
               classclosetime:classclosetime,
               email:sessionId
            },
            dataType:'html',
              success : function(data){
                  $('#lecturelist').empty();
                 $('#lecturelist').html(data);
              },
              error:function(request, status, error){
                 alert("기수추가 실패")
              } });   
         
      }
</script>


</head>

<body>
    <div class="wrapper wrapper-full-page">    
            <div class="full-page login-page" filter-color="black" data-image="${pageContext.request.contextPath}/resources/assets/img/classic_join00.jpg">
	              <div class="content">
		                  <div class="col-xs-3"></div>
			                  <div class="col-xs-6">
			                       <button class="btn btn-success" data-toggle="modal" data-target="#noticeModal">
			                           <span class="btn-label"><i class="material-icons">check</i>새로운 기수 만들기</span>
			                             </button>
			                        <div class="row">               
					                        <div class="col-md-4">
						                           <div class="card card-chart" data-count="4">
							                              <div class="card-header" data-background-color="red" data-header-animation="true">
							                                 <div align="center">
							                                 <h3 class="card-title" >
							                                    <br>통합 관리
							                                    <br>페이지
							                                 </h3></div>
							                              </div>
							                              <div class="card-content">
							                                 <div class="card-actions">
							                                    <form action="boardcontent.htm" method="POST">
							                                    <button type="submit" class="btn btn-info btn-simple" rel="tooltip" data-placement="bottom" title="" data-original-title="go!">
							                                       <i class="material-icons">input</i>
							                                    </button>
							                                    </form>
							                                 </div>               
							                                    <br>               
							                                 <p class="category">통합 관리 페이지로 이동.</p>
							                              </div>
							                              <div class="card-footer">
							                                 <div class="stats">
							                                    <i class="material-icons">access_time</i> campaign sent 2 days ago
							                                 </div>
							                              </div>
						                           </div>
					                        </div>
			                           <div id="lecturelist"></div>
			                        </div>
			                  </div>
		                  <div class="col-xs-3"></div>
	               </div>
            </div>
	</div>

            <!-- 모달  -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->
         
               <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
                  aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-notice">
                  
                     <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                 <i class="material-icons">clear</i>
                              </button>
                              <h5 class="modal-title" id="myModalLabel">과정 추가</h5>
                           </div>
                                 <div class="modal-body">
                                    <div class="instruction">
                                    <div class="row">
                                          <div class="col-md-12">            
                                               <div class="form-group">
                                                                <label class="label-control">classcode</label>
                                                             <input type="text" class="form-control" id="classcode" name="classcode">
                                                            <span class="material-input"></span>
                                                        </div>
                                          </div>
                                       </div>
                                       <div class="row">
                                          <div class="col-md-12">                                              
                                             <div class="form-group">
                                                          <label class="label-control">과정 시작일</label>
                                                          <input type="text" class="form-control datepicker"  id="classstart" name="classstart">
                                                         <span class="material-input"></span>
                                                      </div>
                                          </div>                                        
                                       </div>
                                       <div class="row">
                                          <div class="col-md-12">                                              
                                             <div class="form-group">
                                                          <label class="label-control">과정 최종일</label>
                                                          <input type="text" class="form-control datepicker" id="classend" name="classend">
                                                          <span class="material-input"></span>
                                                       </div>                                          
                                          </div>                                        
                                       </div>      
                                          <div class="row">
                                          <div class="col-md-12">                                              
                                             <div class="form-group">
                                                          <label class="label-control">과정 이름</label>
                                                          <input type="text" class="form-control" id="classtitle" name="classtitle">
                                                          <span class="material-input"></span>
                                                       </div>                                          
                                          </div>                                        
                                       </div>   
                                       <div class="row">
                                          <div class="col-md-12">            
                                               <div class="form-group">
                                                                <label class="label-control">Time Picker(시작시간)</label>
                                                             <input type="text" class="form-control timepicker"  id="classopentime" name="classopentime">
                                                            <span class="material-input"></span>
                                                        </div>
                                          </div>
                                       </div>
                                       <div class="row">
                                          <div class="col-md-12">            
                                               <div class="form-group">
                                                                <label class="label-control">Time Picker(끝나는 시간)</label>
                                                             <input type="text" class="form-control timepicker"  id="classclosetime" name="classclosetime">
                                                            <span class="material-input"></span>
                                                        </div>
                                          </div>
                                       </div>
                                       
                                    </div>                                     
                                 </div>
                        <div class="modal-footer text-center">
                           <button type="submit" class="btn btn-success btn-simple"  data-dismiss="modal" id="addclassbtn" name="addclassbtn" onclick="addClassCode()">만들기</button>
                           <button type="button" class="btn btn-simple" data-dismiss="modal">취소</button>                           
                        </div>
                        
                     </div>
                </div>
            </div>
      
         <!-- end notice modal -->
          </div>
       </div>
</body>
<!-- common footer -->
<jsp:include page="inc/common_footer.jsp"></jsp:include>

<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();
        demo.initFormExtendedDatetimepickers();
        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
</html>
