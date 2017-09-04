$(function(){
		$('#btn_submit_st').click(function(){
    	alert($("#email_st").val());
    		var email_st = $("#email_st").val();
        	var pwd_st = $('#pwd_st').val();
        	var name_st = $('#name_st').val();
        	var phone_st = $('#phone_st').val();
        	var  photoSrc_st = $('#photoSrc_st').val();      	
        	var authority_st  = $('#authority_st').val();
         	
        	var student_data = {"email":email_st, "pwd": pwd_st, "name":name_st , "phone": phone_st,"photoSrc":photoSrc_st, "authority":authority_st };

          $.ajax({
             url: "join_st.htm",
             type: "post",
             data : student_data,
             success : function(data){
                //console.log(student_data);
                alert('학생 회원가입 성공' + "\n" + student_data);
                location.href ="login.htm";
             
             },
             error:function(request, status, error){
                //console.log(error);
                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
                location.href ="join.htm";
             }
          });
       });
       
       $('#btn_submit_te').click(function(){
          
          var email_te = $('#email_te').val();
           var pwd_te = $('#pwd_te').val();
           var name_te = $('#name_te').val();
           var phone_te = $('#phone_te').val();
           var photoSrc_te = $('#photoSrc_te').val();
           var authority_te = $('#authority_te').val();
           var teacher_data = {"email":email_te, "pwd":pwd_te, "name":name_te , "phone":phone_te ,"photoSrc":photoSrc_te, "authority": authority_te };
           
          //alert('클릭');
          $.ajax({
             url: "join_te.htm",
             type: "post",
             data : teacher_data,
             success : function(data){
                //console.log(teacher_data);
                alert('선생 회원가입 성공' + "\n" + teacher_data);
                location.href ="login.htm";
             },
             error:function(request, status, error){
                //console.log(error);
                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
                location.href ="join.htm";
             }
          });
       });

});