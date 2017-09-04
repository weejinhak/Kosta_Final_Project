<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
console.log('jsp까지 들어옴');
</script>
<!--
		이름, 사진 (email 로 member table하고 join 해서 select 해오면 될 것 같고 
		조 이름 (grouptTable count 만큼 for문 돌리면 될 것 같고) 그 {i}값 으로 class 명 주면 될 것 같고 
		order를 어떻게 할 것인가의 문제
	
	1)	div alter class의 index = order
		
	2) div groupTable 이름에 따라서 append <div alter>
		추가) 조장 체크 
		
		3) 문제점: 회차별 조편성 보기 제공 추구 추가

  -->
<%-- <c:forEach var="setting" items="${settinglist}">
	${setting.groupCode}<br/>
	${setting.groupName }<br/>
	${setting.bindNum }<br/>
	</c:forEach>
	
	<c:forEach var="i" begin="0" end="${setting.groupNum}">
	<div class="tier tier${i} }" ><p>${i }조</p></div>
	</c:forEach> --%>
<%-- <c:forEach var="setting" items="${settinglist}">
<c:forEach var="i" begin="0" end="${member_count2}">
	<div class="${setting.groupTable}"><p>${setting.groupTable}조</p>
		<div class="alternative" id="student_${var.index}">
		<img src="${pageContext.request.contextPath}/resources/assets/img/${slist.photoSrc}.jpg" class="photo_img_g"/>
		 ${slist.name }
		 <input type="hidden" name="email" id="email_${var.index}" value="${slist.email }"/>
		</div>
	
	</div>
	</c:forEach>
</c:forEach> --%>

<!-- container-fluid 이후는 새로 페이지 구성해버리자! -->
<!-- ${settinglist} -->
<!-- <div id="wrapper">
	<div id="scale">
	</div>
	조 나누기 
<div class="canvas">
</div>	 -->
	<!-- 조 선택  -->
<script type="text/javascript">
$('.tier').each(function(index) {
	console.log($('.tier').attr('id'))
	//var tablename=$('.tier').attr('id');
});
</script>

	<c:forEach var="glist" items="${grouplist}" varStatus="status">
	<c:if test="{tablename==glist.groupTale}">
				<div class="alternative" id="student_${var.index}">
				<img src="${pageContext.request.contextPath}/resources/assets/img/${glist.photoSrc}.jpg" class="photo_img_g"/>
				 ${glist.name }
				 <input type="hidden" name="email" id="email_${var.index}" value="${glist.email }"/>
				</div>
	</c:if>
	</c:forEach>
	
	<!-- 
	</div> -->

	<!-- 조편성 페이지 이동 버튼 선생권한일때만 show 하게 설정 변경 -->
	<input type="button" id="group_edit"  value="그룹편성GO!" class="btn btn-rose"/>