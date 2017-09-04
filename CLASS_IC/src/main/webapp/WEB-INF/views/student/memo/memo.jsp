<!-- 
@Project : CLASS-IC
@File name : student_memo.jsp
@Author : 최은혜
@Data : 2017.06.15
@Desc :

 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link
	href="${pageContext.request.contextPath}/resources/assets/css/student/student_memo.css"
	rel="stylesheet" /> <!-- 2017.06.15 최은혜 -->
	
<div id="content">
<!-- 메모 : 2017.06.22 최은혜 -->
			<div class="col-md-6 col-md-offset-3">
			<div class="memosize">
			<input type="hidden" value="${sessionScope.email }" id="email" name="email">
				
			</div>
		   </div>			
		</div>
			<div class="card">
			<div class="card-header card-header-icon"
					data-background-color="rose">
					<i class="material-icons">library_add</i>
				</div>
					<h4 class="card-title">MEMO</h4>
					
				<div class="card-content memo-content">
					
					<!-- input폼, 버튼 -->
					 <div class="col-md-10">
					<input type="text" class="form-control" placeholder="메모를 입력해 주세요" id="checkListItem">
					</div>
					<button class="btn btn-primary btn-round" id="btn">
                         <i class="material-icons">check</i>등록
                    </button>
						 	     <!-- 여기에 리스트가 들어온다 -->
				</div>
				
		</div>			
	</div>		
			
</div>				<!-- 메모 리스트 ajax   -->
				<script type="text/javascript">
					$(function() {

						//글 출력 : 2017.06.21 최은혜
						var email = $('#email').val();

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

															$('.memo-content').append(
																			'<div class="alert alert-primary item col-xs-4" id="'+item.memono+'"> <input type="hidden" class="memoNo" value="'+item.memono+ '" name="memoNo" />'
																					+ item.memotext
																					+ '<button class="deletebutton close" aria-hidden="true" value="'+item.memono+'"><i class="material-icons">close</i></button></div>')

															console.log("memoNO: "+ item.memono)
														});

									}

								});
					});
				</script>
				<!-- end 메모  -->
 


  <script
	src="${pageContext.request.contextPath}/resources/assets/js/student/student_memo.js"></script>



</html>