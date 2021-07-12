<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>상세페이지</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- 웹 페이지에 대한 설명(description)을 정의 -->
<meta name="description" content="SHOES SHOP" />

<!-- 검색 엔진을 위한 키워드(keyword)를 정의 -->
<meta name="keywords" content="JARDIN SHOP" />

<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scaleable=no" />
<!-- 
viewport : 반응형 웹, 모든 장치에서 웹 사이트가 잘 보이도록 뷰포트(viewport)를 설정 
☆width=device-width : 페이지의 너비를 기기의 스크린 너비로 설정합니다. 즉, 렌더링 영역을 기기의 뷰포트의 크기와 같게 만들어 줍니다.
☆initial-scale=1.0 : 처음 페이지 로딩시 확대/축소가 되지 않은 원래 크기를 사용하도록 합니다. 0~10 사이의 값을 가집니다.
☆minimum-scale : 줄일 수 있는 최소 크기를 지정합니다. 0~10 사이의 값을 가집니다.
☆maximum-scale : 늘릴 수 있는 최대 크기를 지정합니다. 0~10 사이의 값을 가집니다.
☆user-scalable : yes 또는 no 값을 가지며 사용자가 화면을 확대/축소 할 수 있는지는 지정합니다.
위의 줌 레벨은 1이 원래크기이고, 0.5 라면 50% 축소를 뜻합니다. -->

<!--
	5초 뒤에 다른 페이지(http://www.tcpschool.com)로 리다이렉트(redirect)
<meta http-equiv="refresh" content="5;url=http://www.tcpschool.com">
	 
	 문서의 저자(author)를 정의
<meta name="author" content="TCPSchool">
-->

<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<!-- 리뷰삭제 -->
<script type="text/javascript">
    function reviewDelete_check(review_no, product_no){
    	if(confirm("삭제하시겠습니까?")){
    		location.href="../review/reviewDelete?review_no=" + review_no +"&product_no=" + product_no;
    		
    	}else{
    		return false;
    	}
    }
    function cartCheck(){
    	
    	
    	$('#cartCheck').submit();
    }
    
    window.onload=function(){
    	joindisable();
    }

 </script>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jomhuria&display=swap');
#main_logo {
    font-size: 20px;
    font-family: 'Jomhuria', cursive;
    background: black;
    color: white;
    width: 51px;
    height: 16px;
    padding: 0px 1px 0px 4px;
}
#style_code{
	font-size: 15px;
	margin: 0 0 30px 0;
	color: #8f8e94;
	
}
#product_price{
	font-size: 26px;
    height: 50px;
    border-bottom: 3px black solid;

}
button#cartButton {
    top: 50%;
    left: 50%;
    width: 430px;
    height: 40px;
    background: #666666;
    color: white;
    border: none;
    cursor: pointer;
}
button#cartButton {
    top: 50%;
    left: 50%;
    width: 430px;
    height: 40px;
    background: #666666;
    color: white;
    border: none;
    cursor: pointer;
}
#total_price{
	border-top: 2px #e4e4e4 solid;
    margin-top: 10px;
    padding-top: 18px;
    height: 39px;

}
h3 {
    font-size: 20px;
    margin-top: 35px;
}
#total_price #total {
    font-size: 34px;
    margin-left: 98px;
    color: #a21616;
}
span.searchStyleSelectBox.changed {
    width: 80px;
}
span.searchStyleSelectBox {
    width: 80px;
}
.detailTab {
    width: 100%;
    margin: 25px 0;
    overflow: hidden;
}
button.btn {
    text-align: center;
    background: #777373;
    height: 45px;
    border: 0px;
    width: 100%;
}
button.btn a {
	color:white;
}
</style>

