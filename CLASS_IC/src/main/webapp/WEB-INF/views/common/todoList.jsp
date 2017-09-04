<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
console.log('jsp까지 들어옴');
</script>

		<ul>
				
					<c:forEach var="list" items="${list}">
					<li><label><input type="checkbox"><i></i><span>${list.todoList}</span><a href='#'  id="${list.todoNo}">–</a></label></li>
				
					</c:forEach>
				</ul>