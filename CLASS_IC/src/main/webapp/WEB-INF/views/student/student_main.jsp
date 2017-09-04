<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath}/resources/assets/css/clock.css"rel="stylesheet" />
 <link href="${pageContext.request.contextPath}/resources/assets/css/todolist.css" rel="stylesheet" />
    
<script type="text/javascript">
$(document).ready(function() {
	
$.ajax({
	
	type : 'GET',
	url : 'basicInformations.htm',
	dataType : 'html',
	success : function(data) {


	$('#basicinfo').html(data);

	}
	,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }

});
});
</script>
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

      </div>
   </div>
   <!--   <div class="wrapper">
            <div class="content"> -->
   <div class="container-fluid">
      <div class="row">


       <div id="boardlist"></div>

         <!--To do list-->

         <div class="col-lg-12 col-md-12">
           		<div class="tdl-holder">
			<h2>TO DO LIST</h2>
			<div class="tdl-content" id="todoListselect">
		
			</div>
			<input type="text" class="tdl-new" name="listContent" id="listContent" placeholder="해야할 일을 쓰세요" style="color: black;">
				</div>
         </div>
         
         </div>
      	 </div>
  </div>
<%-- <script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script> --%>
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
      
      

      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();

      demo.initVectorMap();
   });

    /* TO DO LIST */  
  $(".tdl-new").bind('keypress', function(e){
    var code = (e.keyCode ? e.keyCode : e.which);
    console.log(code);
    
    if(code == 13) {
      var v = $(this).val();
      var s = v.replace(/ +?/g, '');
      if (s == ""){
        return false;
      }else{
    	console.log(v);	
    	
    	$.ajax({
  		url: "TodoListInsertOk.htm",
  		type:'get',
  		dataType : "text",
  		data : {listContent: v},
  		success : function(){
  			console.log(data.listContent)
  		}
  			 }); 
    	  
        $(".tdl-content ul").append("<li><label><input type='checkbox'><i></i><span>"+ v +"</span><a href='#'>–</a></label></li>");
        $(this).val("");
      }
    }
  });
    
    
  $.ajax({
      type : "get",
      url : "todoListselect.htm",
      dataType : 'html',
      success : function(data) {


    	  $("#todoListselect").html(data);

      }
   });
    
  
  


  $(".tdl-content a").bind("click", function(){
	    var listNo = $(this).attr('id');
	    console.log(listNo);
	
	      
    var _li = $(this).parent().parent("li");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function(){
          _li.remove();
        });
        
        
        
        
    	$.ajax({
      		url: "TodoListDelete.htm",
      		type:'get',
      		dataType : "text",
      		data : {listNo: listNo},
      		success : function(){
      			
      		}
      			 }); 
    return false;
  });

  
  
  // for dynamically created a tags
  $(".tdl-content").on('click', "a", function(){
    var _li = $(this).parent().parent("li");
    var listNo = $('#listNo');
  alert(listNo);
    
        _li.addClass("remove").stop().delay(100).slideUp("fast", function(){
          _li.remove();
          
         
        });
        

        
    return false;
  });

</script>


<script	src="${pageContext.request.contextPath}/resources/assets/js/clock.js"></script>