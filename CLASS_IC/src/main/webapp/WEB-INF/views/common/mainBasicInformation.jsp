<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
console.log('jsp까지 들어옴');
</script>
	<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="orange">
						<i class="material-icons">comment</i>
					</div>
					<div class="card-content">
						<p class="category">강좌 정보</p>
						<h3 class="card-title">${sessionScope.classCode}기</h3>
					</div>
					<div class="card-footer">
						<div class="stats" style="color: black;">

							<h5>${list.classTitle}</h5> 


						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="rose">
						<i class="material-icons">access_time</i>
					</div>
					<div class="card-content">
						<p class="category">강좌 날짜</p>
						<h3 class="card-title" style="font-size: 20px">${list.classStart}</h3>
					</div>
					<div class="card-footer">
						<div class="stats" style="color: black;">
							<h5>${list.classStart}~${list.classEnd}</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="green">
						<i class="material-icons">people</i>
					</div>
					<div class="card-content">
						<p class="category">수강인원</p>
						<h4 class="card-title">${membercount}명</h4>
					</div>
					<div class="card-footer">
						<div class="stats">
							<h5>&nbsp</h5>
						</div>
					</div>
				</div>
			</div>