<body>
	<section class="content">
		<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>


		<br>
		<div id="allwrap">
			<div id="wrap">
				<!-- container -->
				<div id="container">
					<div id="maxcontents">
						<!-- product -->
						<div id="pDetail">

							<!-- Slide -->
							<div class="imgSlide">
								<div class="img">
									<ul>
										<li><img src="${map.productVo.product_main_image }"
											alt="제품이미지" /></li>
										<li><img src="${map.productVo.product_image1 }" /></li>
										<li><img src="${map.productVo.product_image2 }" /></li>
										<li><img src="${map.productVo.product_image3 }" /></li>
										<li><img src="${map.productVo.product_image4 }" /></li>

									</ul>
								</div>

								<div class="thum">
									<ul>
										<li><img src="${map.productVo.product_main_image }"
											alt="썸네일 제품이미지" /></li>
										<li><img src="${map.productVo.product_image1 }"
											alt="썸네일 제품이미지" /></li>
										<li><img src="${map.productVo.product_image2 }"
											alt="썸네일 제품이미지" /></li>
										<li><img src="${map.productVo.product_image3 }"
											alt="썸네일 제품이미지" /></li>
										<li><img src="${map.productVo.product_image4 }"
											alt="썸네일 제품이미지" /></li>
									</ul>
								</div>
							</div>
							<!-- //Slide -->


							<!-- info -->
							<div class="info">
							<form action="<c:url value='../cart/cartInsert'/>" id="cartCheck" method="post"> 
								<div id="main_logo">RUNNER'Z</div>
									<p class="title">${ map.productVo.product_name }</p>
										<div id="style_code" >스타일 번호 ${map.productVo.st_no} | 상품코드 ${map.productVo.product_no}</div>
										<div id="product_price">
											<fmt:formatNumber value="${map.productVo.product_price}" pattern="#,###" /> 원
										</div>
										
								<div class="priceInfo">
									<tr>
										<ul>
											<li>
												<%-- 사이즈 선택 시작 --%>
												<div class="stit">사이즈</div> &emsp; 
												<select name="product_size" id="product_size" style="width:100px; cursor:pointer">
													<option value="" selected="selected">&nbsp;Select Size&nbsp;</option>
													<option value="230">&nbsp;size 230&emsp;</option>	
													<option value="240">&nbsp;size 240&emsp;</option>	
													<option value="250">&nbsp;size 250&emsp;</option>	
													<option value="260">&nbsp;size 260&emsp;</option>	
													<option value="270">&nbsp;size 270&emsp;</option>	
													<option value="280">&nbsp;size 280&emsp;</option>	
													<option value="290">&nbsp;size 290&emsp;</option>	
													<option value="300">&nbsp;size 300&emsp;</option>	
												</select>
												
												<%-- 사이즈 선택 끝 --%>
												<input id="230" type='hidden' value="${map.productVo.product_size_230 }">
												<input id="240" type='hidden' value="${map.productVo.product_size_240 }">
												<input id="250" type='hidden' value="${map.productVo.product_size_250 }">
												<input id="260" type='hidden' value="${map.productVo.product_size_260 }">
												<input id="270" type='hidden' value="${map.productVo.product_size_270 }">
												<input id="280" type='hidden' value="${map.productVo.product_size_280 }">
												<input id="290" type='hidden' value="${map.productVo.product_size_290 }">
												<input id="300" type='hidden' value="${map.productVo.product_size_300 }">
											</li>
											<br>
											
											
											
											<li>
											
												<div class="stit">수&emsp;량</div> 
												&emsp; <strong id="product_stock_1"></strong>
													<div class="num" id="size_amount">
														&emsp; <select name="product_count" id="product_count">
															<option value="0">0</option>
														</select>
													</div>
											
											</li>
												<li id="total_price">
													<div class="stit"><h3><strong>총 결제금액</strong></h3></div> &emsp;
													<div class="num">
														&emsp;<strong id="total"  />
													</div>

												</li>
										</ul>
								</div>
								</table>

								<div class="infobtn"> 
									<ul>
										<c:if test="${session_admin_code == 1 }">
											<input name="product_count" type="hidden" value="${session_product_count}">
											<input name="product_no" type="hidden" value="${ map.productVo.product_no}">
											<input name="email" type="hidden" value="${ session_email}">		
											<input name="product_size" type="hidden" value="${ map.productVo.product_size}">
											<li><button id="cartButton" onclick="cartCheck()" type="button" class="btn btn-primary">장바구니에담기</button></li>
										</c:if>
										
										<c:if test="${session_flag == null || session_flag == '' }">
											<li><a id="ty1" href="../user/login">로그인 하러 가기</a></li>
										</c:if>
										
									</ul>
								</div>
								</form>

							</div>
							<!-- //info -->

						</div>
						<!-- //product -->


						<!-- tab -->
						<div class="detailTab">
							<ul>
								<li class="dep"><a href="javascript:;" onclick="return false;" id="detailInfo">상품상세 정보</a></li>
								<li class="dep"><a href="javascript:;" onclick="return false;" id="goodsReview">상품리뷰 </a></li>
								<li class="last"><a href="javascript:;" onclick="return false;" id="goodsNotice">정책 및 공지</a></li>
							</ul>
						</div>
						<script type="text/javascript">$(function(){$(".detailTab ul li a:eq(0)").click();});</script>
						<!-- .eq() 메서드는 선택한 요소의 인덱스 번호에 해당하는 요소를 찾음 -->

						<!-- //tab -->


						<!-- detail content -->
						<div id="detailContent">

							<!-- detail info -->
							<div class="detailInfo disnone" align="center">

								<!-- 상세 큰사진 올리는부분(무단도용방지 사진 가져오는법) : 가져오고 싶은 사진있는곳으로가서 F12 -> 사진부분 검사 -> 
							img alt src =""의 ""안의주소 복사하기 -> 붙여넣기 -> 그럼 사진 저장 안해도 알아서 불러옴, 저작권조심 연습할때만 하기 -->
								<!-- <img src="https://image.a-rt.com/art/editor/202106/1623126029958.jpg" class="web" alt="제품상세 정보" /> -->

								<img src="${map.productVo.product_main_image }" class="web" alt="제품상세 정보" /> 
								<img src="${map.productVo.product_image1 }" class="web" alt="제품상세 정보" /> 
								<img src="${map.productVo.product_image2 }" class="web" alt="제품상세 정보" /> 
								<img src="${map.productVo.product_image3 }" class="web" alt="제품상세 정보" /> 
								<img src="${map.productVo.product_image4 }" class="web" alt="제품상세 정보" /> 
								<img src="${map.productVo.product_image5 }" class="web" alt="제품상세 정보" />

								<div class="checkInfoDiv">
									<table summary="제품의 정보를 알 수 있는 표로 제품명, 내용량, 제조원, 포장재질, 유통기한, 고객상담실, 식품의 유형, 유통전문판매원, 영양성분, 원재료명 및 함량, 업소명 및 소재지 순으로 나열되어 있습니다."
										class="checkTable" border="1" cellspacing="0">
										<caption>제품의 정보</caption>
										<colgroup>
											<col width="20%" class="tw22" />
											<col width="*" />
											<col width="18%" class="tw22" />
											<col width="*" class="tw25" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="info"><span>제품명</span></th>
												<td>신발</td>
												<th scope="row" class="info"><span>제조년월</u></span></th>
												<td>2020/02/05</td>
											</tr>

											<tr>
												<th scope="row" class="info"><span>용도</span></th>
												<td>러닝</td>
												<th scope="row" class="info"><span>재질</span></th>
												<td>겉감: 100% 폴리에스터, 안감: 100% 폴리에스터</td>
											</tr>

											<tr>
												<th scope="row" class="info"><span>원산지</span></th>
												<td>중국</td>
												<th scope="row" class="info"><span>고객<u>상담실</u></span></th>
												<td>1688-1688</td>
											</tr>

											<tr>
												<th scope="row" class="info"><span>제조자/수입자</span></th>
												<td colspan="3">나이키코리아/RUNNER'Z</td>
											</tr>

											<tr>
												<th scope="row" class="info"><span>안전품질표시</u></span></th>
												<td colspan="3">"안전기준에서 정한 유해물질 안전요건에 적합한 제품임"</td>
											</tr>

											<tr>
												<th scope="row" class="info"><span>업소명 <u>및 소재지</u></span></th>
												<td colspan="3">서울시 구로디지털로  디지털로34길 27 대륭포스트타워3차 1106호 (주)RUNNER'Z </td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
                     <!-- detail info -->
							</div>
							<!-- detail info -->

							 <!-- goods review -->
		                    <div class="goodsReview disnone">
		                       <div class="headTitle">
		                          <!-- product_no를 가지고 rewrite로 가기위해서 번호를 담아감-->
		                             <button class="btn"><a class="btn" href="../review/reviewWrite?product_no=${ map.productVo.product_no }">구매 후기 작성</a>
		                          	</button>
		                       </div>
		                       <br> <br> <br>
		                       <!-- 내용부분 -->
		
		                       <div class="accordion">
		                          <ul>
		                             <!-- 반복 -->
		                             <c:forEach var="reviewVo" items="${review_map.list }"> <!-- 위치 잘 보기 -->
		
		                                <li>
		                                   <div class="headArea">
		                                      <div class="subject">
		                                         <a href="javascript:;" class="accbtn">${reviewVo.review_title}</a>
		                                      </div>
		                                      <div class="writer">${reviewVo.email}</div>
		                                      <div class="day">
		                                         <p>${reviewVo.review_date}</p>
		                                         <p>
		                                            <c:forEach begin="1" end="${reviewVo.review_ratings}">
		                                                 <img alt="별점" src="../images/product_images/ico_star.gif" class="rating">
		                                              </c:forEach>
		                                         </p>
		                                      </div>
		                                   </div>
		
		                                   <div class="hideArea">
		                                      <div class="bodyArea">
		                                         <c:if test="${not empty reviewVo.review_image}">
		                                            <img src="${reviewVo.review_image}"><br><br>
		                                         </c:if>
		                                         ${reviewVo.review_content}
		                                      </div>
		                                      
		                                      <div class="modify">
		                                          <c:if test="${session_email == reviewVo.email }">
		                                         <a href="/review/reviewModify?review_no=${reviewVo.review_no }&product_no=${reviewVo.product_no}">수정</a> 
		                                         <a href="#" onclick="reviewDelete_check(${reviewVo.review_no }, ${reviewVo.product_no})">삭제</a>
		                                         </c:if>
		                                      </div>
		
		                                   </div>
		                                </li>
		                             </c:forEach>
		                          </ul>
		                       </div>
		                     </div>
		                       <!-- //반복 -->

                     <!-- //goods review -->

							<!-- goods notice -->
							<div class="goodsNotice disnone">
								<div class="headTitle depth">
									<strong>※ 정책 및 공지&nbsp;</strong>주문 전 필독 사항입니다.
									<br>
									<br>
								</div>

								<div class="detailDiv">
									<table
										summary="정책 및 공지 알림 게시판으로 회원가입안내, 주문안내, 결제안내, 배송안내, 교환/반품안내, 환불안내 순으로 조회 하실수 있습니다. "
										class="detailTable" border="1" cellspacing="0">
										<caption>정책 및 공지</caption>
										<colgroup>
											<col width="22%" class="tw30" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><span>회원가입<br />안내
												</span></th>
												<td>
													<ul>
														<li>저희 쇼핑몰은 회원제로 운영합니다.</li>
														<li>회원가입비나 월회비, 연회비 등 어떠한 비용도 청구하지 않는 100% 무료입니다.</li>
														<li>회원님들께는 구매 시 포인트 혜택을 드립니다.</li>
													</ul>
												</td>
											</tr>

											<tr>
												<th scope="row"><span>주문 안내</span></th>
												<td>
													<ul>
														<li>Step 1 : 상품 검색</li>
														<li>Step 2 : 장바구니에 담기</li>
														<li>Step 3 : 회원 ID 로그인 또는 비회원으로 주문하기</li>
														<li>Step 4 : 주문 성공 화면(주문번호)</li>
													</ul>

													<p class="fn12">
														※비회원 주문인 경우 주문번호와 승인번호(카드 결제 시)를 꼭 메모해 두시기 바랍니다.<br />&nbsp;&nbsp;&nbsp;단,
														회원의 경우 자동으로 저장되므로 따로 관리하실 필요가 없습니다.
													</p>
												</td>
											</tr>

											<tr>
												<th scope="row"><span>결제 안내</span></th>
												<td>
													<ul>
														<li>카드 결제나 무통장 입금을 하시는 경우 입금/결제 확인 후 상품이 배송됩니다.</li>
														<li>무통장 입금 시 주문자와 입금자가 다른 경우 배송이 지연될 수 있습니다. 게시판에 정보를
															남겨주셔야 합니다.</li>
													</ul>
												</td>
											</tr>

											<tr>
												<th scope="row"><span>배송 안내</span></th>
												<td>
													<ul>
														<li>배송 방법 : 택배</li>
														<li>배송 지역 : 전국 지역 (제주 도서/산간지역 별도)</li>
														<li>배송 비용 : 총 결제금액이 100,000원 미만일 경우 2,500원 추가됩니다.</li>
														<li>배송 안내 : 재고가 없거나 재입고 될 경우 7~14일이 소요됩니다.</li>
													</ul>
												</td>
											</tr>

											<tr>
												<th scope="row"><span>교환/반품<br />안내
												</span></th>
												<td>
													<ul>
														<li>저희 쇼핑몰은 교환/반품 정책을 운영하고 있습니다.</li>
														<li>사이즈 교환에 한하여는 1회 교환이 가능합니다. (단, 택배비는 고객 부담입니다.)</li>
														<li>교환 시 제품을 수령한 날로부터 24시간 이내 1:1문의 게시판 혹은 고객센터로 연락을
															주시고 3일 이내에 보내주신 상품에 한하여 교환됩니다.</li>
														<li>제품에 하자가 있는 경우에는 동일 사이즈, 동일 디자인으로 재교환 해 드립니다.</li>
													</ul>
												</td>
											</tr>

											<tr>
												<th scope="row"><span>환불 안내</span></th>
												<td>
													<ul>
														<li>환불 시 반품 확인 여부를 확인 한 후 3일 이내에 결제금액을 환불해 드립니다.</li>
														<li>신용카드로 결제하신 경우, 신용카드 승인을 취소하면 결제 대금이 청구되지 않습니다.</li>
													</ul>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- //goods notice -->


						</div>
						<!-- //detail content -->








						<script type="text/javascript"
							src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
						<script type="text/javascript"
							src="../js/jquery.fancybox-1.3.4.pack.js"></script>
						<link rel="stylesheet" type="text/css"
							href="../css/jquery.fancybox-1.3.4.css" />
						<link rel="stylesheet"
							href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
						<style type="text/css">
