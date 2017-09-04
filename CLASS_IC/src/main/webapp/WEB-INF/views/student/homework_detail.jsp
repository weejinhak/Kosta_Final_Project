<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link href="${pageContext.request.contextPath}/resources/assets/css/board_content.css" rel="stylesheet" />
<!-- 
@Project : CLASS-IC
@File name : homework_detail_
@Author : 박소현
@Data : 2017.07.03
@Desc :
 -->


<div class="content">

	<div class="container-fluid">


		<div class="col-md-12">
			<div class="card">
				<c:set var="homework" value="${list}" />
				<div class="card-header card-header-text"
					data-background-color="rose">
					<h4 class="card-title">&nbsp;
						&nbsp;&nbsp;${homework.cateCode}&nbsp;&nbsp;&nbsp;</h4>

				</div>

				<div class="card-content ">
					<div id="face">
						<div class="singlepage old-singlepage">
							<div class="entry-wrap">
								<div class="entry">
									<div id="single-title-wrap">
										<div id="single-title-block">
											<h1 class="new-single-title">${homework.assignTitle}</h1>
											<div class="single-meta-wrap">
												<div class="single-meta-line"></div>
												<div class="single-meta">
													<span class="sm-dot">·</span> <a>작성일자:
														${homework.assignDate}</a><span class="sm-dot">·</span>
												</div>
											</div>
										</div>
									</div>
									<div class="single-top-ads">
										<!-- BuySellAds.com Zone Code -->
										<div id="bsap_672" class="bsap" data-serve="CA7DP">

											<article class="entry-content alert alert"
												style="width: 690px; height: 400px;">
												<p class="single-first-p">${homework.assignContent}</p>
												<p class="fixed-empty-p">&nbsp;</p>

											</article>
											<!-- enty-content -->
										</div>
										<!-- entry -->

									</div>
									<!-- entry-wrap -->

								</div>

							</div>

						</div>
						<div class="td-actions text-center" style="margin-top: 500px;">
							<button type="button" rel="tooltip"
								class="btn btn-info btn-round" id="list" name="list"
								onclick="location.href='homework.htm' ">
								<i class="material-icons">list</i>
							</button>

							<a href="homeworkEdit.htm?assignNo=${homework.assignNo}
														&email=<%=(String)session.getAttribute("email")%>
														&classCode=<%=(String)session.getAttribute("classCode")%>">
								<button type="submit" rel="tooltip"
									class="btn btn-success btn-round edit">
									<i class="material-icons">done</i>
								</button>
							</a>
							

						</div>
					</div>
					<!--  row 끝-->
				</div>
				<!-- 카드 끝 -->
			</div>
			<!--12 end  -->

		</div>


	</div>
</div>

