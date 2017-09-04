<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="${pageContext.request.contextPath}/resources/assets/css/student_table.css" rel="stylesheet" />
   
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->

	<div class="row">
		<div class="col-sm-12">
			<button class="save btn btn-primary">Save Order</button>
	<!--  회원 리스트 -->
	<div class="memberlist" id="studentlist">
		<img src="${pageContext.request.contextPath}/resources/assets/img/st_006.jpg" class="photo_img"/>
		<span>노지영</span>
	</div>	
<!-- 분단 나눠서 담기  -->

<!--  분단 나눠서 담는 div 끝-->
<!--원모양 start -->
<div class="container">
	<div class="product">
	<img src="${pageContext.request.contextPath}/resources/assets/img/st_006.jpg" class="photo_img"/>
	 	<span>박소현</span>
	 	<input type="hidden" name="email" value="" />
	</div>

	<div class="product">
	<img src="${pageContext.request.contextPath}/resources/assets/img/st_003.jpg" class="photo_img"/>	
		<span>최석환</span>
		<input type="hidden" name="email" value="" />
	</div>

	<div class="product">
	<img src="${pageContext.request.contextPath}/resources/assets/img/st_004.jpg" class="photo_img"/>		
		<span>위진학</span>
		<input type="hidden" name="email" value="" />
	</div>
</div>	
			<!-- 원모양 end  -->
		</div>
	</div>
</div>
      	 </div>

 <script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
 <script src="${pageContext.request.contextPath}/resources/assets/js/student_table.js"></script>