<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 학생 -->
<!--에디터 추가부분 -->
<link href="${pageContext.request.contextPath}/resources/assets/css/board_editor.css" rel="stylesheet" />
<!-- 파일 업로드 추가 부분  -->


<script type="text/javascript">

	   
</script>

<div class="content">

	<div class="col-md-12">
                            <div class="card">
                            <form method="post" action="addHomework.htm" class="form-horizontal" name="frm" id="frm">
                            		<input type="hidden" name="email" id="email" value="${sessionScope.email }">
                            		<input type="hidden" name="classCode" id="classCode" value="${sessionScope.classCode }">
                                    <div class="card-header card-header-text" data-background-color="rose">
                                        <i class="material-icons">library_books</i>
                                    </div>
                                    <div class="card-content">

					<div class="row">
						<div class="col-lg-12">
						<!-- 카테고리 select box -->
						<div class="col-sm-3">
							<select id="selectCateList01" class="form-control selectCateList"
								title="메인 카테고리 선택해주세요" name="cateCode">
								<option disabled="disabled" selected="selected">카테고리 선택</option>
							</select>
						</div>
						<div class="col-sm-3">
							<!--  셀렉트 박스(조 카테고리 선택) -->
							<select id="selectTeamList" class="form-control selectTeamList" title="조 선택" name="partyName">
								<option disabled="disabled" selected="selected" id="op1">조
									선택</option>
							</select>
						</div>
					
								<!-- 제목 -->
                                            <div class="col-sm-5">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="text" class="form-control" placeholder="제목을 입력하세요" id="assignTitle" name="assignTitle">
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                      </div> 
                                        <!-- 내용 -->
                                        <div class="row">
                                        	<div class="col-md-4">
                                        	<textarea rows="20%" cols="100%" id="assignContent" name="assignContent"></textarea>
                                        	</div>
                                        </div>
                                    </div>
                                   </form> 
                                 <!-- 버튼 -->
                                        <div class="row">
                                        	<div class="td-actions text-center">
												<button type="button" rel="tooltip"
													class="btn btn-success btn-round" id="save" name="save">
													<i class="material-icons">done</i>
												</button>
												<button type="button" rel="tooltip" class="btn btn-danger btn-round">
													<i class="material-icons" id="close" name="close">close</i>
												</button>
											</div>
                                        	
                                        </div>
                            </div>
                        </div>
	
</div>
         <!--   contents 영역 끝 -->


<script type="text/javascript">
//화면 갱신 시 메인카테고리 출력
showMainCate();

$("#selectCateList01").change(function(){
	showTeamList();
});

//close 버튼 클릭시
$("#close").click(function() {
	closeBtn();
});

//save 버튼 클릭시
$("#save").click(function() {
	$("#frm").submit();
	
});

//form
$("#frm").submit(function(event) {
	
	var email = $("#email").val();
	var classCode = $("#classCode").val();
	var cateCode = $(".selectCateList").val();
	var partyName = $("#selectTeamList").val();
	var assignNotice = $("#assignNotice").val();
	
	var assignTitle = $("#assignTitle").val();
	var assignContent = $("#assignContent").val();
	
});

//function : 메인 카테고리 출력
function showMainCate() {
	
	var classCode = sessionClassCode;
			
			$.ajax({
				
				type : "post",
				url:"selectMainCate.htm",
				data : {"classCode" : classCode},
				dataType : 'Json',
				success : function(data) {
						
					$.each(data, function(){
						$(".selectCateList").append("<option value='"+this.cateCode+"'>" + this.cateCode + "</option> ");
					});
					
		   		}, 
		   		
		   		error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
		   		}
		   		
		 });
} //end showMainCate

//팀명 List
function showTeamList() {
	
	var classCode = sessionClassCode;
	var cateCode = $("#selectCateList01").val();
			
			$.ajax({
				
				type : "post",
				url:"selectStudentTeam.htm",
				data : { "classCode": classCode , "cateCode":cateCode},
				dataType : 'Json',
				success : function(data) {
					
					 $("#selectTeamList").empty();
					
					$.each(data, function(){
						$("#selectTeamList").append("<option value='"+this.partyName+"'>" + this.partyName + "</option> ");
                            console.log("partyName: "+this.partyName)
                           
					});
					
		   		}, 
		   		
		   		error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
		   		}
		   		
		 });
} //end showTeamList

//function : close버튼 클릭시
function closeBtn() {
		location.href="homework.htm";
}


</script>
<!--에디터 추가부분 -->
<script src="${pageContext.request.contextPath}/resources/assets/js/board_editor.js"></script>
