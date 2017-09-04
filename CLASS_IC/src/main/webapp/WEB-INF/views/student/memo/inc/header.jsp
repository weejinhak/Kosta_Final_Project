<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- contextpath 가져와서 변수 정의 하고.. -->
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  

<script>
	var sessionId="<%=(String)session.getAttribute("email")%>";
	var sessionClassCode="<%=(String)session.getAttribute("classCode")%>";

	/* 페이지 로드시 QR 코드 가져옴. */
	$(document).ready(function() {		
	      $('#qrclick').click(function() {
				console.log("페이지가 시작1");
				var url ="class_ic/common/createCode.htm";			 
			    $("#img").attr("src", url + "?content=" + sessionClassCode); 	
			
	  	});
	});



   var wsocket;
   var msg;
   function connect() {

	  alert(sessionClassCode + " / " + sessionId);
      console.log(sessionId);
      /* alert("소켓연결!"); */
      wsocket = new WebSocket("ws://192.168.0.125:8090/class_ic/chat-ws.htm?email="+sessionId);
      appendMessage("웹 소켓연결되었습니다.");
      wsocket.onopen = onOpen;
      wsocket.onmessage = onMessage;
      wsocket.onclose = onClose;

   }
   function disconnect() {
      wsocket.close();
   }
   function onOpen(evt) {
      appendMessage("연결되었습니다.");
   }
   function sendMessage() {

      var sendmessage = $("#message").val();
      var remail="a@gmail.com";
      console.log(sendmessage)
      $.ajax({
         type : "get",         
         url : "sendMessage.htm",
         dataType : "html",
         data : {
            "sendmessage" : sendmessage   ,
            "remail": remail
         },
         success : function(data) {
            console.log("성공!!")
         }
      });

      wsocket.send(remail);

   }

   function onMessage(evt) {

      console.log(evt.data+"한테 신호옴!!!");

      $.ajax({

         type : "post",
         dataType : "html",
         url : "newAlarm.htm",
         data : {
            "newAlarm" : evt.data
         },
         success : function(data) {
            console.log("헤더 업데이트 성공");
            console.log(data);
            $('#alarm').empty();
            $('#alarm').html(data);

         }
      });

   }
   function onClose(evt) {
      appendMessage("연결을 끊었습니다.");
   }

   function appendMessage(msg) {
      console.log(msg);

   }

   $(document).ready(function() {
      appendMessage("소켓이 준비되었습니다.");
      connect();
      $('#sendBtn').click(function() {

         sendMessage();

      });

   });
   
   
</script>



<nav class="navbar navbar-transparent navbar-absolute">
   <div class="container-fluid">

      <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav navbar-right">
            <li>[ ${sessionScope.name } ]님 강의실 입장</li>
            <!-- QR  -->
            <li><a href="#pablo" class="dropdown-toggle" data-toggle="dropdown" id="qrclick">
             <i class="material-icons">watch_later</i>
            </a>

               <ul class="dropdown-menu">
                  <center>
		          <img id="img" style="display: none" onload="this.style.display='block'" />
                  </center>
               </ul>
               
             </li>
            <!--QR코드    -->

            <!--쪽지 알림  -->
            <!--아코디언  -->
            <li class="dropdown">
               <div class="dropdown dropdown-accordion"
                  data-accordion="#accordion">
                  <a class="dropdown-toggle" href="#" data-toggle="dropdown"> <i
                     class="material-icons" style="padding-top: 10px; color: #555555">notifications</i>
                     <span class="notification" id="alarm">${sessionScope.totalCount}</span>
                     <p class="hidden-lg hidden-md">
                        Notifications <b class="caret"></b>
                     </p>
                  </a>
                  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                     <li>
                        <div class="panel-group" id="accordion">
                           <div class="panel panel-default">
                              <div class="panel-heading">
                                 <h4 class="panel-title">
                                    <a href="#collapseOne" data-toggle="collapse"
                                       data-parent="#accordion"> 김은영 <span
                                       class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                    </a> <input type="text" id="message" placeholder="메시지를 입력하세요" />
                                    <button id="sendBtn">전송</button>
                                 </h4>
                              </div>
                           </div>
                        </div>
                     </li>
                  </ul>
               </div>

            </li>
            <!-- 아코디언 끝 -->

            <!--쪽지알림 끝  -->

            <!--즐겨찾기  -->
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown"> <i class="material-icons">book</i>

            </a>
               <ul class="dropdown-menu">
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
               </ul></li>

            <!--설정.마이페이지.로그아웃.-->


            <li><a href="#pablo" class="dropdown-toggle"
               data-toggle="dropdown"> <i class="material-icons">brightness_low</i>
                  <p class="hidden-lg hidden-md">option</p>
            </a>

            <!-- 회원정보 수정  -->
               <ul class="dropdown-menu">
                  <center>
                     <li>

                        <div class="photo">
                           <!-- <img src="../../assets/img/faces/avatar.jpg" class="img-circle"
                              width="100" height="100"> -->
                              <img src="${contextPath }/member_img/3.png" class="img-circle"
                              width="100" height="100">
                        </div>
                     <li>
                     <br>
                         <button class="btn btn-primary btn-raised btn-round" data-toggle="modal" data-target="#memberUpdate">
                                                  회원정보 수정
                          </button>
                     </li>
                     <!-- 회원정보 수정 Modal -->
                                            <div class="modal fade" id="memberUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                <i class="material-icons">clear</i>
                                                            </button>
                                                            <h4 class="modal-title">회원정보 수정</h4>
                                                        </div>
                                                        <div class="modal-body">
                                      <div class="card">
                                      <div class="card-content">
                                      <form class="form-horizontal">
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">Email</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="email" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">비밀번호</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="password" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">비밀번호 확인</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="password" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <label class="col-md-3 label-on-left">전화번호</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="email" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3"></label>
                                            <div class="col-md-9">
                                                <div class="form-group form-button">
                                                    <button type="submit" class="btn btn-fill btn-rose">회원정보 수정</button>
                                                    <button type="button" class="btn btn-fill" data-dismiss="modal">취소</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                  </div>                      
                                  </div>
                                </div>                        
                          </div>
                     </div>
                                            </div>
                                            <!--  End Modal -->
                     
                     <li><br><!-- 로그아웃 -->
                          <button id="logout" class="btn btn-round"> <a href="${pageContext.request.contextPath}/logout.htm">Logout</a></button>
                     </li>
               </ul></li>

            <li class="separator hidden-lg hidden-md"></li>

            </center>


         </ul>

         <form class="navbar-form navbar-right" role="search">
            <div class="form-group form-search is-empty">
               <input type="text" class="form-control" placeholder="Search">
               <span class="material-input"></span>
            </div>
            <button type="submit" class="btn btn-white btn-round btn-just-icon">
               <i class="material-icons">search</i>
               <div class="ripple-container"></div>
            </button>
         </form>
      </div>
   </div>
</nav>