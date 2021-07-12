<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/nav.css">
</head>
<body>

	<nav>
		<h1><a href="../index" id="indexIcon"></a></h1>
		<ul>
			<li><a href="../notice/noticeList" id="nav_a"><span>공지사항</span></a></li>
			<li><a href="../qna/qnaList" id="nav_a">QNA</a></li>
			<c:choose>
				<c:when test="${session_flag == null || session_flag == 'fail' }">
					<li><a href="../user/joinForm" id="nav_a"><span>회원가입</span></a></li>
					<li><a href="../user/login" id="nav_a"><span>로그인</span></a></li> 
				</c:when>
				<c:otherwise>
					<li><a href="../user/userModify?email=${session_email }" id="nav_a">회원정보수정</a></li>
					<li><a href="../user/logout" id="nav_a"><span>로그아웃</span></a></li>
				</c:otherwise>	
			</c:choose>
		</ul>
		<ul>
			<c:choose>
				<c:when test="${session_admin_code == 2 }">
					<li ><a id="admin_icon"  href="../user/adminList"><span>관리자</span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="../cart/cartList" id="nav_a"><span>장바구니</span></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	   
	</nav>

</body>
</html>