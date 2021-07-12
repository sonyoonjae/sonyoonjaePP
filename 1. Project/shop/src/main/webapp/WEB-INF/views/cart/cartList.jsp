<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title> 장바구니 </title>
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
<!--//익스레이어팝업-->
<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
<script type="text/javascript">	
	
	function selected_delete(email, cart_no) {
		if(confirm("삭제 하시겠습니까?") == true) {
			window.location = "./cartDelete?email="+email+"&cart_no=" + cart_no;
		} else {
			return;
		}
	}
	
	function all_delete(email) {
		if(confirm("삭제 하시겠습니까?") == true) {
			window.location = "./cartAllDelete?email="+email;
		} else {
			return;
		}
	}
	
	function all_pay(email) {
		alert("결제창으로 이동합니다.");
		window.location = "../pay/allPayment?email=" + email;
	}
	
	function selected_pay(email, cart_no) {
		alert("결제창으로 이동합니다.");
		window.location = "../pay/selectedPayment?email=" + email + "&cart_no=" + cart_no;
	}
	
	$(document).ready(function() {
		$('#checkbox_${cartVo.cart_no}').click(function() {
			var checked = $('#checkbox_${cartVo.cart_no}').is(':checked');
			$('#checkbox_${cartVo.cart_no}').prop('checked', !checked);
		});
		
		$('#allCheck').click(function() {
			var checked = $('#allCheck').is(':checked');
			
			if(checked) {
				$('input:checkbox').prop('checked', true);
			}
		});
		
		sum_total();
	});
	
	function sum_total() {
		var select_obj = 0;
		$('input[type="checkbox"]:checked').each(function(index) {
			select_obj += parseInt($(this).val());
		});
		
		$('#sum_total_price').text(select_obj);
	}
	
		
</script>

<div id="allwrap">
<div id="wrap">

	<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
	

	<!-- container -->
	<div id="container">

		<div id="outbox_c">		
			<script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>장바구니</strong><span>장바구니에 담긴 상품을 확인해보세요.</span></h2>
					
					<div class="myInfo">

							<div class="info" align="center"><strong>${name}</strong> 님의 정보를 한눈에 확인하세요.</div>

					</div>

				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3>장바구니에 담긴 상품 <span>장바구니에 담긴 상품은 30일간 보관됩니다.</span></h3>
					<div class="orderDivNm">
						<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>장바구니 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col">No.</th>			
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							<tbody>
								<c:set var="sum" value="0" />
								<c:forEach var="cartVo" items="${map.list }">
									<c:if test="${session_email == cartVo.email }">
										<tr>
											<td>
												<input type="checkbox" id="checkbox_${cartVo.cart_no }" 
												value="${cartVo.product_total_price }" onchange="sum_total()">
											</td>
											<td class="left">
												<p class="img">
													<img src="..${cartVo.product_main_image }" alt="상품" width="66" height="66" />
												</p>
												<ul class="goods">
													<li>
														<a href="../view">${cartVo.product_name }</a>
														<p><br>
															<!-- 상세에서 선택한 product_size 텍스트가 나와야 되는 부분/ value값 아님 -->
															선택옵션 : ${cartVo.product_size }
														</p>
													</li>
												</ul>
											</td>
											<td class="tnone">
												<fmt:formatNumber value="${cartVo.product_price }" pattern="#,###" />원 <br />
											</td>
											<td>${cartVo.product_count }</td>
											<td>
												<fmt:formatNumber value="${cartVo.product_total_price }" pattern="#,###" />원 <br />
											</td>
											<td class="tnone">
												<ul class="order">
													<li><a onclick="selected_pay('${session_email }', ${cartVo.cart_no })" href="#" class="obtnMini iw70">바로구매</a></li>
													<li><a onclick="selected_delete('${session_email}', ${cartVo.cart_no})" href="#" class="obtnMini iw70">상품삭제</a></li>
												</ul>
											</td>
										</tr>
										<c:set var="sum" value="${sum + (cartVo.product_total_price) }" />
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a onclick="all_delete('${session_email}')" href="#" class="selectbtn">전체삭제</a></li>
								<li><a onclick="all_pay('${session_email}')" href="#" class="selectbtn">전체구매</a></li>
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					

					<!-- 총 주문금액 -->
					<div class="amount">
						<h4>총 주문금액</h4>
						<ul class="info">
						</ul>
						<ul class="total">
							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span id="sum_total_price"><fmt:formatNumber value="${sum}" pattern="#,###" /></span> 원</li>
							
						</ul>
					</div>
					<!-- //총 주문금액 -->

					<div class="cartarea">
						<ul>
							<li class="last"><a href="../index" class="ty3">쇼핑 <span>계속하기</span></a></li>
							<li><a href="#" class="ty2" onclick="all_pay('${session_email}')">전체상품 <span>주문하기</span></a></li>
						</ul>
					</div>

				<!-- //장바구니에 상품이 있을경우 -->


				<!-- 장바구니에 상품이 없을경우
					<div class="noting">
						<div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

						<p>장바구니에 담긴 상품은 30일간만 보관됩니다.<br/>더 오래 보관하고 싶은 상품은 <u>위시리스트</u>에 담아주세요.</p>

						<a href="#">쇼핑 계속하기</a>
					</div>
				 //장바구니에 상품이 없을경우 -->

				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:44px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
#outbox_c{width: 100%;
    margin: 20px 0 0 110px;
    overflow: hidden;}
</style>





		</div>
	</div>
	<!-- //container -->	



</div>
</div>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>