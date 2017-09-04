<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
console.log('사진 쿠션페이지');
</script>

           
              <c:set value="${photo}" var="n" />
              <img src="${pageContext.request.contextPath}/resources/upload/${photo.photoSrc}" class="img-circle"
                              width="100" height="100">
         