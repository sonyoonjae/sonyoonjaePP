<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<c:if test="${empty sessionScope.id }">
	<script>
		alert("잘못된 접근입니다.");
		location.href = "/login";
	</script>
</c:if>
<head>
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
</style>
<meta charset="UTF-8">
<title>Payment</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	position: relative;
	height: 100%;
	font-family: 'Noto Sans KR', sans-serif;
}

#wrap {
	position: relative;
	min-height: 100%;
	font-size: 12px;
}

#header {
	position: relative;
	box-sizing: border-box;
	height: 250px;
	padding: 62px 0 0;
	width: 768px;
	margin: 0 auto;
	text-align: center;
}

#storename {
	display: block;
	overflow: hidden;
	width: 231px;
	height: auto;
	margin: 0 auto;
	font-size: 15px;
}

#price {
	display: block;
	overflow: hidden;
	width: auto;
	height: 250px;
	margin: 0 auto;
	font-size: 70px;
	padding: 8px 0 0 0;
}

#container {
	min-height: auto;
}

#content {
	width: 720px;
	margin: 0 auto;
}

#bottom_msg {
	text-align: center;
	font-size: 13px;
	color: gray;
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
	height: 61px;
	margin: 50px 0 14px;
	padding-top: 1px;
	padding-left: 15px;
	border: solid 1px black;
	px: white;
	text-align: center;
	color: #000;
	font-size: 20px;
	font-weight: 700;
	line-height: 55px;
	cursor: pointer;
	border-radius: 15px;
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/payment.js">
	
</script>

</head>
<body>
	<input type='hidden' id='pg_code' value="${map.pg_code }">
	<input type='hidden' id='total_price' value='${sessionScope.total_price}'>
	<input type='hidden' id='mall_account' value="${sessionScope.mall_account }">
	<div id="wrap">
		<div id="header">
			<div id="storename">
				<strong>${sessionScope.mall_name }</strong>
			</div>
			<div id="price">${sessionScope.total_price }원</div>
		</div>
		<div id="container">
			<div id="content">
				<div style="margin-bottom: 70px"></div>
				<c:forEach var="paymentways" items="${map.paymentways }">
					<input type='hidden' id="${paymentways.card_or_account_number }" value="${paymentways.means }">
				</c:forEach>
				<div id="choose">
					<select class="btn_choose" id="paymentway">
						<c:forEach var="paymentways" items="${map.paymentways }">

							<option value="${paymentways.card_or_account_number }">&nbsp;${paymentways.bank_name }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${paymentways.card_or_account_number }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${paymentways.means eq 'card'}">카드
									</c:when>
									<c:otherwise>계좌</c:otherwise>


								</c:choose>

							</option>

						</c:forEach>
					</select>
				</div>
				<form action="/paymentProcess" method="post">
					<fieldset style="border: 0">
						<button class="btn_login" type="button" onclick="pay_ajax()">결제하기</button>
					</fieldset>
				</form>
				<button onclick="location.href='/newPaymentWay'" class="btn_login" type="button">결제 수단
					추가하기</button>
			</div>
		</div>
		<div id="bottom_msg">
			<strong>구매내용에 동의하시면 결제해주세요.</strong>
		</div>
	</div>
</body>

</html>

