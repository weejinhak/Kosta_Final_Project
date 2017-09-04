<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>


<div class="card">
   <div class="card-header card-header-icon"
      data-background-color="purple">
      <i class="material-icons">assignment</i>
   </div>
   <div class="card-content">
      <h4 class="card-title">쪽지함</h4>
      <div class="toolbar">
         <!--        여기서부터 내가 값을 넣어 바꿀 수 있는 태그              -->
      </div>
      <div class="material-datatables">
         <div id="datatables_wrapper"
            class="dataTables_wrapper form-inline dt-bootstrap">

            <div class="row">
               <div class="col-sm-12">
                  <table id="datatables"
                     class="table table-striped table-no-bordered table-hover"
                     cellspacing="0" width="100%" style="width: 100%">
                     <thead>
                        <tr>
                           <th class="text-center">쪽지번호</th>
                           <th class="text-center">쪽지내용</th>
                           <th class="text-center">받은시간</th>
                           <th class="text-center">보낸이</th>
                        </tr>
                     </thead>


                     <tbody>
                        <!-- 여기부터 포문  -->
                        <c:forEach var="msglist" items="${msgcontentlist}">
                           <tr>

                              <td class="text-center" id="assignNo">${msglist.messageNo}</td>
                              <td class="text-center">${msglist.msContent}</td>
                              <td class="text-center">${msglist.msSendTime}</td>
                              <td class="text-center">${msglist.name}</td>

                           </tr>

                        </c:forEach>
                  </table>
               </div>
            </div>

         </div>
      </div>
   </div>
   <!-- end content-->
</div>



<script type="text/javascript">
   //카테고리,서브카테고리 select 박스 
   $(document).ready(function() {

      $('#datatables').DataTable({
         "pagingType" : "full_numbers",
         "lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
         responsive : true,
         language : {
            search : "_INPUT_",
            searchPlaceholder : "Search records",
         }

      });

   });
</script>