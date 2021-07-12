<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
</style>
<meta charset="UTF-8">
<title>Join</title>
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

.btn_login {
	display: block;
	width: 100%;
	height: 61px;
	margin: 40px 0 14px;
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
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function join_ajax()
	{
		var email = document.getElementById('email').value;
		var data = {
			"email" : email
		};
		$.ajax({
			url : "/joinCheck",
			method : "post",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			success : function(data)
			{
				if (data.check == true)
				{
					location.href="/emailConfirm";
				} else
				{
					alert(data.message);
					return false;
				}
			},
			error : function()
			{
				alert('원인을 알 수 없는 오류가 발생했습니다.');
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
				<div class="content_notice" id="notice_main">PayMent's 와 함께하기</div>
				<div class="content_notice" id="notice_sub">먼저 이메일을 입력해주세요.</div>
				<form action="" method="post">
					<fieldset style="border: 0">
						<div class="id_area">
							<div class="input_row" id="id_area">
								<span class="input_box">
									<input style="font-family: 'Noto Sans KR', sans-serif" type="text" name="email"
										id="email" class="int" placeholder="아이디">
								</span>
							</div>
						</div>
						<!--                     <a href="http://localhost:8000/pg/join_profile" class="btn_login" type="button">다음</a> -->
						<button class="btn_login" type="button" onclick="join_ajax()">이메일 인증 코드 받기</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>