<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title> 결제창 </title>
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
<script type="text/javascript" src="../js/payment.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	


});
</script>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Fredoka+One&family=Jua&display=swap');

.checkTable td label {
    font-size: 16px;
    color: #000;
    padding: 0px 12px 0px 9px;
    font-family: 'Fredoka One', cursive;
}
input#method01 {
    margin-top: 2px;
}
</style>
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

     var settimediv = 200000; //지속시간(1000= 1초)
     var msietimer;

     $(document).ready(function () {
         msiecheck();
     });

     var msiecheck = function () {
         var browser = navigator.userAgent.toLowerCase();
         if (browser.indexOf('msie 6') != -1 ||
                browser.indexOf('msie 7') != -1 ||
				 browser.indexOf('msie 8') != -1) {
             msieshow();			 
         }
         else {
             msiehide();
         }
     }

     var msieshow = function () {
        $("#ieUser").show();
        msietimer = setTimeout("msiehide()", settimediv);
     }

     var msiehide = function () {
		$("#ieUser").hide();
        clearTimeout(msietimer);
     }
</script>

<div id="allwrap">
<div id="wrap">

	<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>


	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li class="last">주문/결제</li>
			</ol>
		</div>
		
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>주문/결제</strong></h2>
					
					<!-- 주문 상품 -->
					<h3 class="dep">주문 제품 확인</h3>
					<div class="orderDivNm">
						<table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문 제품 확인</caption>
							<colgroup>
							<col width="*" />
							<col width="16%" class="tnone" />
							<col width="14%" />
							<col width="16%" class="tw28"/>
							</colgroup>
							<thead>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
							</thead>
							<tbody>
							<c:set var="sum" value="0" />
								<c:forEach var="cartVo" items="${map.list }">
								<tr>
									<td class="left">
										<p class="img"><img src="..${cartVo.product_main_image }" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="#">${cartVo.product_name }</a>
												<p><br>
													<!-- 상세에서 선택한 product_size 텍스트가 나와야 되는 부분/ value값 아님 -->
													선택옵션 : ${cartVo.product_size }
												</p>
											</li>
										</ul>
									</td>
									<td class="tnone">
										<fmt:formatNumber value="${cartVo.product_price}" pattern="#,###"/> 원
									</td>
									<td>${cartVo.product_count } 개</td>
									<td><fmt:formatNumber value="${cartVo.product_total_price }" pattern="#,###" /> 원</td>
								</tr>
								<c:set var="sum" value="${sum + (cartVo.product_total_price)}" />
								<input type="hidden" value="${sum }">
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="poroductTotal">
						<ul>	
							<li>상품 합계금액 <strong><fmt:formatNumber value="${sum}" pattern="#,###" /></strong> 원</li>
							<li>+ 배송비 
								<c:if test="${100000 lt sum }">
									<span class="won"><strong>0</strong> 원</span>
								</c:if>
								<c:if test="${100000 ge sum }">
									<span class="won"><strong><fmt:formatNumber value="3000" pattern="#,###" /></strong> 원</span>
								</c:if>
							</li>	
							<li>= 총 합계 
								<c:if test="${100000 lt sum }">
									<li class="money"><span><fmt:formatNumber value="${sum}" pattern="#,###" /></span> 원</li>
								</c:if>
								<c:if test="${100000 ge sum }">
									<li class="money"><span><fmt:formatNumber value="${sum + 3000}" pattern="#,###" /></span> 원</li>
								</c:if>
							</li>
					
						</ul>
						<input type='hidden' value="${sum}" id="total_price">
						<input type="hidden" value="1922-1944-1946-2014" id="mall_account">
					</div>
					<!-- //주문 상품 -->
					

			<!-- 주문자 주소 입력 -->
					<h3 class="diviLeft">주문자 주소 입력</h3>


					<div class="checkDiv">
						<table summary="주문자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문자 주소 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td><input type="text" id="name" class="name" value="${name }" readonly/></td>
								</tr>

								<tr>
									<th scope="row"><span>주소</span></th>
									<td>
										<ul class="pta">

											<li><input type="text" class="zipcode" name="zipcode" value="${session_zipcode }" readonly></li>
											<li class="pt5"><input type="text" name="address1" class="address1" value="${session_address1 }" readonly></li>
											<li class="pt5"><input type="text" name="address2" class="address2" value="${session_address2 }" readonly/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" class="email" name="email" value="${session_email }" readonly/></li>

										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰 번호</span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="text" class="phone_no" value=${session_phone_no } readonly/></li>
										</ul>
									</td>
								</tr>

							</tbody>
						</table>
					</div>



			<!-- 총 주문금액 -->
					<div class="amount">

						<!-- 회원 일때 -->
						<h4 class="member">총 주문금액</h4>
						<!-- 회원 일때 -->
						<!-- 비회원 일때  <h4>총 주문금액</h4> //비회원 일때 -->

						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won"><strong><fmt:formatNumber value="${sum}" pattern="#,###" /></strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong>0</strong> 원</span>
							</li>
							<li>
								<span class="title">쿠폰 할인</span>
								<span class="won"><strong>0</strong> 원</span>
							</li>
							<!-- //회원 일떄만 -->
						</ul>

						<ul class="total">
							
							<!-- //회원 일때만 -->

							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span><fmt:formatNumber value="${sum}" pattern="#,###" /></span> 원</li>
						</ul>
					</div>
			<!-- //총 주문금액 -->



			<!-- 결제수단 선택 -->
					<h3 class="dep">결제수단 선택</h3>
					<div class="checkDiv">
						<table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>결제수단 선택</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>결제수단</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="radio" id="method01" name="method" checked="checked" /><label for="method01">PayMent's</label>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- //결제수단 선택 -->

					<div class="disnone method01"><!-- PayMent's -->
						<p class="orderalert"><strong>[PayMent's]</strong> PayMent's로 결제를 진행합니다.</p>
					</div>
				
						<!-- 개인소득공제 -->
						<div class="receipt individual">
							<dl>
								<dt>발급방식</dt>
								<dd>
									<ul>
										<li><input type="radio" name="individual" id="phone" checked="checked" /><label for="phone">휴대폰</label></li>
										<li><input type="radio" name="individual" id="securitynumber" /><label for="securitynumber">주민등록번호</label></li>
										<li><input type="radio" name="individual" id="cashreceipts" /><label class="fn" for="cashreceipts">현금영수증카드</label></li>
									</ul>
								</dd>
							</dl>
							
							<ul class="inform phone"><!-- 휴대폰 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title cb">휴대폰</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<ul class="inform securitynumber"><!-- 주민등록번호 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title cb">주민등록번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<ul class="inform cashreceipts"><!-- 현금영수증카드 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title2 cb">현금영수증카드 번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
						</div>
						<!-- //개인소득공제 -->

						<!-- 사업자 지출증빙 -->
						<div class="receipt corporate">
							<dl>
								<dt>발급방식</dt>
								<dd>
									<ul>
										<li><input type="radio" name="corporate" id="corporatenumber" checked="checked" /><label for="corporatenumber">사업자번호</label></li>
										<li><input type="radio" name="corporate" id="corporate_cash" /><label class="fn" for="corporate_cash">현금영수증카드</label></li>
									</ul>
								</dd>
							</dl>

							<ul class="inform corporatenumber"><!-- 사업자번호 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title2 cb">사업자등록 번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<ul class="inform corporate_cash"><!-- 현금영수증카드 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title2 cb">현금영수증카드 번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
						</div>
						<!-- //사업자 지출증빙 -->

					</div>


						
				
					

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="orderCenter">
							<ul>
								<li><a href="#" class="nbtnbig iw0140" onclick="history.back(-1);">뒤로가기</a></li>
								<li><a href="#" class="sbtnMini iw0140">주문 / 결제</a></li>								
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
				


				</div>
			</div>
			<!-- //maxcontents -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	// select, radio - display check

	// 1 Step Radio
	var firstchk = $("input:radio[name=method]:checked").attr("id");
	$("div." + firstchk).css("display","block");
	$("input:radio[name=method]").click(function(){
		var divchk = $(this).attr("id");		
		$(".disnone").css("display","none");
		$("div." + divchk).css("display","block");
	});
	
	// 2 Step 영수증 Select
	var firstselect = $("select[name=receiptChk] option:selected").attr("value");
	$("div." + firstselect).css("display","block");
	$("select[name=bank]").css("width","125px");
	$("select[name=receiptChk]").css("width","112px");
	$("select[name=receiptChk]").change(function() {
        $(".receipt").css("display","none");
        if($(this).val() == "none"){ $(".receipt").css("display","none"); }
        else if($(this).val() == "individual"){ $(".individual").css("display","block"); }
		else{ $(".corporate").css("display","block"); }

		var firstindi = $("input:radio[name=individual]:checked").attr("id");
		var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
		$("ul." + firstindi).css("display","block");		
		$("ul." + firstcorp).css("display","block");
    });
	
	// 3-1 Step 발급방식 - 개인
	var firstindi = $("input:radio[name=individual]:checked").attr("id");
	$("ul." + firstindi).css("display","block");
	$("input:radio[name=individual]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});

	// 3-2 Step 발급방식 - 사업자
	var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
	$("ul." + firstcorp).css("display","block");
	$("input:radio[name=corporate]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});





	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
		var couponCheck = 760;
	}else{
		var layerCheck = 320;
		var couponCheck = 320;
	}

	$(".addressBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});

	$(".nbtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : couponCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			$('#fancybox-wrap').css('top','400px');
			$('html,body').animate({ scrollTop: 400 }, 500);
			});
		}
	});


});
</script>



		</div>
	</div>
	<!-- //container -->




	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>



</div>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>