<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link href="${pageContext.request.contextPath}/resources/assets/css/teacher/teacher_makeGroup.css" rel="stylesheet" /> <!-- 2017.06.22 최은혜 -->

<div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="row">
					<div class="card">
					<!-- 과제카테고리 / 조  추가-->
					<div class="col-sm-10 col-md-offset-3">
					<!-- 셀렉트 박스(메인 카테고리 선택) -->
					    <div class="col-sm-3">
					         <select  id="selectCateList01" class="form-control selectCateList" title="메인 카테고리 선택해주세요"  >
                                		<option disabled="disabled" selected="selected">카테고리 선택</option>
                             </select>
                         </div>
                         <div class="col-sm-3">
                     <!-- input 박스(조 카테고리 추가) -->
                             <input type="text" class="form-control" placeholder="조를 입력해주세요" id="partyName"> 
                         </div>  
                         <div class="col-sm-3" align="right">
                         <button type="button" class="btn btn-danger btn-round" id="addCateBtn">조 추가</a></button>
                         </div>
                                    
                         </div><!-- end 과제카테고리 / 조  추가-->
					</div>
					<div class="card">
					<div class="col-md-12 col-md-offset-3">
					<!-- 셀렉트 박스(메인 카테고리 선택) -->
					    <div class="col-sm-3">
                                <select id="selectCateList02" class="form-control selectCateList"   title="메인 카테고리 선택" >
                                	<option disabled="disabled" selected="selected">카테고리 선택</option>
                                </select>
                         </div>
                        
                         <div class="col-sm-3">
                    <!--  셀렉트 박스(조 카테고리 선택) -->
                                <select id="selectTeamList" class="form-control" title="조 선택" >
                                	<option disabled="disabled" selected="selected" id="op1">조 선택</option>
                                </select>
                         </div>  
                         <div class="col-sm-3">
                         <button type="button" class="btn btn-danger btn-round" id="addTeamBtn">조 편성</a></button>
                         <button type="button" class="btn btn-round" id="selTeamBtn">조회</a></button>
                         </div>
                         
                         </div>
                         
                               <div class="col-md-12 col-md-offset-3"> 
									    <select multiple size="10" id="from" class="selectName">
									    </select>
									 
									  <div class="controls"> 
									      <a href="javascript:moveSelected('from', 'to')"> <i class="material-icons">keyboard_arrow_right</i></a> 
									      <a href="javascript:moveSelected('to', 'from')"><i class="material-icons">keyboard_arrow_left</i></a> 
									      <a href="javascript:moveAll('from', 'to')"><i class="material-icons">fast_forward</i></a> 
									      <a href="javascript:moveAll('to', 'from')" href="#"><i class="material-icons">fast_rewind</i></a>
									 </div>
									  
									    <select multiple id="to" size="10" name="topics[]" class="selectName"></select>
									
							 
                                </div>
					 		</div>
					 </div>
						<!-- 표끝 -->
			</div>
		</div>



<script type="text/javascript">
$().ready(function() {
	
showMainCate();	
selectStudentName();

$("#selectCateList02").click(function(){
	showTeamList();
});

$("#addCateBtn").click(function() {
	addHomework();
});

$('#addTeamBtn').click(function(){
	insertTeam();
});

$('#selTeamBtn').click(function(){
	selectTeam();
});
	
//메인카테고리 출력	
function showMainCate() {
	
	var email = "<%=(String)session.getAttribute("email")%>";
		
			console.log(email)
			
			$.ajax({
				
				type : "post",
				url:"selectCate.htm",
				data : {"email" : email},
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

//조 출력
function showTeamList() {
	
	var email = "<%=(String)session.getAttribute("email")%>";
	var classCode = "<%=(String)session.getAttribute("classCode")%>";
	var cateCode = $("#selectCateList02").val();
		
	console.log("showTeamList cateCode : "+cateCode)
	console.log(classCode)
	console.log(email)
			
			$.ajax({
				
				type : "post",
				url:"selectTeam.htm",
				data : {"email" : email, "classCode": classCode , "cateCode":cateCode},
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

	//조 : 팀명 저장
	function addHomework() {
		
		var email = "<%=(String)session.getAttribute("email")%>";
		var classCode = "<%=(String)session.getAttribute("classCode")%>";
		
		console.log(email)
		
		var cateCode = $("#selectCateList01 option:selected").val();
		var partyName = $("#partyName").val();
		
		$.ajax({
			
			type : "post",
			url:"addHomework.htm",
			data : {"cateCode": cateCode, "partyName":partyName,"email":email,"classCode":classCode},
			dataType: 'text',
			success : function(data) {
				
					alert("성공");
					
					$("#partyName").val("");
	   		}, 
	   		
	   		error:function(request, status, error){
                //console.log(error);
                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
	   		}
			
		});
		
	}//end addHomework
	
//학생 출력
function selectStudentName() {
		
    	var classCode = "<%=(String)session.getAttribute("classCode")%>";
    	
    	$.ajax({
    		
    		type : "post",
			url:"selectStudent.htm",
			data : {"classCode":classCode},
			dataType: 'Json',
			success : function(data) {
				$("#from").empty();
				$.each(data,function() {
					
					$("#from").append("<option values='"+this.email+"'>"+this.name+"</option>");
					console.log("학생 출력: "+this.email);
				});
				
					
	   		}, 
	   		
	   		error:function(request, status, error){
                //console.log(error);
                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
	   		}
    		
    	});
    	
	}
	
function insertTeam() {

	var selected;
	
	$("#to").each(function(){
		selected = $("#to").text();
		 	console.log("선택자배열: "+selected);
		//var substring_sel = selected.substring(selected.length, selected.length-3);
		//alert(substring_sel);
	});
		 

	var cateCode = $("#selectCateList02").val();
	var partyName= $("#selectTeamList").val();
	var classCode = "<%=(String)session.getAttribute("classCode")%>";
	
	console.log(cateCode+"/"+partyName+"/"+classCode);
	
	$.ajax({
		
		type : "post",
		url:"selectAllInsert.htm",
		data : {"cateCode":cateCode, "partyName":partyName,"selected": selected, "classCode":classCode},
		dataType : 'text',
		success : function(data) {
			$("#to").empty();
			alert("등록성공!");
		}
		
	});
    
}

//조 출력
function selectTeam() {
	
	var cateCode = $("#selectCateList02").val();
	var partyName= $("#selectTeamList").val();
	var classCode = "<%=(String)session.getAttribute("classCode")%>";
	
$.ajax({
		
		type : "post",
		url:"selectStudentTeam.htm",
		data : {"cateCode":cateCode, "partyName":partyName, "classCode":classCode},
		dataType : 'Json',
		success : function(data) {
			
			$("#to").empty();
			$.each(data,function() {
				
				$("#to").append("<option values='"+this.name+"'>"+this.name+"</option>");
				console.log("학생 출력: "+this.name);
			});
			
		}
		
	});
	
}

	
});

</script>


<script src="${pageContext.request.contextPath}/resources/assets/js/teacher/teacher_makeGroup.js"></script> <!-- 조편성 스크립트 -->