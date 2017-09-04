<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>CLASS-IC</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/material-dashboard.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
    <!--   Core JS Files   -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.1.1.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/material.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!--에디터 추가부분 -->
<link href="${pageContext.request.contextPath}/resources/assets/css/board_editor.css" rel="stylesheet" />

</head>

<body>
    <div class="wrapper">
       
          <!-- side navi 메뉴 영역-->
           <!--   <tiles:insertAttribute name="navi" /> -->  
          <div class="main-panel">
          <!--  header 영역 -->
            <!--  <tiles:insertAttribute name="header" /> -->
           <!--  contents 영역 -->
           
<br>
<br>
<br>
<br>
<script type="text/javascript">

	   $().ready(function() {
        demo.checkFullPageBackgroundImage();
        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
        
       cate();
        



        $("#save").click(function() {
        	save(); 
        	
        });
        
        
       	function save() {
       		
        	var title= $("#title").val();
    		var content=$("#content").val();
    		var cate=$("#cate").val();
    		var subcate=$("#subcate").val();
    		var files = $('#"txtFile"').val();

        	console.log(title);
        	console.log(content);
        	console.log(cate);
        	console.log(subcate);
        	console.log("파일추가"+files);

        	$.ajax({ 
        		type: 'post' ,
        		url: '${pageContext.request.contextPath}/boardcontentsave.htm', 
        		data:{title:title,content:content,cate:cate,subcate:subcate,files:files},
        		dataType:'text',
                success : function(data){
                
                	var title= $("#title").val("");
            		var content=$("#content").val("");
            		var cate=$("#cate").val("");
            		var subcate=$("#subcate").val("");
            		var files = $('#"txtFile"').val();
                },
            	error : function(){
                    alert('통신실패!!');
         
                } });	
        	}
       	
       	function cate() {
       		
        	$.ajax({ 
        		type: 'post' ,
        		url: '${pageContext.request.contextPath}/selectcategory.htm', 
        		dataType:'text',
                success : function(data){
					$('#cate').html(data);
             
           
                },
            	error : function(){
                    alert('통신실패!!');
                    alert(title);
                    alert(content);
                } });
       	}
			
       	$('#cate').change(function(event){
       		
       		subcate();
       	
       	});

       	function subcate() {
       		
       		
       		var cate = $("#cate").val();
       		console.log(cate);
       		
       		$.ajax({
       	        url: '${pageContext.request.contextPath}/selectsubcategory.htm',
       	        data: {"cate":cate},
       	        dataType:'text',
       	        type: 'POST',
       	        
       	        success: function(data){
       	       
       	       	$('#subcate').html(data);
       	           
       	        }
       	    });
		}
    	
    
        
    });
</script>

<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-text" data-background-color="rose">
			<h4 class="card-title">통합 게시판 글 입력하기</h4>
		</div>
		<div class="card-content">
			<div class="row">

				<div class="dataTables_length" id="datatables_length">&nbsp; &nbsp; &nbsp; &nbsp;
					<label class="form-group form-group-sm">카테고리
					<select id="cate"name="datatables_length" aria-controls="datatables"class="form-control">           
					
					</select> 
					<span
						class="material-input">
					</span>
					</label> &nbsp; &nbsp; &nbsp; &nbsp; <label
						class="form-group form-group-sm">서브 카테고리
						
						<select name="datatables_length" aria-controls="datatables"
						class="form-control" id="subcate"></select> <span
						class="material-input"></span></label>
				</div>

				<label class="col-sm-2 label-on-left" style="margin-top: 36px; ">제목  </label><div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						 <input type="text" class="form-control"  style="width: 90%"
					id="title"	name="title"> 
					<span class="help-block">글의 제목을 입력해 주세요.</span> <span class="material-input"></span>
					</div>
				</div>
			</div>

			<div class="row">
				<label class="col-sm-2 label-on-left" style="margin-top: 31px;">내용  </label>
				<div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						<!--에디터 추가부분 -->
						<div class="main">
                         <div id="editor_panel"></div> 
                         <!--에디터 추가부분 -->
						<textarea cols="50" style="width: 90%; height: 600px; color: gray"
							id="content" name="contnet"></textarea>

						<span class="help-block">과제의 제목을 입력해 주세요.</span> <span
							class="material-input"></span>
							<!--에디터 추가부분 -->
							</div>
							<!--에디터 추가부분 -->
					</div>
				</div>
			</div>
			<!--파일 추가 시작  -->
			                                      
                      <div class="col-sm-1">    </div>
                      <div class="col-sm-5">
                      
                        <!-- 파일 첨부  --> 
                                       첨부 파일 #01
                                       
                                    <ul class="mailbox-attachments clearfix">
                                    
                                         <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span>
						&nbsp;<input type="file" id="txtFile" name="files[0]" />
                  <div class="mailbox-attachment-info">  
                    <a href="#" class="mailbox-attachment-name">
                    <i class="fa fa-paperclip"></i></a>
                        <span class="mailbox-attachment-size">
                          파일 사이즈
                     
                        </span>
                  </div>
                </li>
                    
              </ul>
              </div>
                <div class="col-sm-5">
                      
                        <!-- 파일 첨부  --> 
                                       첨부 파일 #02
                                       
                                    <ul class="mailbox-attachments clearfix">
                                    
                                         <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span>
						&nbsp;<input type="file" id="txtFile" name="files[1]" />
                  <div class="mailbox-attachment-info">  
                    <a href="#" class="mailbox-attachment-name">
                    <i class="fa fa-paperclip"></i></a>
                        <span class="mailbox-attachment-size">
                          파일 사이즈
                     
                        </span>
                  </div>
                </li>
                    
              </ul>
              </div>
     
                    </div>
			<!-- 파일 추가 끝 -->

			<div class="td-actions text-center">
				<button type="button" rel="tooltip" class="btn btn-info btn-round"
					id="list" name="list">
					<i class="material-icons">list</i>
				</button>
				<button type="button" rel="tooltip"
					class="btn btn-success btn-round" id="save" name="save">
					<i class="material-icons">done</i>
				</button>
				<button type="button" rel="tooltip" class="btn btn-danger btn-round">
					<i class="material-icons" id="close" name="close">close</i>
				</button>
			</div>
			<br> <br> <br>
		</div>
	</div>

</div>
           <!--   contents 영역 끝 -->
           
        </div>
       
</body>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////  -->
<!--에디터 추가부분 -->
<script src="${pageContext.request.contextPath}/resources/assets/js/board_editor.js"></script>
<!-- Forms Validations Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>
<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- Select Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/sweetalert2.js"></script>
<!--   Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="${pageContext.request.contextPath}/resources/assets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>

</html>