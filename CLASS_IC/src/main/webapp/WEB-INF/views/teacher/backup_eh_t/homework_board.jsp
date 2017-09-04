<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h2 class="title text-center"><b>과제 게시판</b></h2>
			<br>
			<div class="nav-left">
				<ul class="nav nav-pills nav-pills-warning nav-pills-icons"
					role="tablist">
					<!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->
					<li class="active"><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false"> <i
							class="material-icons">info</i> 과제 공지
					</a></li>
					<li class=""><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false"> <i
							class="material-icons">face</i> 1조
					</a></li>
					<li class=""><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false"> <i
							class="material-icons">face</i> 2조
					</a></li>
					<li class=""><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false"> <i
							class="material-icons">face</i> 3조
					</a></li>
					<li class=""><a href="#description-2" role="tab"
						data-toggle="tab" aria-expanded="false"> 
						
						<!--                                            <i class="material-icons">exposure_plus_1</i> -->
							<button class="btn btn-raised btn-round btn-white"
								data-toggle="modal" data-target="#noticeModal">+</button>
								<br>add
					</a></li>
				</ul>
			</div>

			<!-- tab-content -->
			<div class="tab-content">
				<div class="tab-pane" id="description-1">
					<div class="card">
						<!--  표-->
				<div class="card-content">
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

						<button type="button" class="btn btn-info btn-round" style="margin-left:850px">write</button>
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
	</div>

	<!-- 모달  -->
	<div class="row">
		<div class="col-md-12 text-center">
			<!-- notice modal -->
			<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">과제 게시판 탭 추가</h5>
						</div>
						<div class="modal-body">
							<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
										
									<input type="text" class="form-control" placeholder="탭 이름">
									</div>
								 
								</div>
								
									<div class="row">
									<div class="col-md-12">
									 
										
									<input type="text" class="form-control" placeholder="조원 검색">
									</div>
								 
								</div>
							</div>
							 
							 
						</div>
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">Never
								mind</button>
							<button type="button" class="btn btn-success btn-simple">Yes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end notice modal -->


		</div>
	</div>
      	 </div>
 </div>
 