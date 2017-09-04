<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="content">
 	<input type="hidden" value="${sessionScope.classCode }" id="classCode" name="classCode" />
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="orange">
                                    <h4 class="card-title">${sessionScope.classCode }기 학생부</h4>
                                </div>
                                <br> 
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                         <tr>
                                         	<th>사진</th>
                                         	<th>email</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                            <!-- 이곳에 내용이온다 -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
      	 </div>
 </div>
 
<script type="text/javascript">
	
	$(function() {
		
		 //1초 마다 출석했는지 확인
		checkAlert = setInterval(function() {
			
			checkStudent();
			console.log("출석 체크")
			
			var hour = new Date().getHours();
			var min = new Date().getMinutes();
			
			if(hour==09 && min == 10){ //오전 9시 10분에 완료
				clearInterval(checkAlert);
				console.log("오늘 출석체크 완료")
			}
			
		}, 5000); 
		
		
		//학생 출석 여부
		function checkStudent() {
			
			var classCode = $("#classCode").val();
			console.log(classCode)
			
			$.ajax({
				
				cashe : false,
				type : "post",
				url : "selectStudent.htm",
				data : {
					"classCode" : classCode
				},
				dataType : "Json",
				success : function(data) {

					$.each(data,function() {
						
						if(this.inClass == undefined){ //inClass에 값이 없으면 (javascript에서 값이 없는것은 undefinde)
							$('#tbody').empty();
							$('#tbody').append('<tr><td><img src="${pageContext.request.contextPath}/resources/assets/img/faces/'+this.photoSrc+'" alt="'+this.name+'" style="width: 60px; opacity: 0.5; background-color: black;" class="img-circle"></td><td>'+this.email+'</td><td>'+this.name+'</td><td>'+this.phone+'</td></tr>')

						}else{
						
							$('#tbody').empty();
							$('#tbody').append('<tr><td><img src="${pageContext.request.contextPath}/resources/assets/img/faces/'+this.photoSrc+'" alt="'+this.name+'" style="width: 60px;" class="img-circle"></td><td>'+this.email+'</td><td>'+this.name+'</td><td>'+this.phone+'</td></tr>')
						}
						
					});
				}
				
			});
		}
		
		
	});
	
</script>