<!--
	@Project : CLASS-IC
	@File Name : thsSelect.jsp
	@Author : 이현정
	@Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
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
	$(document).ready(function() {
		  console.log("페이지가 시작2");
		  var sessionId="<%=(String)session.getAttribute("email")%>";
		  console.log(sessionId);
			$.ajax({
				  type : "POST",
				  url : "common/lecturecodeSelectST.htm",
				  dataType : "html",
				  data: {
				      email: sessionId
				  },
				  success : function(data){
						$('#lecturelist').html(data);
				  },
				  error:function(request, status, error){
		                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
		          }
			});
	});
</script>

</head>
		<body>
		           <div class="wrapper wrapper-full-page">    
					        <div class="full-page login-page" filter-color="black" data-image="${pageContext.request.contextPath}/resources/assets/img/classic_join00.jpg">
							        <div class="content">
										<div class="col-xs-3"></div>
										<div class="col-xs-6">
										<div class="row">					
										</div>
										<div id="lecturelist">
										</div>
										</div>
									</div>
								<div class="col-xs-3"></div>
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