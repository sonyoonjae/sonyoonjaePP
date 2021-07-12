<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
  		<meta charset="UTF-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<title>Pages - Login</title>
  		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  		<link rel="stylesheet" href="../css/login.css">
  	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
       function login_ajax(){
    	   $.ajax({
    			 url:'./login_ajax',
    			 type:'post',
    			 data:{
    				 "email":$("#email").val(),
    				 "password":$("#password").val()
    			 },
    			 success:function(data){
    				 alert(data.msg);
    				 if(data.flag=="success"){
    				    location.href="../index";
    				 }else{
    					 $("#email").val(""); //공백처리 
    					 $("#password").val("");
    					return false;
    				 }
    			 },
    			 error:function(){
    				 alert("에러");
    			 }
    		  });
       }
    </script>
   
</head>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
	<section>
    <h1 id="log">로그인</h1>

	<form action="" method="post">
	<h3 class="input_title" data-v-38b8e602>이메일 주소</h3>
      <div class="input_item" data-v-83b8e602>
        <input type="text" name="email" id="email" class="int" size="45" placeholder="가입하신 email을 입력하세요">
      </div>
      
    <h3 class="input_title" data-v-38b8e602>비밀번호</h3>
      <div class="input_item" data-v-38b8e602>
        <input type="password" name="password" id="password" class="int" size="45" placeholder="비밀번호를 입력하세요">
      </div>
      <button type="button" onclick="login_ajax()">로그인</button>
    </form>

	<a href="./emailPasswordSearch" id="e_search"><strong>이메일/비밀번호찾기&nbsp;</strong></a>


  </section>

</body>
</html>