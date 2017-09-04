<%--
@Project : CLASS-IC
@File name : student_memo.jsp
@Author : 최은혜
@Data : 2017.06.15
@Desc : 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<link
	href="${pageContext.request.contextPath}/resources/assets/css/student/student_memo_css.css"
	rel="stylesheet" /> <!-- 2017.06.15 최은혜 -->


<div class="content">
	<div id="container">
    <h2>Memo <i class="onOff fa fa-toggle-off" aria-hidden="true"></i></h2>
    <input type="text" placeholder="새로운 메모를 작성해 주세요" class="memo">
    <ul class="newUl">
      <!--  New To-Do items will go here     -->
      
    </ul>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/resources/assets/js/student/student_memo_js.js"></script>


