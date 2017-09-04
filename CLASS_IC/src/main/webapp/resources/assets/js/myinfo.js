
$(function(){


	 var sessionId="<%=(String)session.getAttribute('email')%>";
    	  console.log(sessionId);
			$.ajax({
				  type : "POST",
				  url : "/class_ic/getEditInfo.htm",
				  data: {
				      email: sessionId
				  },
				  success : function(data){
						//alert('성공');
						$('.photo').html(data);
				  },
				  error:function(request, status, error){
		              
		                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
		               
		          }
			});
    	  
      
      

});  