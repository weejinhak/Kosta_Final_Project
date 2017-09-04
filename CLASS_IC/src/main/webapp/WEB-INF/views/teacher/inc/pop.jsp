<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/pop.css"
	rel="stylesheet" />
<link href="//goo.gl/mTc43h" rel="stylesheet">

<div class=pops>
<div class="main-panel">

	<div class="content">
		<div class="container-fluid">

			<div class="row">


				<div class="col-md-12">

					<button class="btn btn-raised btn-round btn-info"
						data-toggle="modal" data-target="#noticeModal" style="margin-left: 300px;">
						<i class="material-icons">link</i>
					</button>


					<!-- notice modal -->
					<div class="modal fade" id="noticeModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-notice">
							<div class="modal-content">
								<div class="modal-header" style="padding-bottom: 10px;">
									<div class="X">
										<input type="search" id="iS" onkeyup="fS()"
											placeholder="Search names...">

										<ul id="sU">
											<li><a href="#" class="lH">A</a></li>
											<li><a href="#">Adele</a></li>
											<li><a href="#">Agnes</a></li>
											<li><a href="#">Ana</a></li>
											<li><a href="#">Angela</a></li>

											<li><a href="#" class="lH">B</a></li>
											<li><a href="#">Billy</a></li>
											<li><a href="#">Bob</a></li>
											<li><a href="#">Burro</a></li>
											<li><a href="#">Bruno</a></li>

											<li><a href="#" class="lH">C</a></li>
											<li><a href="#">Calvin</a></li>
											<li><a href="#">Christina</a></li>
											<li><a href="#">Cindy</a></li>
											<li><a href="#">Curry</a></li>

											<li><a href="#" class="lH">D</a></li>
											<li><a href="#">Daril</a></li>
											<li><a href="#">Denver</a></li>
											<li><a href="#">Dewil</a></li>
											<li><a href="#">Dude</a></li>
										</ul>

									</div>




								</div>

							</div>
						</div>
					</div>
					<!-- end notice modal -->

				</div>
			</div>
		</div>
	</div>

</div>
</div>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/pop.js"></script>