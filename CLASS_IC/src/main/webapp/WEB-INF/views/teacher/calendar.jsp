<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

   <div class="content">
      <div class="container-fluid">
         <div class="row">

            <div class="col-md-10 col-md-offset-1">
               <div align="right">
                  <button class="btn btn-danger" data-toggle="modal"
                     data-target="#noticeModal">
                     <span class="btn-label"> <i class="material-icons">check</i>
                     </span> add
                  </button>
               </div>
               <div class="card card-calendar">
                  <div class="card-content" class="ps-child">
                     <div id="fullCalendar"></div>
                  </div>
               </div>
            </div>
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
            
            
         <form action="CalendarInsertOk.htm" method="POST">         
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="material-icons">clear</i>
                     </button>
                     <h5 class="modal-title" id="myModalLabel">일정 추가</h5>
                  </div>
                  <div class="modal-body">
                     <div class="instruction">
                        <div class="row">
                           <div class="col-md-12">                               
                              <div class="start">
                           <div class="form-group">
                                        <label class="label-control" >일정 시작일</label>
                                        <input type="text" class="form-control datepicker" id="calStart" name="calStart">
                                    <span class="material-input"></span></div>
                                    </div>
                                    
                           </div>
                         
                        </div>
                              <div class="row">
                           <div class="col-md-12"> 
                              
                           <div class="form-group">
                                        <label class="label-control">일정 최종일</label>
                                        <input type="text" class="form-control datepicker" id="calEnd" name="calEnd" >
                                    <span class="material-input"></span></div>
                           
                           </div>
                         
                        </div>
                        
                           <div class="row">
                           <div class="col-md-12">
                            
                              
                           <input type="text" class="form-control" placeholder="일정 이름" id="calTitle" name="calTitle">
                           </div>
                         
                        </div>
                        
                              <div class="row">
                           <div class="col-md-12">
                            
                              
                           <input type="text" class="form-control" placeholder="일정 내용" id="calContent" name="calContent">
                           </div>
                         
                        </div>
                        
                              <div class="row">
                           <div class="col-md-12">
                            
                              
                            <input type="hidden" class="form-control" placeholder="교실코드" id="classCode" name="classCode" value="${sessionScope.classCode}" >
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
         
         <!-- end notice modal -->
                  </div>
                  </div>
              
                  
                  

<script type="text/javascript">
    $(document).ready(function() {       
        demo.initFullCalendar();
        demo.initFormExtendedDatetimepickers();
        
    });
</script>
