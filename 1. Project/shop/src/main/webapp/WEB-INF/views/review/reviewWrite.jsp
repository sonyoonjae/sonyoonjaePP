<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<c:if test="${session_flag == null || session_flag == 'fail'}">
	<script type="text/javascript">
		alert("로그인을 하셔야 글을 쓸 수 있습니다.");
		location.href = "../user/login";
	</script>
</c:if>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매후기 작성</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../css/notice_list.css">
  <link rel="stylesheet" href="../css/read.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
#container{	
	width: 1180px;
	height: auto;
	margin: 0 auto 123px auto;
	color: #101010;
    margin-top: -67px;
}
#h1 {
    margin-top: 107px;
    font-size: 51px;
    width: 232px;
    height: 76px;
}	
.list {
    float: right;
    width: 120px;
    height: 50px;
    line-height: 50px;
    margin: 7px 24px 50px 0;
    border: 1px #d8d6ec solid;
    color: black;
    background:white;
    cursor:pointer;
}
button {
    top: 50%;
	left: 50%;
	width: 40px;
	height: 40px;
	background: #666666;
	color: white;
	border: none;
	cursor:pointer;
}
table {
    width: 96%;
    margin-top: 0px;
    margin-left: auto;
    margin-right: auto;
    line-height: 40px;
}
section {
    text-align: center;
    top: 15px;
}
textarea {
    padding: 5px;
    border: white;
    font-size: 15px;
    width: 782px;
    height: 180px;
}
#radio_circle{
	top: 1px;
    margin: 0 9px 0 0px;

}
#radio_circle1{
	top: 1px;
    margin: 0 9px 0 29px;
}
label.star input {
    top: 2px;
    margin: 0 4px 0 9px;
}

</style>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
	<section>
	<div id="container">
		<h1 id="h1">구매후기</h1>
		<!-- enctype="multipart/form-data" : 이걸 써줘야 파일이 업로드된다. 꼭 필요함! -->	
		<form action="./reviewWriteDo" name="reviewWrite" method="post" enctype="multipart/form-data">
		<table>
				<colgroup>
					<col width="15%">
					<col width="85%">
				</colgroup>
				<tr>
					<th>작 성 자</th>
					<td><input type="text" name="email" value="${session_email}" readonly="readonly"></td> <!-- 세션에 저장된 이메일을 value에 -->
						<!-- 번호를 뿌릴곳이 없기 때문에 숨김으로 product_no를 view에서 받아옴 -->
						<input type="hidden" name="product_no" value="${product_no}"></td>
								
				</tr>
				
				<tr>
					<th>제   목</th>
					<td><input type="text" name="review_title"></td>
				</tr>
				<tr>
						<th scope="row"><span>평가</span></th>
						<td>
							<ul class="pta">
							<div id="star2">
								<li>
									<label for="starFive" class="star">
									<input type="radio" name="review_ratings" id="starFive" value="5" checked="checked"/>
									<c:forEach begin="1" end="5">
										<img src="../images/product_images/ico_star.gif" alt="별점" />
									</c:forEach>
									
									<input type="radio" name="review_ratings" id="starFour" value="4"/>
									<c:forEach begin="1" end="4">
										<img src="../images/product_images/ico_star.gif" alt="별점" />
									</c:forEach>
									
									<input type="radio" name="review_ratings" id="starThree" value="3"/>
									<c:forEach begin="1" end="3">
										<img src="../images/product_images/ico_star.gif" alt="별점" />
									</c:forEach>
									
									<input type="radio" name="review_ratings" id="starTwo" value="2"/>
									<c:forEach begin="1" end="2">
										<img src="../images/product_images/ico_star.gif" alt="별점" />
									</c:forEach>

									<input type="radio" name="review_ratings" id="starOne" value="1"/>
										<img src="../images/product_images/ico_star.gif" alt="별점" />
									</label>
								</li>

								
								</div>
							</ul>
						</td>
					</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="review_content" cols="50" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지 표시</th>
					<td><input type="file" name="file" id="file"></td>
				</tr>
			</table>
				<a href="#" onclick="history.back(-1);"><div class="list">돌아가기</div></a>
				<a href="#" onclick="checkfield()"><div class="list">작성완료</div></a>
		</form>
	 </div>
	</section>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
<script>
/* 유효성검사 */
function checkfield(){
 
	 if(document.reviewWrite.review_title.value==""){ 	//review_title값이 없을 경우
	 	alert("제목을 입력하세요");        	 			//메세지 경고창을 띄운 후
	 	document.reviewWrite.review_title.focus();     	// id 텍스트박스에 커서를 위치
	 	exit;
	 }else if(document.reviewWrite.review_content.value==""){
	 	alert("내용을 입력하세요");
	 	document.reviewWrite.review_content.focus();
	 	exit;
	 }
	 
 document.reviewWrite.submit();
}
</script>
</html>