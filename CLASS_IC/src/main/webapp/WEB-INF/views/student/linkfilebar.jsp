<%--
@Project : CLASS-IC
@File name : linkfilebar.jsp
@Author : 최은혜
@Data : 2017.06.24
@Desc : 링크,파일  검색
--%>

 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
 <!--링크,파일 검색 아이콘 -->
 	  <!-- 링크 -->
  	  <div id="kakaoConsultWrapper" style="position: fixed; text-align:center; right: 50px; bottom: 303px; z-index: 2050;">
      <button class="btn btn-primary btn-round btn-fab btn-fab-mini"   data-toggle="modal" data-target="#noticeModal" >
                               <i class="material-icons">format_list_numbered</i>
                               <div class="ripple-container"></div></button>
      
      <!-- 파일 -->
      <div style="margin-top:10px;">
      
          <button class="btn btn-primary btn-round btn-fab btn-fab-mini"   data-toggle="modal" data-target="#noticeModal2" >
                                      <i class="material-icons">attach_file</i>
                                    <div class="ripple-container"></div></button>
      </div>
    </div>

		<!-- 모달창 : 링크 --><!-- 수정해야겠다 ㅜㅜ 배경이 안나옴 -->
			<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-header" data-background-color="purple">
							<button type="button" class="close" data-dismiss="modal">
								<i class="material-icons">clear</i>
							</button>
						</div>
			<div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                                <div class="card-header card-header-icon" data-background-color="purple">
                                    <i class="material-icons">assignment</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">링크게시판</h4>
                                    <div class="toolbar">
                                        <!--        Here you can write extra buttons/actions for the toolbar              -->
                                    </div>
                                    <div class="material-datatables">
                                        <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th>링크번호</th>
                                                    <th>링크제목</th>
                                                    <th>링크주소</th>
                                                    <th>Date</th>
                                                    <th class="disabled-sorting text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            
                                            <tbody>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>System Architect</td>
                                                    <td>Edinburgh</td>
                                                    <td>2011/04/25</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Garrett Winters</td>
                                                    <td>Accountant</td>
                                                    <td>Tokyo</td>
                                                    <td>2011/07/25</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Ashton Cox</td>
                                                    <td>Junior Technical Author</td>
                                                    <td>San Francisco</td>
                                                    <td>2009/01/12</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <!-- footer -->
                                    <div class="modal-footer text-center">
										<button type="button" class="btn btn-simple" data-dismiss="modal">닫기</button>
									</div>
                                </div>
                                <!-- end content-->
                            </div>
                            <!--  end card  -->
                        </div>
                        <!-- end col-md-12 -->
                    </div>
                   <!--  end row -->
            
    </div>


								</div>
							</div>
							 
							 
						</div>
						
					</div>
				</div>
			</div>
			<!-- end 링크모달 -->


		</div>
	</div>
 
 	  <!-- 모달창 : 파일 -->
      <div class="row">
		<div class="col-md-12 text-center">


			<div class="modal fade" id="noticeModal2" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">파일 검색</h5>
						</div>
						<div class="modal-body">
							<div class="instruction">
								 
								
									<div class="row">
									<div class="col-md-12">
									 
										
									<input type="text" class="form-control" placeholder="파일 검색">
									</div>
								 
								</div>
							</div>
							 
							 
						</div>
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end 파일모달 -->


		</div>
	</div>
	
	
	<script type="text/javascript">
    $(document).ready(function() {
        $('#datatables').DataTable({
            "pagingType": "full_numbers",
            "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ],
            responsive: true,
            language: {
                search: "_INPUT_",
                searchPlaceholder: "Search records",
            }

        });


        var table = $('#datatables').DataTable();

        // Edit record
        table.on('click', '.edit', function() {
            $tr = $(this).closest('tr');

            var data = table.row($tr).data();
            alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
        });

        // Delete a record
        table.on('click', '.remove', function(e) {
            $tr = $(this).closest('tr');
            table.row($tr).remove().draw();
            e.preventDefault();
        });

        //Like record
        table.on('click', '.like', function() {
            alert('You clicked on Like button');
        });

        $('.card .material-datatables label').addClass('form-group');
    });
</script>
 