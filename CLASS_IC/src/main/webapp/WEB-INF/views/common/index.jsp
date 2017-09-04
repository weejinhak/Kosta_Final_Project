<!--
	@Project : CLASS-IC
	@File Name : index.jsp
	@Author : 이현정
	@Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CLASS-IC</title>
 <link href="${pageContext.request.contextPath}/resources/assets/css/index.css" rel="stylesheet" />
 	
</head>
<body>
<a href="main.htm"><canvas id="scene"></canvas></a>
	<input id="copy" type="hidden" value="CLASS-IC" />

<script src="${pageContext.request.contextPath}/resources/assets/js/index.js" type="text/javascript"></script>
</body>
</html>