<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="sidebar" data-active-color="rose" data-background-color="black" data-image="${pageContext.request.contextPath}/resources/assets/img/sidebar-1.jpg">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/index.htm" class="simple-text">

                    ${sessionScope.classCode } (강사)

                </a>
            </div>
            <div class="logo logo-mini">
                <a href="${pageContext.request.contextPath}/index.htm" class="simple-text">
                    CLASS-IC
                </a>
            </div>
            <div class="sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="${pageContext.request.contextPath}/resources/assets/img/faces/kosta.png" />
				</div>
				<div class="info">
					<a data-toggle="collapse" href="#collapseExample" class="collapsed">
						${sessionScope.name }<b class="caret"></b>
					</a>
					<div class="collapse" id="collapseExample">
						<ul class="nav">
							
							<li><a href="${pageContext.request.contextPath}/logout.htm">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</div>
			<ul class="nav">
				<li>
					<a href="main.htm"> <i class="material-icons">home</i>
							<p>메인</p>
					</a>
				</li>
				
				<li>
					<a href="historylist.htm"> <i class="material-icons">schedule</i>
							<p>히스토리</p>
					</a>
				</li>
				
				<li>
					<a href="board.htm"> <i class="material-icons">dashboard</i>
							<p>수업보드</p>
					</a>
				</li>		
				</li>
				<li>

					<a href="allboard.htm"> <i class="material-icons">dashboard</i>

							<p>통합게시판</p>
					</a>
				</li>

				<li>
					<a href="homework.htm"> <i class="material-icons">playlist_add_check</i>
							<p>과제게시판</p>
					</a>
				</li>
			
				
				<li>
					<a href="attend.htm"><i class="material-icons">account_box</i>
							<p>출석부</p>

					</a>
				</li>
				
				<li>
					<a href="calendar.htm"> <i class="material-icons">today</i>
							<p>달력</p>
					</a>
				</li>
				<!-- 링크는 메뉴를 통해서 추가해주세요 -->

		<li>
					<a href="linkFile.htm"> <i class="material-icons">playlist_add_check</i>
							<p>링크게시판</p>
					</a>
				</li>

				
				<!-- <li>
					<a href="#"> <i class="material-icons">toys</i>
							<p>교실상태</p>
					</a>
				</li> -->
			</ul>
		</div>
      </div>
  