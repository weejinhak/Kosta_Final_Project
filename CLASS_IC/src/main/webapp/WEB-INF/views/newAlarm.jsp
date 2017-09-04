<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<script type="text/javascript">

$(document).ready(function() {  
     gangialarm();
     function gangialarm(from, align){
         type = ['','info','success','warning','danger','rose','primary'];

         color = Math.floor((Math.random() * 6) + 1);

     	$.notify({
         	icon: "notifications",
         	message: "현재<b>"+${sessionScope.totalCount}+"</b>개의 메시지가 도착했습니다."

         },{
             type: type[color],
             timer: 2000,
             placement: {
                 from: from,
                 align: align
             }
         });
 	}
     
  });  
</script>
 ${sessionScope.totalCount}
     