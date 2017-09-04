
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			  		<form id="frm" action="excelDownload.htm?email=<%=(String)session.getAttribute("email")%>&classcode=<%=(String)session.getAttribute("classCode")%>" method="post">          
					<button type="submit" id="submitFrm"
                  	class="btn btn-info btn-round" style="margin-left: 820px; margin-top:10px; float: left;" >출석EXCEL다운
                  	</button>
					</form>	
				<div class="card">
					<div class="card-header card-header-icon"
						data-background-color="purple">
						<i class="material-icons">assignment</i>
					</div>
					<div class="card-content">
						<h4 class="card-title">출석출석</h4>
						<div class="toolbar">
							<!--        여기서부터 내가 값을 넣어 바꿀 수 있는 태그              -->
						</div>
						<div class="material-datatables">
							<div id="datatables_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap">

								<div class="row">
										<div class="col-sm-12">
												<table id="datatables"
													class="table table-striped table-no-bordered table-hover dataTable dtr-inline"
													cellspacing="0" width="100%" style="width: 100%;" role="grid"
													aria-describedby="datatables_info">
													<thead>
														<tr role="row">
															<th class="sorting" tabindex="0" aria-controls="datatables"
																rowspan="1" colspan="1" style="width: 98px;">일자</th>
															<th class="sorting" tabindex="0" aria-controls="datatables"
																rowspan="1" colspan="1" style="width: 225px;">입실시간</th>
															<th class="sorting" tabindex="0" aria-controls="datatables"
																rowspan="1" colspan="1" style="width: 225px;">퇴실시간</th>
															<th class="sorting" tabindex="0" aria-controls="datatables"
																rowspan="1" colspan="1" style="width: 114px;">상태</th>
															<th class="sorting" tabindex="0" aria-controls="datatables"
																rowspan="1" colspan="1" style="width: 50px;">기수</th>
														</tr>
													</thead>
		
													<tfoot>
														<tr>
															<th rowspan="1" colspan="1">일자</th>
															<th rowspan="1" colspan="1">입실시간</th>
															<th rowspan="1" colspan="1">퇴실시간</th>
															<th rowspan="1" colspan="1">상태</th>
															<th rowspan="1" colspan="1">기수</th>
														</tr>
													</tfoot>
													<tbody class="tbodyappend">
		
													</tbody>
												</table>
										</div>
								</div>

							</div>
						</div>
					</div>
					<!-- end content-->
				</div>
				<!--  end card  -->
			</div>
			<!-- end col-md-12 -->
				<!-- chart Start -->
			             <div class="col-md-5">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="red">
                                    <i class="material-icons">pie_chart</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">나의 현재출석률</h4>
                                </div>
                                <div id="chartPreferences" class="ct-chart"></div>
                                <div class="card-footer">
                                    <h6>Legend</h6>
                                    <i class="fa fa-circle text-info"></i> 출석
                                    <i class="fa fa-circle text-warning"></i> 결석
                                    <i class="fa fa-circle text-danger"></i> 지각
                                    <i class="fa fa-circle text-primary"></i> 조퇴
                                </div>
                            </div>
                        </div> 
            <!--chart End  -->
		</div>
		<!-- end row -->
	</div>
</div>


<!--데이터테이블에 값을 가져오는 스크립트  -->
<script type="text/javascript">
	console.log("페이지가 시작2");

	$.ajax({
		type : 'POST',
		url : 'attendanceTable.htm',
		dataType : 'json',
		data : {
			email : sessionId,/* 여기다가 로그인한 ID */
			classcode : sessionClassCode /* 여기다가 기수 세션값 넣어야함 */
		},
		success : function(data) {
			console.log(data);
			$.each(data, function() {
				$('.tbodyappend').append(
						'<tr role="row" class="odd">'+
						'<td>'+ this.attendDate + '</td>' +
						'<td tabindex="0" class="sorting_1">'+ this.inClass + '</td>'+
						'<td tabindex="0" class="sorting_1">'+ this.outClass + '</td>' + 
						'<td>'+ this.attendState + '</td>' +
						'<td>'+ this.classCode + '</td>' +						
						'</tr>'
						)
			});
		}

	});
</script>

<!--데이터테이블에 검색과 페이징처리를 담당하는 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#datatables').DataTable({
			"pagingType" : "full_numbers",
			"lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
			responsive : true,
			language : {
				search : "__INPUT__",
				searchPlaceholder : "검색해보세요",
			}

		});
		
		


	});
</script>


<script>

		$(document).ready(function() {			
			
			$.ajax({
				type : 'POST',
				url : 'attendchart.htm',
				data : {
					email : sessionId,/* 여기다가 로그인한 ID */
					classcode : sessionClassCode /* 여기다가 기수 세션값 넣어야함 */
				},
				datatype:"json",
				success : function(data) {

					var labelsin=[];
					var seriesin=[];
					
					$.each(JSON.parse(data), function() {
						labelsin=this.labels;
						seriesin=this.series;
			        });
										
					var dataPreferences = { labels: labelsin, series: seriesin};
			            
			        var optionsPreferences = {
			            height: '200px'
			        };
			        
			        Chartist.Pie('#chartPreferences', dataPreferences, optionsPreferences);
				}
	
			});		
	     
		});		
		

</script>