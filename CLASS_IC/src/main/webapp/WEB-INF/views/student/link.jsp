<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content">
	<div class="container-fluid">

		<input type="hidden" value="${sessionScope.classCode}" id="classCode"
			name="classCode">

		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-icon"
						data-background-color="orange">
						<i class="material-icons">assignment</i>
					</div>

					<div class="card-content">
						<h4 class="card-title">링크 게시판</h4>
						<div class="toolbar">
							<!--        Here you can write extra buttons/actions for the toolbar              -->
						</div>



						<!-- tab-content -->



						<!-- 여기서 부터 링크 데이터 테이블           -->

						<div class="material-datatables">
							<table id="datatables"
								class="table table-striped table-no-bordered table-hover"
								cellspacing="0" width="100%" style="width: 100%">
								<thead>


									<tr>
										<th class="text-center">check</th>
										<th align="center">링크 제목</th>
										<th align="center">링크 주소</th>

										<th class="disabled-sorting text-right">Actions</th>
									</tr>
								</thead>
								<tbody>
									<!--  여기서부터 tr td-->
									<c:forEach var="lvo" items="${lvo}">
										<tr>
											<td>
												<div class="text-center" style="margin-top: -12px;">
													<div id="">
														<label class="text-center"> <input type="checkbox"
															name="multy[]" value="${lvo.linkNo}"> <span
															class="checkbox-material"></span>
														</label>
													</div>
												</div>

											</td>
											<td>${lvo.linkTitle}</td>
											<td><a href="http://${lvo.linkSrc}" target="_blank">
													${lvo.linkSrc}</a></td>

											<td class="text-right"><a
												href="linkboardEdit.htm?linkNo=${lvo.linkNo}"
												class="btn btn-simple btn-primary btn-icon edit"><i
													class="material-icons">border_color</i></a></td>

										</tr>
									</c:forEach>
									<!--   tr td 끝-->



								</tbody>
							</table>
						</div>

						<!-- 여기서 부터 링크 데이터 테이블  끝         -->

					</div>

				</div>
				<!--카드 끝  -->

			</div>


			<!--  넣어주기 끝-->
		</div>
	</div>

	<!--  -->



</div>


<!-- 단어검색, 게시물표시, 페이징 Javascript -->
<script type="text/javascript">
	//데이터 테이블 
	$(document).ready(function() {

		$('#datatables').DataTable({
			"pagingType" : "full_numbers",
			"lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ], //게시물 표시
			responsive : true,
			language : {
				search : "_INPUT_",
				searchPlaceholder : "단어를 입력하세요", //단어검색
			}

		});

		var table = $('#datatables').DataTable();

		$('.card .material-datatables label').addClass('form-group');

	});
</script>
<!-- end 단어검색, 게시물표시, 페이징 Javascript -->