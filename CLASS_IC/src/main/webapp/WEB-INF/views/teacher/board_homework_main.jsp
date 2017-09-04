<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

            <div class="content">
                <div class="container-fluid">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card-header">
                                    <h4 class="card-title">과제 카테고리 등록</h4>
                                </div>
                                <div class="card-content">
                                   
                                    <button class="btn btn-danger" id="addCateBtn" data-toggle="modal" data-target="#addCate">
                                       <i class="material-icons">add_circle_outline</i> 카테고리 추가
                                    </button>
                                    <br>
                                    <hr style="width: 100%;">
                                    <button class="btn btn-success cateBtn">
                                       		 JAVA 기초
                                    </button>
                                    
                                </div>
                                
                            </div>
                            
                        </div><!-- end row -->
                        
<!-- 카테고리 등록 modal -->
<div class="row">
<div class="col-md-12 text-center">

 <div class="modal fade" id="addCate" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-notice">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h5 class="modal-title" id="myModalLabel">카테고리 등록</h5>
			</div>
			<div class="modal-body">
					<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
										<input type=text class="form-control valid" name="groupCode" id="groupCode" style="width: 100px;" maxlength="5" aria-invalid="false" placeholder="groupCode입력"><!-- groupCode입력 -->
										<input type="text" class="form-control" placeholder="과제 명을 작성해주세요" id="cateTitle">
										<input type="hidden" id="classCode" value="${sessionScope.classCode }">
									</div>
								</div>
							</div>
			</div>
			<div class="modal-footer text-center">
				<button type="button" class="btn  btn-round" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger btn-round" id="insertCateBtn" data-dismiss="modal">등록</button>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<!-- end 카테고리 등록 modal -->
                        
                    </div>
                </div>
            </div>

<script type="text/javascript">
	$(function() {
		
		numberCheck();
		
		moveTable();
		
		insertCate();
		
		//수정 해야함!!!
		/*  function insertCate() { //insertCateBtn버튼 클릭시 카테고리 등록
			$("#insertCateBtn").on("click",function() {
				
				alert("과제카테고리 등록 버튼 클릭");
				
				var email = $('#email').val();
				
					$.ajaxSetup({cache : false});
					$.ajax({
					cashe : false,
					type : "post",
					url : "selectMemo.htm",
					data : {"email" : email},
					dataType : 'json',
					async : false,
					success : function(data) {

                       $.each(data,function(index, item) {

							$('.memo-content').append(
									'<div class="alert alert-primary item col-xs-4" id="'+item.memono+'"> <input type="hidden" class="memoNo" value="'+item.memono+ '" name="memoNo" />'
										+ item.memotext+ '<button class="deletebutton close" aria-hidden="true" value="'+item.memono+'"><i class="material-icons">close</i></button></div>')

									console.log("memoNO: "+ item.memono)
							});
			              }
				     });
				});
			});
		}  */
		
		function moveTable() {
			$(".cateBtn").on("click",function() {
				
				alert("과제 테이블로 이동");
				
				var classCode = ${sessionScope.classCode};
				console.log(classCode);
				
				location.href="movePage.htm?classCode="+classCode;
				
			});
		}
		
	});

	function numberCheck() {
		$('#inputBox').keypress(function (event) { 
			if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
				event.preventDefault(); 
			} 
		});
		 
	}
	
 
 </script>


