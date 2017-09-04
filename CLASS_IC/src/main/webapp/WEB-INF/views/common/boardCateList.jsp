<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
console.log('jsp까지 들어옴');
</script>
	<option value="all"> - - - </option>
<c:forEach items="${listcategory}" var="item"> 
	<option value="${item.cateCode}">${item.cateCode}</option>
</c:forEach>

