<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title> 이메일 & 비밀번호 찾기 </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->

</head>
<body>



<!--익스레이어팝업-->
<div id="ieUser" style="display:none">
	<div class="iewrap">	
		<p class="img"><img src="../images/ico/ico_alert.gif" alt="알림" /></p>
		<p class="txt">IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해 주세요. </p>
		<ul>
			<li><a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank"><img src="../images/ico/ico_ie.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="https://www.google.com/intl/ko/chrome/browser" target="_blank"><img src="../images/ico/ico_chrome.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="http://www.mozilla.org/ko/firefox/new" target="_blank"><img src="../images/ico/ico_mozila.gif" alt="MOZILA 최신브라우저 다운" ></a></li>
			<li><a href="http://www.apple.com/safari" target="_blank"><img src="../images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운" ></a></li>
			<li><a href="http://www.opera.com/ko/o/ie-simple" target="_blank"><img src="../images/ico/ico_opera.gif" alt="OPERA 최신브라우저 다운" ></a></li>		
		</ul>
		<p class="btn" onclick="msiehide();"><img src="../images/ico/ico_close.gif" alt="닫기" /></p>
	</div>
</div>

 <script type="text/javascript">
 
	function search_email(){
 	   $.ajax({
 			 url:'./search_email',
 			 type:'post',
 			 data:{
 				 "name":$("#name1").val(),
 				 "phone_no":$("#phone_no").val()
 			 },
 			 success:function(data){
 				 alert(data.msg);
 				 if(data.flag=="success"){
 				    location.href="./emailSearchSuccess";
 				 }else{
 					 $("#name1").val(""); //공백처리 
 					 $("#phone_no").val("");
 					return false;
 				 }
 			 },
 			 error:function(){
 				 alert("에러");
 			 }
 		  });
    }
	
	
	function search_password(){
	 	   $.ajax({
	 			 url:'./search_password',
	 			 type:'post',
	 			 data:{
	 				 "name":$("#name2").val(),
	 				 "email":$("#email").val()
	 			 },
	 			 success:function(data){
	 				 alert(data.msg);
	 				 if(data.flag=="success"){
	 				    location.href="./passwordSearchSuccess";
	 				 }else{
	 					 $("#name2").val(""); //공백처리 
	 					 $("#email").val("");
	 					return false;
	 				 }
	 			 },
	 			 error:function(){
	 				 alert("에러");
	 			 }
	 		  });
	    }
	
</script>

<div id="allwrap">
<div id="wrap">

	<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>

	<!-- container -->
	<div id="container">
		
			<!-- contents -->
			<div id="container_search">
				<div id="member">
					<h2><strong>${session_email}</strong><span>회원님께서 가입하신 이메일을 찾아드립니다.</span></h2>
					<h3>이메일 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" name="name" id="name1" class="nameType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='nameType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" placeholder="이름" /></li>
								<li><input type="text" name="phone_no" id="phone_no" class="phoneType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='phoneType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" placeholder="전화번호" /></li>
							</ul>

							<div class="btn"><a onclick="search_email()" href="#" class="gbtn">이메일 찾기</a></div>
						</div>
					</div>
					<br /><br /><br />
					
					<h2><strong>${session_email}</strong><span>회원님께서 가입하신 비밀번호를 찾아드립니다.</span></h2>
					<h3>비밀번호 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" name="name" id="name2" class="nameType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='nameType'}else {this.className='mfocusnot'}" placeholder="이름" /></li>
								<li><input type="text" name="email" id="email" class="emailType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='mfocusnot'}" placeholder="e-mail"/></li>
							</ul>

							<div class="btn"><a onclick="search_password()" href="#" class="gbtn">비밀번호 찾기</a></div>
						</div>
					</div>
					

				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->




	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>



</div>
</div>
</body>
</html>