<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- css link -->
<link href="${pageContext.request.contextPath}/resources/assets/css/student_group.css" rel="stylesheet" />
 
	
<div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->	
      	 <!-- 조편성하기 -->
      	 조편성
      	 회 차: 
      	 <select id="groupCode">
      	 <c:forEach var="i" begin="1" end="10">
      	 <option value="${i }">${i }회차</option>
      	 </c:forEach>
      	 </select>
      	 <!-- 몇 명으로 나눌 것인가, 이것은 member 총 인원수 / 1부터 총인원수 나눈 수를 select 값으로 뿌린다  -->
      	 <select id="groupName">
    <%--    <c:set var="memberCount" value="${member_count}"/>
      	<c:forEach var="i" begin="1" end="memberCount" > --%> 
      	 <c:forEach var="i" begin="1" end="10" >
      	 <option value="${i }">${i }명씩</option>
      	 </c:forEach>
      	 </select>
      	 <!-- 조이름: <input type="text" id="gropuName" name="groupName" /> -->
      	 <input type="button" id="group_submit_btn"  value="그룹 나누기" class="btn btn-rose"/>
		<!-- 저장 button -->
		<div>
			<form action="aPage.html" method="post">
			<input type="button" onclick="saveDragDropNodes()" value="Save" class="btn btn-primary">
			</form>
		</div>
      	 <!--drag & drop start  -->

<div id="dhtmlgoodies_dragDropContainer">
	<div id="topBar">
	</div>
	<div id="dhtmlgoodies_listOfItems">
		<div>
			<p>학생 리스트</p>
			
		<ul id="allItems">
			<c:forEach var="slist" items="${member_list}">
				<li id="node__${var.index}">
				<%-- <img src="${pageContext.request.contextPath}/resources/assets/img/${slist.photoSrc}.jpg" class="photo_img"/><br/>
				 --%>
				 ${slist.name }</li><br/>
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

<ul id="dragContent"></ul>
<div id="dragDropIndicator"><img src="https://www.apollowebstudio.com/screenshots/2015/insert.gif"></div>
<div id="saveContent"><!-- THIS ID IS ONLY NEEDED FOR THE DEMO --></div>
</div>
</div>
<!--  js link -->
<script src="${pageContext.request.contextPath}/resources/assets/js/student_group.js"></script>