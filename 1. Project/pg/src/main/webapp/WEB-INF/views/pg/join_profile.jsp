<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
</style>
<meta charset="UTF-8">
<title>Join2</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	position: relative;
	height: 100%;
	text-align: center;
}

#wrap {
	position: relative;
	min-height: 100%;
	font-size: 12px;
}

#header {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 14px 0 30px;
	width: 768px;
	margin: 0 auto;
}

#h_logo {
	display: block;
	overflow: hidden;
	width: auto;
	height: auto;
	margin: 0 auto;
	font-size: 40px;
	font-family: 'Fredoka One', cursive;
}

#container {
	padding-bottom: 50px;
	min-height: 185px;
}

#content {
	width: 720px;
	margin: 0 auto;
	padding-bottom: 30px;
}

.id_area {
	position: relative;
}

.input_row {
	position: relative;
	height: 29px;
	margin: 30px 0 30px;
	padding: 10px 35px 10px 15px;
	border: solid 1px #dadada;
	background: #fff;
	border-radius: 15px;
}

.input_box {
	display: block;
	overflow: hidden;
}

.int {
	font-size: 15px;
	line-height: 18px;
	position: relative;
	z-index: 9;
	width: 100%;
	height: 16px;
	padding: 7px 0 6px;
	color: #000;
	border: none;
	background: #fff;
	appearance: none;
}

.content_notice {
	font-family: 'Noto Sans KR', sans-serif;
	padding-top: 2px;
}

#notice_main {
	font-size: 40px
}

#notice_sub {
	font-size: 25px
}

.btn_login {
	display: block;
	width: 100%;
	height: 61px;
	margin: 50px 0 14px;
	padding-top: 1px;
	border: none;
	background: linear-gradient(to left, #0CB680, #0555EB);
	text-align: center;
	color: #fff;
	font-size: 20px;
	font-weight: 700;
	line-height: 55px;
	cursor: pointer;
	border-radius: 15px;
	text-decoration: none
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function join_ajax()
	{
		var id = document.getElementById('user_id').value;
		var password = document.getElementById('password').value;
		var name = document.getElementById('name').value;
		var password_confirm = document.getElementById('password_confirm').value;
		var phone_number = document.getElementById('phone_number').value;
		var email = document.getElementById('email').value;

		sendData = {
			"userID" : id,
			"payment_password" : password,
			"password_confirm" : password_confirm,
			"name" : name,
			"phone_number" : phone_number,
			"email":email
		};

		$.ajax({
			url : "/joinProcess",
			method : "post",
			data : JSON.stringify(sendData),
			contentType : "application/json;charset=UTF-8",
			success : function(data)
			{
				if(data.check==true){
					location.href="/newPaymentWay";
				}
				else{
					alert(data.message);
					return false;
				}
				
			},
			error : function()
			{
				alert('원인 불명의 오류가 발생하였습니다.');
				return false;
			}
		});
	}
</script>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="h_logo">PayMent's</div>
		</div>
		<div id="container">
			<div id="content">
				<div style="margin-bottom: 7px"></div>
				<div class="content_notice" id="notice_main">프로필 설정</div>
				<div class="content_notice" id="notice_sub">정확한 정보를 입력해주세요.</div>
				<form action="" method="get">
					<input type='hidden' id='email' value='${sessionScope.email }'>
					<fieldset style="border: 0">
						<div class="id_area">
							<div class="input_row" id="id_area">
								<span class="input_box">
									<input style="font-family: 'Noto Sans KR', sans-serif" type="text" name="userID"
										id="user_id" class="int" placeholder=아이디>
								</span>
							</div>
						</div>
						<div class="id_area">
							<div class="input_row" id="id_area">
								<span class="input_box">
									<input style="font-family: 'Noto Sans KR', sans-serif" type="password" name="password"
										id="password" class="int" placeholder="비밀번호">
								</span>
							</div>
						</div>
						<div class="id_area">
							<div class="input_row" id="id_area">
								<span class="input_box">
									<input style="font-family: 'Noto Sans KR', sans-serif" type="password"
										name="password_confirm" id="password_confirm" class="int" placeholder="비밀번호 확인">
								</span>
							</div>
						</div>
						<div class="id_area">
							<div class="input_row" id="id_area">
								<span class="input_box">
									<input style="font-family: 'Noto Sans KR', sans-serif" type="text" name="name" id="name"
										class="int" placeholder=이름>
								</span>
							</div>
						</div>
						<div class="id_area">
							<div class="input_row" id="id_area">
								<span class="input_box">
									<input style="font-family: 'Noto Sans KR', sans-serif" type="text" name="phone_number"
										id="phone_number" class="int" placeholder="전화번호">
								</span>
							</div>
						</div>
						<!-- 						<a href="http://localhost:8000/pg/join_paymethod" class="btn_login" type="button">다음</a> -->
						<button class="btn_login" type="button" onclick="join_ajax()">가입하기</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>