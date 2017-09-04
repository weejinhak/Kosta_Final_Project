<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<!-- <h2 class="title text-center"><b>과제 게시판</b></h2> -->
			<br>
			<div class="nav-center">
				<ul class="nav nav-pills nav-pills-warning nav-pills-icons" role="tablist">
					<!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->
					<li class="active"><a href="#notice" role="tab"
						data-toggle="tab" aria-expanded="false"> <i
							class="material-icons">info</i> 과제 공지
					</a></li>
					<li class="team"><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false"> <i
							class="material-icons">face</i> 1조
					</a></li>
					<li class="team"><a href="#description-2" role="tab"
						data-toggle="tab" aria-expanded="false"> 
						
						<!--     <i class="material-icons">exposure_plus_1</i> -->
							<button class="btn btn-raised btn-round btn-white"
								data-toggle="modal" data-target="#addTeam">+</button>
								<br>조 추가
					</a></li>
				</ul>
			</div>
		</div>
			<!-- tab-content -->
			<div class="tab-content">
				<div class="tab-pane" id="notice">
					<div class="card">
					<div class="col-lg-8">
					<!-- 셀렉트 박스(메인 카테고리 선택) -->
					    <div class="col-sm-4">
                                <select class="selectpicker" data-style="select-with-transition" title="메인 카테고리 선택" data-size="7">
                                        <option disabled> 메인 카테고리 선택</option>
                                        <option value="2">Paris </option>
                                        <option value="3">Bucharest</option>
                                        <option value="4">Rome</option>
                                </select>
                         </div>
                        
					<!-- 셀렉트 박스(서브 카테고리 선택) -->
					    <div class="col-sm-4">
                                <select class="selectpicker" data-style="select-with-transition" title="서브 카테고리 선택" data-size="7">
                                        <option disabled> 서브 카테고리 선택</option>
                                        <option value="2">Paris </option>
                                        <option value="3">Bucharest</option>
                                        <option value="4">Rome</option>
                                </select>
                         </div>
                        
                         <div class="col-sm-4">
                     <!-- 셀렉트 박스(조 카테고리 선택) -->
                                <select class="selectpicker" data-style="select-with-transition" title="조 선택" data-size="7">
                                        <option disabled> 조 선택</option>
                                        <option value="2">Paris </option>
                                        <option value="3">Bucharest</option>
                                        <option value="4">Rome</option>
                                </select>
                         </div>  
                         </div>
                         <div class="col-sm-12"> 
						<div class="card-content">
					 				<!-- 테이블 -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#</th>
                                                    <th>글 제목 </th>
                                                    <th>글 쓴이</th>
                                                    <th>작성날짜</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-center">1</td>
                                                    <td>박소현 사람 만들기</td>
                                                    <td>박소현 어머니</td>
                                                    <td>2017/06/09</td>
                                                     <td class="td-actions text-center">
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">mode_edit</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">2</td>
                                                    <td>이은영 다이어트</td>
                                                    <td>트레이너</td>
                                                    <td>2017/06/15</td>
                                                      <td class="td-actions text-center">
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">mode_edit</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">3</td>
                                                    <td>노지영 체력 키우기</td>
                                                    <td>관장님</td>
                                                    <td>2017/06/30</td>
                                                 <td class="td-actions text-center">
                                                                     <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">mode_edit</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">4</td>
                                                    <td>Mike Monday</td>
                                                    <td>Marketing</td>
                                                    <td>2013</td>
                                                 <td class="td-actions text-center">
                                                                          <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">mode_edit</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">5</td>
                                                    <td>Paul Dickens</td>
                                                    <td>Communication</td>
                                                    <td>2015</td>  
                                                    <td class="td-actions text-center">
                                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">mode_edit</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div><button type="button" class="btn btn-info btn-round" id="writeBtn" style="float: right;" data-toggle="modal" data-target="#addWrite">
                                    	글쓰기</a></button></div>
                                </div>
						<center>
							<ul class="pagination pagination-info">
								<li><a href="javascript:void(0);"> prev</a></li>
								<li><a href="javascript:void(0);">1</a></li>
								<li><a href="javascript:void(0);">2</a></li>
								<li class="active"><a href="javascript:void(0);">3</a></li>
								<li><a href="javascript:void(0);">4</a></li>
								<li><a href="javascript:void(0);">5</a></li>
								<li><a href="javascript:void(0);">next </a></li>
							</ul>
						</center>
					 </div>
						<!-- 표끝 -->

					</div>
				</div>

				<!-- 탭2 -->
				<!--              <div class="tab-pane" id="description-2">
                                    <div class="card">
                                              
                                    </div>
                                </div> -->

			</div>

			<!--  tab content end-->


		
	</div>

	<!-- 탭추가 모달(조추가)  -->
	<div class="row">
		<div class="col-md-12 text-center">

			<!-- notice modal -->
			<div class="modal fade" id="addTeam" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">조 추가</h5>
						</div>
						<!-- modal-body -->
						<div class="modal-body">
							<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
										
										<input type="text" class="form-control" placeholder="조 이름을 작성해주세요">
									
									</div>
								</div>
							</div>
						</div><!-- end modal-body -->
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-success btn-simple" id="submitBtn">등록</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 탭추가 모달(조추가) end  -->

			<!-- 글쓰기 모달  -->
			<div class="modal fade" id="addWrite" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">과제 등록</h5>
						</div>
						<!-- modal-body -->
						<div class="modal-body">
							<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
										
										<!-- 여기에 글쓰기 폼 -->
										
										
									</div>
								</div>
							</div>
						</div>
						<!-- modal-body -->
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-round" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-info btn-round">등록</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 글쓰기 모달 end  -->

		</div>
	</div>
      	 </div>
      </div>
      
<script type="text/javascript">
	$(function() {
		
		addTeam();
		
		function addTeam() {
			$("#submitBtn").on("click",function() {
				
				$(".team").append(
						
				"<li class='team'><a href='#description-1' role='tab' data-toggle='tab' aria-expanded='false'><i class='material-icons'>face</i> 1조 </a></li>"
				
				);
				
				
			});
		}
		
	});

</script>
