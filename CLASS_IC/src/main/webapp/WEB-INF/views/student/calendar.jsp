<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


</head>

<body>
	<div class="content">
		<div class="container-fluid">
			<div class="header text-center"></div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="card card-calendar">
						<div class="card-content" class="ps-child">
							<div id="fullCalendar"></div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


<script type="text/javascript">
	$(document).ready(function() {
		demo.initFullCalendar();
	});
</script>

</html>