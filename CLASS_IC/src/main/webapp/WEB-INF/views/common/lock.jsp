<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Material Dashboard Pro by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- common header  -->
    <jsp:include page="inc/common_header.jsp"></jsp:include>
    </head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head> 
    <div class="wrapper wrapper-full-page">
        <div class="full-page lock-page" filter-color="black" data-image="../../assets/img/lock.jpeg">
            <!--   you can change the color of the filter page using: data-color="blue | green | orange | red | purple" -->
            <div class="content">
                <form method="#" action="#">
                    <div class="card card-profile card-hidden">
                        <div class="card-avatar">
                            <a href="#pablo">
                                <img class="avatar" src="../../assets/img/faces/avatar.jpg" alt="...">
                            </a>
                        </div>
                        <div class="card-content">
                            <h4 class="card-title">접근 제한</h4>
                            <div class="form-group label-floating">
                                <label class="control-label">패스워드를 입력하세요</label>
                                <input type="password" class="form-control">
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn btn-rose btn-round">Unlock</button>
                        </div>
                    </div>
                </form>
            </div>
      
        </div>
    </div>
</body>
<!-- common footer -->
<jsp:include page="inc/common_footer.jsp"></jsp:include>
<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
 
</html>