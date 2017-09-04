<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- css link -->
<link href="${pageContext.request.contextPath}/resources/assets/css/final_group.css" rel="stylesheet" />

<div class="content">
       <div class="container-fluid">
<<<<<<< HEAD
       <!--  과제 카테고리 나누기 -->
       <%-- <select id="groupCode">
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
      	 <input type="button" id="group_submit_btn"  value="그룹 나누기" class="btn btn-rose"/> --%>
      	 <!-- 과제 카테고리 추가   -->
      	 
       <!--  내용 -->
<div id="dhtmlgoodies_dragDropContainer">
	<div id="topBar">
	</div>
	<div id="dhtmlgoodies_listOfItems">
		<div>
			<p>Available students</p>
		<ul id="allItems">
		<c:forEach  var="list" items="${member_list2 }">
			<li id="${list.email}">${list.name}</li>
			</c:forEach>
		</ul>
		</div>
	</div>
	<div id="dhtmlgoodies_mainContainer">
		<!-- ONE <UL> for each "room" -->
		<div>
			<p>Team a</p>
			<ul id="box1">
				
			</ul>
		</div>
		<div>
			<p>Team B</p>
			<ul id="box2"></ul>
		</div>
		<div>
			<p>Team C</p>
			<ul id="box3">
				
			</ul>
		</div>
		<div>
			<p>Team D</p>
			<ul id="box4"></ul>
		</div>
		<div>
			<p>Team E</p>
			<ul id="box5">
				
			</ul>
		</div>
	</div>
</div>
<div id="footer">
	<form action="aPage.html" method="post"><input type="button" onclick="saveDragDropNodes()" value="Save"></form>
</div>
<ul id="dragContent"></ul>
<div id="dragDropIndicator"><img src="https://www.apollowebstudio.com/screenshots/2015/insert.gif"></div>
<div id="saveContent"><!-- THIS ID IS ONLY NEEDED FOR THE DEMO --></div>
</div>
</div>
<!--  js link -->
<script src="${pageContext.request.contextPath}/resources/assets/js/final_group.js"></script>
<script type="text/javascript">

//과제 카테고리 insert button
/* $(function(){
	$("#group_submit_btn").click(function() {
		alert("조편성 누르셨구요")

			var groupCodeval = $("#groupCode option:selected").val();
			var bindNumval = $("#bindNum option:selected").val();
	   		var memberCount = ${member_count2};
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
}); */
</script>
=======
       <!--  내용 -->
<div id="dhtmlgoodies_dragDropContainer">
	<div id="topBar">
	</div>
	<div id="dhtmlgoodies_listOfItems">
		<div>
			<p>Available students</p>
		<ul id="allItems">
		<c:forEach  var="list" items="${member_list2 }">
			<li id="${list.email}">${list.name}</li>
			</c:forEach>
		</ul>
		</div>
	</div>
	<div id="dhtmlgoodies_mainContainer">
		<!-- ONE <UL> for each "room" -->
		<div>
			<p>Team a</p>
			<ul id="box1">
				
			</ul>
		</div>
		<div>
			<p>Team B</p>
			<ul id="box2"></ul>
		</div>
		<div>
			<p>Team C</p>
			<ul id="box3">
				
			</ul>
		</div>
		<div>
			<p>Team D</p>
			<ul id="box4"></ul>
		</div>
		<div>
			<p>Team E</p>
			<ul id="box5">
				
			</ul>
		</div>
	</div>
</div>
<div id="footer">
	<form action="aPage.html" method="post"><input type="button" onclick="saveDragDropNodes()" value="Save"></form>
</div>
<ul id="dragContent"></ul>
<div id="dragDropIndicator"><img src="https://www.apollowebstudio.com/screenshots/2015/insert.gif"></div>
<div id="saveContent"><!-- THIS ID IS ONLY NEEDED FOR THE DEMO --></div>
</div>
</div>
<!--  js link -->
<script src="${pageContext.request.contextPath}/resources/assets/js/final_group.js"></script>
>>>>>>> branch 'master' of https://github.com/johntei/CLASS-IC.git
