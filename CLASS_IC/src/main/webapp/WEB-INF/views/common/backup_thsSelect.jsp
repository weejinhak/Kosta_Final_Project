<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>CLASS-IC</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- common header -->
<jsp:include page="inc/common_header.jsp"></jsp:include>

</head>

<body>
    <div class="wrapper wrapper-full-page">
    
        <div class="full-page login-page" filter-color="black" data-image="${pageContext.request.contextPath}/resources/assets/img/login.jpeg">
            <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
           
            <div class="content">
               

	<div class="col-xs-3"></div>
	<div class="col-xs-6">
		<div class="row">

			<div class="col-md-4">
				<div class="card card-chart" data-count="3">
					<div class="card-header" data-background-color="blue"
						data-header-animation="true" >
						<div align="center">
						<h3 class="card-title" >
							<br>(테스트용) 151기
						</h3></div>
					</div>
					<div class="card-content">
						<div class="card-actions">
							<button type="button"
								class="btn btn-danger btn-simple fix-broken-card">
								<i class="material-icons">build</i> Fix Header!
							</button>
							<a href="student/main.htm">
							<button type="button" class="btn btn-info btn-simple"
								rel="tooltip" data-placement="bottom" title=""
								data-original-title="go!">
								<i class="material-icons">input</i>
							</button>
							</a>
						</div>
						
						<br>
						<p class="category">
							환영 합니다.
						</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> campaign sent 2 days
							ago
						</div>
					</div>
				</div>
			</div>


<!-- 기수 coutn 해서  if 문 for 문으로 show   -->
			<div class="col-md-4">
				<div class="card card-chart" data-count="4">
					<div class="card-header" data-background-color="rose"
						data-header-animation="true">
						
						<div align="center">
						<h3 class="card-title" >
							<br>KOSTA 152기
						</h3></div>
					</div>
					<div class="card-content">
						<div class="card-actions">
							<button type="button"
								class="btn btn-danger btn-simple fix-broken-card">
								<i class="material-icons">build</i> Fix Header!
							</button>
							
							<button type="button" class="btn btn-info btn-simple"
								rel="tooltip" data-placement="bottom" title=""
								data-original-title="go!">
								<i class="material-icons">input</i>
							</button>
						</div>
					
						<br>
						<p class="category">
							환영 합니다.
						</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> campaign sent 2 days
							ago
						</div>
					</div>
				</div>
			</div>
		
		</div>


	</div>
	<div class="col-xs-3"></div>

</div>
</div>
</div>


</body>

<!-- common footer -->
<!-- 기수 정보 가져오기  -->
<script type="text/javascript">
	/* 페이지 로드시 QR 코드 가져옴. */
	$(document).ready(function() {
   			console.log("페이지가 시작1");
   			var url ="createCode.htm";			 
			$("#img").attr("src", url + "?content=" + 151); 	
	});
	
	/* 페이지 로드시 Session- email에 맞는 기수를 가져오고 그 수만큼 반복.   */
	$(document).ready(function() {
		  console.log("페이지가 시작2");

			$.ajax({
				  type : 'POST',
				  url : 'lecturecodeSelect.htm',
				  dataType : 'html',
				  data: {
				      email : '${sessionScope.email}'
				  },
				  success : function(data){
					  	$('#lecturelist').empty();
						$('#lecturelist').html(data);
				  }
			});
	});
</script>
<!-- 기수 정보 가져오기 끝 -->
<jsp:include page="inc/common_footer.jsp"></jsp:include>
<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
</html>