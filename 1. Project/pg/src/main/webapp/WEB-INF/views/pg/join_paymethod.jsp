<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
</style>
<meta charset="UTF-8">
<title>Join2</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
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
	padding: 13px 0 30px 17px;
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
	line-height: 50px;
}

#container {
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
	margin: 5px 0 30px;
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

#card_images {
	width: 190px;
	height: 190px;
	padding-bottom: 10px;
}

#account_images {
	width: 140px;
	height: 140px;
	padding: 30px 0 30px 10px;
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

.btn_choose {
	display: block;
	width: 100%;
	height: 51px;
	margin: 13px 0 35px;
	padding-top: 1px;
	padding-left: 9px;
	border: solid 1px #e7e7e7;
	px: white;
	text-align: center;
	color: #000;
	font-size: 17px;
	font-weight: 700;
	line-height: 55px;
	cursor: pointer;
	border-radius: 15px;
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif;
}

.detailTab ul li {
	width: 50%;
}

.detailTab ul li a {
	width: 100%;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/newpaymentway.js"></script>

</head>
<body>
	<input type='hidden' id='pg_code' value="${pg_code }">
	<input type='hidden' id='mall_account' value="${sessionScope.mall_account }">
	<div id="wrap">
		<div id="header">
			<div id="h_logo">PayMent's</div>
		</div>
		<div id="container">
			<div id="content">
				<div style="margin-bottom: 7px"></div>
				<!-- 				<div class="content_notice" id="notice_main">계정이 생성되었습니다.</div> -->
				<div class="content_notice" id="notice_sub">카드나 계좌를 등록하여 쇼핑을 즐겨보세요.</div>
				<!-- tab -->
				
				<div class="detailTab">
				
					<ul>
						<li class="dep">
							<a href="javascript:;" onclick="return false;" id="detailInfo">카드</a>
						</li>
						<li>
							<a href="javascript:;" onclick="return false;" id="goodsRelation">계좌연결</a>
						</li>
					</ul>
				</div>
				<script type="text/javascript">
					$(function()
					{
						$(".detailTab ul li a:eq(0)").click();
					});
				</script>
				<!-- //tab -->



				<!-- detail info -->
				<form action="/newPaymentWayAdd" method="post" id='form'>
					<input type='hidden' name='userID' value='${sessionScope.id }'>
					<input type='hidden' name='means' id='means' value='card'>
					<input type='hidden' name='end_year' id='end_year'>
					<input type='hidden' name='end_month' id='end_month'>

					<select class="btn_choose" name="bank_name" id="bank_name">
						<c:forEach items="${banks }" var="bank">
							<option value="${bank.bank_name }">💰&nbsp;${bank.bank_name }</option>
						</c:forEach>
					</select>

					<div class="detailInfo disnone">
						<img id="card_images"
							src="https://png.pngtree.com/png-vector/20190507/ourmid/pngtree-vector-credit-card-icon-png-image_1025464.jpg" />

						<fieldset style="border: 0">


							<div class="id_area">
								<div class="input_row" id="card_number_area">
									<span class="input_box">
										<input style="font-family: 'Noto Sans KR', sans-serif" type="text" name="card_or_account_number"
											id="card_number" class="int" placeholder=카드번호>
									</span>
								</div>
							</div>
							<div class="id_area">
								<div class="input_row" id="end_date_area">
									<span class="input_box">
										<input style="font-family: 'Noto Sans KR', sans-serif" type="text" id="end_date"
											class="int" placeholder="만료일(MM/YY)">
									</span>
								</div>
							</div>
							<div class="id_area">
								<div class="input_row" id="cvc_area">
									<span class="input_box">
										<input style="font-family: 'Noto Sans KR', sans-serif" type="password" name="cvc" id="cvc"
											class="int" placeholder="보안코드(CVC)">
									</span>
								</div>
							</div>
							<div class="id_area">
								<div class="input_row" id="transaction_password_area">
									<span class="input_box">
										<input style="font-family: 'Noto Sans KR', sans-serif" type="password"
											name="payment_password" id="transaction_password" class="int" placeholder="결제 비밀번호">
									</span>
								</div>
							</div>

						</fieldset>
					</div>
					<!-- detail info -->

					<!-- goods relation -->
					<div class="goodsRelation disnone">
						<img id="account_images" src="../images/pg/account.png" />
						<fieldset style="border: 0">


							<div class="id_area">
								<div class="input_row" id="account_number_area">
									<span class="input_box">
										<input style="font-family: 'Noto Sans KR', sans-serif" type="text" name="card_or_account_number"
											id="account_number" class="int" placeholder=계좌번호>
									</span>
								</div>
							</div>
							<div class="id_area">
								<div class="input_row" id="password_area">
									<span class="input_box">
										<input style="font-family: 'Noto Sans KR', sans-serif" type="password"
											name="payment_password" id="password" class="int" placeholder=계좌비밀번호>
									</span>
								</div>
							</div>


						</fieldset>
					</div>
					<!-- 							<a href="http://localhost:8000/pg/payment" class="btn_login" type="button">다음</a> -->
					<input class="btn_login" type="button" onclick="payment_ajax()" value="등록하기">

				</form>
			</div>
		</div>
	</div>
</body>
</html>