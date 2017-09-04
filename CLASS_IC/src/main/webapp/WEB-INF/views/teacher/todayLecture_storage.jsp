<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 
<div class="content">
   <div class="container-fluid">


      <!-- 내용물  contents  -->

      <div class="row">
         <div class="col-md-8 col-md-offset-2">
            <h2 class="title text-center">
               <b>오늘의 강의 목록</b>
            </h2>
            <br>



            <div class="nav-left">
               <ul class="nav nav-pills nav-pills-warning nav-pills-icons"
                  role="tablist">

                  <!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->


                  <!-- 여기두 섭카테에 따라서.. 바뀌게..포문  -->
              <!--     <li class="active"><a href="#description-1" role="tab"
                     data-toggle="tab" aria-expanded="false"> <i
                        class="material-icons">reorder</i> 
                  </a></li> -->



               </ul>
            </div>

            <!-- tab-content -->
            <div class="tab-content">
               <div class="tab-pane active" id="description-1">
                  <div class="card">
                     <!--  표-->
                     <div class="card-content table-responsive">


                        <table class="table">
                           <thead>
                              <tr>

                                 <th>글 번호</th>
                                 <th>글 제목</th>

                                 <th>작성날짜</th>
                                 <th class="text-center">Actions</th>

                              </tr>
                           </thead>
                           <tbody>

                              <!-- 여기부터 포문  -->
                              <c:forEach var="TodayLectureVO" items="${bvo}">

                                 <tr>

                                    <td>${TodayLectureVO.lectureNo}</td>
                                    <td>${TodayLectureVO.lectureTitle}</td>

                                    <td>${TodayLectureVO.lectureDate}</td>
                                    
                                    
                                    <td class="td-actions text-center">
                                              
                                    <a href="todayLectureDelete.htm?todayNo=${TodayLectureVO.todayNo}" class="btn btn-simple btn-danger btn-icon remove">
                                    <i class="material-icons">close</i></a>
                                          
                                    </td>

                                 </tr>

                              </c:forEach>

                              <tr>
                                 <td colspan="5"><a href="calendar.htm">
                                       <button type="button" id="submitFrm"
                                          class="btn btn-info btn-round" style="margin-left: 50px">캘린더에서
                                          확인하기</button>
                                 </a></td>
                              </tr>

                           </tbody>
                        </table>

                     </div>

                



                  </div>
               </div>



            </div>
         </div>


      </div>

   </div>
   </div>
    
   
   
   
    <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
 
 