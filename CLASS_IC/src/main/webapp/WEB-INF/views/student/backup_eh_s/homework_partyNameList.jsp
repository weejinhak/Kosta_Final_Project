<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 학생 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="list" items="${homeworkselectlist}">
<tr>
	<td>${list.assignNo }</td>
	<td>${list.cateCode }</td>
	<td>${list.assignTitle }</td>
	<td>${list.name }</td>
	<td>${list.assignDate }</td>
</tr>
</c:forEach>
