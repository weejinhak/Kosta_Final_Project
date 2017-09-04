<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>CLASS-IC</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/material-dashboard.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
    <!--   Core JS Files   -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.1.1.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/material.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
</head>

<body>
    <div class="wrapper">
       
          <!-- side navi 메뉴 영역-->
             <tiles:insertAttribute name="navi" />  
           <div class="main-panel">
          <!--  header 영역 -->
             <tiles:insertAttribute name="header" />
           <!--  contents 영역 -->
               <tiles:insertAttribute name="content" />
           
        </div>
    </div>
</body>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////  -->
<!-- Forms Validations Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>
<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- Select Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/sweetalert2.js"></script>
<!--   Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="${pageContext.request.contextPath}/resources/assets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>

</html>