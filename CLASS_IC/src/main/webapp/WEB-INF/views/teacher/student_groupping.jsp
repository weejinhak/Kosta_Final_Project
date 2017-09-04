<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- css link -->
<link href="${pageContext.request.contextPath}/resources/assets/css/group.css" rel="stylesheet" />

<div class="content">
       <div class="container-fluid" id="page">
       <select id="groupCode">
      	 <c:forEach var="i" begin="1" end="10">
      	 <option value="${i }">${i }회차</option>
      	 </c:forEach>
      	 </select>
		<!-- 몇 명으로 나눌 것인가, 이것은 member 총 인원수 / 1부터 총인원수 나눈 수를 select 값으로 뿌린다  -->
      	 <select id="bindNum">   	
      	<c:forEach var="i" begin="1" end="${member_count2}" >
      	 <option value="${i }">${i }명씩</option>
      	 </c:forEach>
      	 </select>
      	 <input type="button" id="group_submit_btn"  value="그룹 나누기" class="btn btn-rose"/>
      	 
      	 <input type="button" id="save" value="Save" class="btn btn-primary">
<div id="wrapper">
	<div id="scale">
	</div>
	<!--조 나누기  -->
<div class="canvas">
	<!-- 학생 리스트가 있는 칸 -->
	<!-- 학생 리스트  -->
	<p>학생리스트</p>
	<div class="head" id="head" style="overflow:auto; ">

	<c:forEach var="slist" items="${member_list2}">
		
		<div class="alternative" id="student_${var.index}">
		<img src="${pageContext.request.contextPath}/resources/assets/img/${slist.photoSrc}.jpg" class="photo_img_g"/>
		 ${slist.name }
		 <input type="hidden" name="email" id="email_${var.index}" value="${slist.email }"/>
		</div>
		
		
		</c:forEach>
	</div>
</div>
	<c:set var="count" value="${member_count2}" />
	
	<!-- 조 선택  -->

	<c:forEach var="i" begin="0" end="${member_count2}">
	<div class="tier" id="group${i }"><p>${i }조</p></div>
	</c:forEach>
	</div>
	</div>
	
	
	 
</div>

<!--  js link -->
<script src="${pageContext.request.contextPath}/resources/assets/js/group.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	
	$("#group_submit_btn").click(function() {
		alert("조편성 누르셨구요")

			var groupCodeval = $("#groupCode option:selected").val();
			var bindNumval = $("#bindNum option:selected").val();
	   		var memberCount = ${count};
	   	 	var bindedGroupNum = Math.round(memberCount/bindNumval);
			//var groupName = $(".tier").text();	//이메일이 위치 해 있는 div 의 text() 값 (즉 1조, 2조) 값을 가져온다
			var groupName = new Array(); 
			
			for(var i in bindedGroupNum){
					groupName.push(i);
			}
			//var classCod = session 값으로 기수명(강의코드)를 받아와서 DB에 넣는다.
			
	
		$.ajax({
			url: "groupCon.htm",
			type: "post",
			dataType : 'html',
			data : {"groupCode":groupCodeval, "groupName":groupName , "bindNum": bindNumval, "groupNUm": bindedGroupNum},
			success : function(data){
				//console.log(data);
				alert('조편성 성공');
				$("#groupTable").html(data);
			},
			error:function(request, status, error){
				//console.log(error);
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
			}
		});
		
	});

/* 	var element = "$(.alternative).val()"; 
     x = 0, y = 0;

	interact(element)
		.autoScroll(true)
	    .draggable(true)
	    .snap({
	         mode: 'grid',
	         grid: { x: 10, y: 10 },
	         range: Infinity,
	         elementOrigin: { x: 0, y: 0 }
	     }) 
	    .on('dragmove', function (event) {
	    	event.target.className = event.target.className + "";

	        x += event.dx;
	        y += event.dy;

	        event.target.style.webkitTransform =
	        event.target.style.transform =
	            'translate(' + x + 'px, ' + y + 'px)';
	    })
	    .on('dragend', function (event) {

	        event.target.className = event.target.className + " placed";

	        console.log('dragged a distance of ' + 
	            Math.sqrt(event.dx*event.dx + event.dy*event.dy) + 
	            ' pixels to ' + event.pageX + ', ' + event.pageY);

	        x = 0;
	        y = 0;

	    })
	    .inertia(true)
	    .restrict({
	        drag: 'parent',
	        elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
	        //endOnly: true
	    })
		;
 */

});
</script>
 