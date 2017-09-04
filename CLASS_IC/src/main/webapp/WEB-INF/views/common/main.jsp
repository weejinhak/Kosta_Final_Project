<!--
	@Project : CLASS-IC
	@File Name : main.jsp
	@Author : 이현정
	@Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CLASS-IC</title>
    <meta name="viewport" content="height=device-height,width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <link href="${pageContext.request.contextPath}/resources/assets/css/main.css" rel="stylesheet" />
    <!-- common header  -->
    <jsp:include page="inc/common_header.jsp"></jsp:include>
    
</head>
<body>
   <article id="BigWrap">   
   <section>
    <span style=font-size:30pt>CLASS-IC </span>  
            <h1>당신에겐 교실 관리가 필요합니다.</h1>
 <!--  로그인창을 메인에 달아본다-->
        <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                            <form method="POST" action="loginOk.htm">
                                <div class="card card-login card-hidden">
                                    <div class="card-header text-center" data-background-color="rose">
                                                     <h3 class="card-title">Login</h3>
                                       
                                    </div>
                                    <p class="category text-center">
                                        
                                        
                                    </p>
                                    <div class="card-content">
                             <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">email</i>
                                            </span>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Email address</label>
                                                <input type="email" class="form-control" id="email" name="email">
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Password</label>
                                                <input type="password" class="form-control" id="pwd" name="pwd">
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="footer text-center">
                                       <button class="btn btn-rose" type="submit">Login </button>
                                      </div>
                                </div>
                            </form>
                             <a href="join.htm">아직 CLASS-IC 회원이 아니신가요?  [회원가입]</a><br/>
                             <a href="sendEmail">비밀번호를 잊어버리셨나요?  [비밀번호 재설정]</a><br/>
                        </div>
                    </div>
                </div>
        <!--  달아봤다-->
        </section>
        <!-- <section>
        
          <h1>CLASS-IC</h1>    
            <h1>당신에겐 교실 관리가 필요합니다.</h1>
            <p>
                수업을 진행하는데 있어서, 좀 더 스마트하면서 즐겁고 편하게  <br>
                당신의 교실이 더 즐거워집니다. 
            </p>
            <dl>
                <dt>교실통합관리 시스템 CLASS-IC</dt>
                <dd>CLASS-IC은 Class Intelligent Command의 당신의 교실관리를 도와줄 교실통합관리 페이지입니다.</dd>                    
               <dt><a href="login.htm">LOGIN!</a></dt>
                <dd id="copy">핸섬웨어</dd>
            </dl>
   
        </section> -->
        <div id="videoEle"></div>
    </article>
    <script src="resources/assets/js/jquery-1.11.1.min.js"></script>
    <!--1. 제이쿼리(이미 페이지에서 로드했다면 추가안하셔도 됩니다.) -->    
    
    <script src="resources/assets/js/video.js"></script>
    <!--2. 비디오를 웹브라우저에 노출하기 위한 플러그인입니다. 비디오 재생 플레이어의 일종이라 생각하시면 됩니다.-->
    
    <script src="resources/assets/js/bigvideo.js"></script>
    <!--3. 비디오나 이미지를 풀사이즈로 넣는 플러그인입니다. -->
    
    <script src="resources/assets/js/imagesloaded.pkgd.min.js"></script>    
    <!-- 4. 비디오가 아닌 이미지로 풀사이즈일 경우 bigvideo.js에서 이 파일을 호출하게 됩니다. -->
    <script>
        window.mobilecheck = function() {
          var check = false;
          (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
          return check;
        };
        
        var BV = new $.BigVideo({useFlashForFirefox:false, container:$('#videoEle')});
            // 비디오나 배경을 노출할 엘리먼트를 선택합니다. $('#videoEle')는 html 태그중에 <div id="videoEle"></div> 를 말하는 것입니다.
            BV.init();
            if (mobilecheck()) {
                BV.show('resources/assets/file/SampleVideo.jpg');
                //모바일일 경우 비디오 대신 대체할 이미지입니다.
            } else {
                BV.show(
                    { type: "video/mp4",  src: "resources/assets/file/classic_bg.mp4", doLoop:true },
                    { type: "video/webm", src: "resources/assets/file/classic_bg.webm", doLoop:true },
                    { type: "video/ogg",  src: "resources/assets/file/classic_bg.ogv", doLoop:true }
                );
                //웹브라우저마다 지원하는 비디오 형식이 다르기 때문에 다양하게 만들어서 제공해야합니다. 변환은 다음팟인코더나, 카카오인코더를 이용하세요. 
                //옵션중에 doLoop는 영상 반복을 의미합니다. true는 영상 반복, false는 반복 안함입니다.
                BV.getPlayer().volume(0);
                //사운드를 0 즉 음소거 상태로 만듭니다. 
            }
    </script>
    <script>
        /*이 아래 코드는 안넣으셔도 됩니다.*/
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-25871465-1', 'auto');
        ga('send', 'pageview');
        /*소스 다운로드한 통계를 얻으려고 추가한 구글 통계 코드입니다.*/
    </script>
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