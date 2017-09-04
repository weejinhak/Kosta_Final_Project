<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link
	href="${pageContext.request.contextPath}/resources/assets/css/teachermain_memo.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/clock.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/teacher/teacher_memo.css"
	rel="stylesheet" />
<!-- 2017.06.22 최은혜 -->


<div class="content">
	<div class="container-fluid">
		<!-- 내용물  contents  -->
	
		<div class="row">
		
		<div id="basicinfo">
		</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="blue">
						<i class="fa fa-clock-o"></i>
					</div>
					<div class="card-content" style="padding-left: -50px;">
						<p class="category">현재시간</p>
						<h3 class="card-title">
							<div id="clock" class="light"
								style="padding-top: 60px; padding-right: 100px; padding-left: -180px;">
								<div class="digits"></div>

							</div>
						</h3>
					</div>
				</div>
			</div>
			<div class="wrapper">
				<div class="row">

					<div id="boardlist"></div>
				</div>

				<!-- 메모 : 2017.06.22 최은혜 -->
				<input type="hidden" value="${sessionScope.email}" id="email"
					name="email">
				<div class="card">
					<div class="card-header card-header-icon"
						data-background-color="rose">
						<i class="material-icons">library_add</i>
					</div>
					<h4 class="card-title">MEMO</h4>

					<div class="card-content memo-content">

						<!-- input폼, 버튼 -->
						<div class="col-md-10">
							<input type="text" class="form-control" placeholder="메모를 입력해 주세요"
								id="checkListItem">
						</div>
						<button class="btn btn-primary btn-round" id="btn">
							<i class="material-icons">check</i>등록
						</button>
						<!-- 여기에 리스트가 들어온다 -->
					</div>

				</div>

			</div>

		</div>
		</div>
		</div>
		
		<!-- 메모 리스트 ajax   -->
		<script type="text/javascript">
			$(function() {

				//글 출력 : 2017.06.21 최은혜

				var email = sessionId;

				$.ajaxSetup({
					cache : false
				});
				$
						.ajax({
							cashe : false,
							type : "post",
							url : "selectMemo.htm",
							data : {
								"email" : email
							},
							dataType : 'json',
							async : false,
							success : function(data) {

								$
										.each(
												data,
												function(index, item) {

													$('.memo-content')
															.append(
																	'<div class="alert alert-primary item col-xs-4" id="'+item.memono+'"> <input type="hidden" class="memoNo" value="'+item.memono+ '" name="memoNo" />'
																			+ item.memotext
																			+ '<button class="deletebutton close" aria-hidden="true" value="'+item.memono+'"><i class="material-icons">close</i></button></div>')

													console.log("memoNO: "
															+ item.memono)
												});

							}

						});
			});
		</script>
		<!-- end 메모  -->

		<!-- <script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
 -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {

				$.ajax({
					type : "get",
					url : "boardmain.htm",
					dataType : 'html',
					success : function(data) {

						$('#boardlist').html(data);

					}
				});
				
				$.ajax({
					type : "GET",
					url : "basicInformation.htm",
					dataType : 'html',
					success : function(data) {

					$('#basicinfo').html(data);

					}
				});

				// Javascript method's body can be found in assets/js/demos.js
				demo.initDashboardPageCharts();

				demo.initVectorMap();
			});
		</script>
		<script
			src="${pageContext.request.contextPath}/resources/assets/js/teacher/teacher_memo.js"></script>
		<!-- 메모 스크립트 -->

		<script
			src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>

		<script
			src="${pageContext.request.contextPath}/resources/assets/js/clock.js"></script>