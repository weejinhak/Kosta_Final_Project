<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css"> -->
<link href="${pageContext.request.contextPath}/resources/assets/css/student_list.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/student_list.js" type="text/javascript"></script>
	
<!--   
 <script type="text/javascript">
 $(function() {
	 $(".save").click(function() {
			$(".product").each(function(index) {
				var id = $(this).text(),
					order = index;
				
				console.log("ID: " + id + " | " + "Order: " + order);
			});
		});
	});
 </script> -->
	
<div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->	
      	 <button class="save btn btn-primary">자리 저장</button>
      	 <button class="clear btn btn-primary">리셋</button>		
<div class="container">

	<div class="product record-foo" data-title="Foo Fighters">
		<span>학생이름1</span>
	</div>

	<div class="product record-swift">
		<span>학생이름2</span>
	</div>

	<div class="product record-sheeran">
		<span>학생이름</span>
	</div>

	<!-- <div class="favourites">
		<span>&#9733;</span>
		<span>&#x271a;</span>
	</div>

	<div class="favourites-container">

	</div> -->
</div>	
<!--  -->
		</div>
	</div>
<!-- </div>
</div>
      </div> -->
     