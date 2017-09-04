$(document).ready(function(){
	
	//#btn 클릭 시 글 등록 된다. 2017.06.21 최은혜
    $('#btn').click(function(){
      
        var email = $('#email').val();
        var checkListItem=$('#checkListItem').val();
        
     if(checkListItem === "") {
    	 alert("다시 입력해주세요");
      
     }else{
    	 $.ajaxSetup({cache:false}); 
    	 $.ajax({
   		  	cashe:false,
 		    url : "insertMemo.htm",
 		  	type : "post",
 			data : { "email" : email, "checkListItem": checkListItem },
 			success : function(item) {
 			
 				location.href= 'selectMemo2.htm';
 				

 			},
 			error : function(request, status, error){
 				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
 			}
 	  });
       
     }
    });
    
    
    //글 삭제(화면) : 2017.06.21 최은혜
    //글 삭제 : 2017.06.21 최은혜
    $(document).on('click', '.deletebutton', function(){
    	var email = $('#email').val();
    	console.log(email)
    	
    	var memoNo = $(this).val();
    	console.log(memoNo)
    	
    	var id="#"+memoNo;
    	
    	var allData = {"email":email, "memoNo":memoNo}
    	
    	$.ajaxSetup({cache:false}); 
    	 $.ajax({
    		
    		cashe:false,
    		async: false,
  		    url : "deleteMemo.htm",
  		  	type : "post",
  			data : allData,
  			success : function(data) {
  				console.log(id)
  				console.log("삭제 성공!!")
  				
  			},
  			error : function(request, status, error){
  				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
  			}
  	  });
    	
        $(id).remove();
        
    });
    
  
    //input창에 focus됬을때 색 변화 :2017.06.21 최은혜
    $('input').focus(function() {
        $(this).css('outline-color', '#CB5C51');
    });
});