.ui-corner-all {
	border-bottom-right-radius: 0 !important;
	border-bottom-left-radius: 0 !important;
	border-top-left-radius: 0 !important;
	border-top-right-radius: 0 !important;
}

.ui-widget-content {
	border: 0;
}

.ui-spinner-input {
	width: 70px;
	margin: 0;
	border: 1px #ddd solid;
	padding: 2px 0 2px 5px;
	font-family: 'Nanum Gothic' !important;
	font-size: 12px !important;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
		
	
	// product_size 선택 시 재고에 맞게 다음 product_count select box 변화
	$("#product_size").change(function() {
// 		var amount = $("#product_stock option:selected").attr("value");
var size= $("#product_size option:selected").attr("value");

var amount=document.getElementById(size).value;
		$("#product_stock_2").text(amount + " 개");
		var html = "";
		for(var i = 0; i <= amount; i++) {
			html += '<option value="'+i+'">'+i+'</option>';
		}
		$("#product_count").html(html);
	});
	function numberFormat(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	//select박스를 이용한 금액 구하기(change: select 박스의 값이 변경되었을 경우 발생되는 이벤트)
	$('#product_count').change(function() { //id가 product_count인것이 바뀌면 함수작동한다.
		var product = $("#product_count option:selected").val(); //물품 갯수를 변수에 담음
		var price="${map.productVo.product_price}"; //물품가격을 변수에 담음, vo에있는것 그대로 불러옴 왜냐면 
													//fmt가 String로만 뜨기 때문에 실행하면 NaN이라는 것만 뜸
		var aaaa = product * (price); //총 금액 구하기
		var prodCount = $("#product_count").val();
		if (prodCount == 0){
			joindisable();
		}else{
			joinanable();
		}
		/* alert(aaaa); */
		$('#total').text(numberFormat(aaaa)+"원");
	});
	
	
	// spinner
	var spinner = $( "#spinner" ).spinner({ min: 1 });
	

	// rolling
	function widthChk(){
		var winWidth = $(window).width();
		if(winWidth > 983){var twidth = 348;
		}else if(winWidth < 983 && winWidth > 767){var twidth = 298;
		}else{var twidth = 248;}
		return twidth
	}

	function slideChk(){
		var ulchk = widthChk() * $(".img ul li").size();
		$(".img ul").css("width",ulchk);
	}
	
	$(".thum ul li").click(function(){
		var winWidth = $(window).width();
		var thumNum = $(".thum ul li").index(this);	
		var ulLeft = widthChk() * thumNum ;
		$(".thum ul li").removeClass("hover");
		$(this).addClass("hover");
		$(".img ul").stop().animate({"left": - ulLeft}, 500);
	});
	

	// goods relation last margin
	function relationChk(){
		var winWidth = $(window).width();
		if(winWidth > 767){
			$(".relationList li").css("margin","0 20px 0 0");
			$(".relationList li:eq(4)").css("margin","0");
		}else if(winWidth < 768 && winWidth > 360){
			$(".relationList li").css("margin","0 10px 10px 0");
			$(".relationList li:eq(4)").css("margin","0");
		}else{
			$(".relationList li").css("margin","0 10px 10px 0");
			$(".relationList li:nth-child(2n)").css("margin","0 0 10px 0");
		}
	}

	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
		var popCheck = 768;
	}else{
		var layerCheck = 320;
		var popCheck = 320;
	}
	$(".passbtn").fancybox({
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

	$(".popBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : popCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});


	// resize
	$(window).resize(function(){
		$(".thum ul li:eq(0)").click();
		slideChk();
		relationChk();
	});


	$(".thum ul li:eq(0)").click();
	slideChk();
	relationChk();

});
//장바구니버튼 활성화
function joinanable() {
	$('#cartButton').prop("disabled", false);
	$('#cartButton').val("담기가능");
}
//장바구니버튼 비활성화
function joindisable() {
	$('#cartButton').prop("disabled", true);
	$('#cartButton').val("담기불가");
}


</script>




					</div>
					<!-- //maxcontents -->

				</div>
				<!-- //container -->
	</section>
	<br>
	<br>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>