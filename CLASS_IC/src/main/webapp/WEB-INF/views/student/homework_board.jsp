<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 학생 -->
	 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="row">
					<div class="card">
					<div class="col-lg-8">
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
                         </div>
                         
                         <div class="col-sm-12"> 
							<div id="selectdatatable">
							</div>
                         </div>
					 
					 		</div>
					 </div>
						<!-- 표끝 -->


			</div>

		</div>

      
<script type="text/javascript">
	$(function() {
		
		showMainCate();
		selectAllList();
		
		$("#selectCateList02").change(function(){
			showTeamList();
		});
		
		$('#selectTeamList').click(function(){
			selectCateCodeList();
		});
		

		
			
		//메인카테고리
			function showMainCate() {
				
				var classCode = "<%=(String)session.getAttribute("classCode")%>";	
						
						$.ajax({
							
							type : "post",
							url:"selectMainCate.htm",
							data : {"classCode" : classCode},
							dataType : 'Json',
							success : function(data) {
									
								$.each(data, function(){
									$("#selectCateList02").append("<option value='"+this.cateCode+"'>" + this.cateCode + "</option> ");
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
			
			var classCode = "<%=(String)session.getAttribute("classCode")%>";
			var cateCode = $("#selectCateList02").val();
					
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
							
							selectCateCodeList();
							
				   		}, 
				   		
				   		error:function(request, status, error){
		                    //console.log(error);
		                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
				   		}
				   		
				 });
		} //end showTeamList
		
		//과제게시판 전체 출력
		function selectAllList() {
			
			var email = "<%=(String)session.getAttribute("email")%>";
			var classCode = "<%=(String)session.getAttribute("classCode")%>";
			
			$.ajax({
				
				type : "post",
				url:"selectAllListStudent.htm",
				data : {"email" : email, "classCode": classCode },
				dataType : 'text',
				success : function(data) {
					
					$('#selectdatatable').empty();
					$('#selectdatatable').html(data); 
					console.log(data)
					
		   		}, 
		   		
		   		error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
		   		}
				
			});
			
		}
		
		

		//partyName별 출력
		  /*서브카테고리가 변경이 되면 Ajax를 태움 : 2017.06.29 위진학   */ 
		  function selectCateCodeList() {

				     var partyName=$('#selectTeamList').val();
					 var classCode = "<%=(String)session.getAttribute("classCode")%>";
					 var cateCode = $("#selectCateList02").val();
					 
				     $.ajax({
				    	 type : "post",
				        url:'homeworkSelectList.htm',
				        data:{
				         
				           classCode:classCode,
				           partyName:partyName,
				           cateCode : cateCode
				        },
				        dataType:'html',
				        success:function(data){
				        
				        	$('#selectdatatable').empty();	
				         $('#selectdatatable').html(data);    
				         
				        }
				     });
		}
		
		
		
	}); 
</script>





