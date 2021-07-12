<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style_header.css">
<link rel="stylesheet" type="text/css"
	href="../css/style_join02_info_input.css">
<link rel="stylesheet" type="text/css" href="../css/style_footer.css">
<title>회원가입 - 회원정보입력</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
  	function form_check() {
  		
		if($("#password").val().length==0){
			$("#password").focus();
			return null;
		}
 		if($("#name").val().length==0){
			$("#name").focus();
			return null;
		}
		if($("#zipcode").val().length==0){
			$("#zipcode").focus();
			return null;
		}
		if($("#address1").val().length==0){
			$("#address1").focus();
			return null;
		}
		if($("#address2").val().length==0)	{
			$("#address2").focus();
			return null;
		}

		if($("#phone_no").val().length==0){
			$("#phone_no").focus();
			return null;
		}
		else{
			alert('회원정보수정이 완료되었습니다.');
			$('#userModifyDo').submit();
		}
	} 

	
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
	<section>
		<form action="./userModifyDo" name="userModifyDo" id= "userModifyDo" method="post">
			<div id="locationN">
				<ul>
					<li>HOME</li>
					<li>회원정보수정</li>
					<li>회원정보입력</li>
				</ul>
			</div>

			<div id="sub_top_area">
				<h3>회원정보수정</h3>
			</div>

			<div id="join_step_div">
				<ul>
					<li><span></span>
						<p></p></li>
					<li><span>회원정보수정</span>
						<p>정보입력</p></li>
					<li><span></span>
						<p></p></li>
				</ul>
			</div>

			<h4>
				필수 정보 입력 <span>(* 항목은 필수 항목입니다.)</span>
			</h4>
			<fieldset class="fieldset_class">
				<dl id="join_mail_dl">
					<dt>
						
						<label for="email">이메일</label>

					</dt>
					<dd>
						<input type="text" id="email" name="email" value="${userVo.email}" readonly/>
					</dd>
				<dl id="join_pw1_dl">
					<dt>
						<div></div>
						<label for="pw1">비밀번호</label>
					</dt>
					<dd>
						<input type="password" id="password" name="password" required />
						<span>영문, 숫자 사용가능하며 4자리이상</span>
					</dd>
				</dl>
				<dl id="join_pw2_dl">
					<dt>
						<div></div>
						<label for="pw2">비밀번호 확인</label>
					</dt>
					<dd>
						<input type="password" id="password2" name="password2" />
						<span id="pwdMsg1">비밀번호가 일치합니다.</span> 
						<span id="pwdMsg2">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</span> 
					</dd>
				</dl>
				</dl>
				<dl id="join_name_dl">
					<dt>
						<div></div>
						<label for="name">이름</label>
					</dt>
					<dd>
						<input type="text"name="name" id ="name" value="${userVo.name }" maxlength="20" required />
					</dd>
				</dl>

				<dl id="join_address_dl">
					<dt>
						<div></div>
						<label for="">주소</label>
					</dt>
					<dd>
						<input type="text" id="zipcode" name="zipcode" value="${userVo.zipcode }" required readonly />
						<input type="button" value="우편번호" onclick="findAddr()" />
						</p>
						<input type="text" id="address1" name="address1" value="${userVo.address1 }" required readonly />
						<input type="text" id="address2" name="address2" value="${userVo.address2 }" required />
					</dd>
				</dl>

				<dl id="join_tell_dl">
					<dt>
						<div></div>
						<label for="f_tell">휴대전화</label>
					</dt>
					<dd>
						<input type="text" id="phone_no" name="phone_no" maxlength="11" value="${userVo.phone_no }" required /> <span>ex)01012341234</span>
						<span style="display:none;" id="phoneMsg1">사용가능한 휴대전화입니다.</span> 
						<span style="display:none;" id="phoneMsg2">휴대전화 양식에 맞춰 다시 입력해주세요.</span>
					</dd>
				</dl>
			</fieldset>
			<div id="info_input_button">
				<input type="reset" value="취소하기" onclick="javascript:location.href='../index'" /> 
				<input type="button" id="joinbutton"  value="수정하기" onclick="form_check()" />
			</div>

		</form>
	</section>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
<script>
	//주소 api 연동
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				document.getElementById('zipcode').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("address1").value = jibunAddr;
				}
			}
		}).open();
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	
 	//가입가능	
	function joinanable() {
		$('#joinbutton').prop("disabled", false);
		$('#joinbutton').val("수정가능");
	}
	//가입불가
	function joindisable() {
		$('#joinbutton').prop("disabled", true);
		$('#joinbutton').val("수정불가");
	}

	//휴대폰번호 정규표현식
	$('#phone_no').on("propertychange change keyup paste input", function() {
		var phonePattern = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/

			
		if(!phonePattern.test($("#phone_no").val())) {
			$("#phoneMsg2").show();
			$("#phoneMsg1").hide();
			joindisable();			
		}else{
			$("#phoneMsg2").hide();
			$("#phoneMsg1").show();
			joinanable();
			
		};
	});
	//비밀번호 일치,불일치
	$(function() {
		$("#pwdMsg1").hide();
		$("#pwdMsg2").hide();
		$("input:password").keyup(function() {
			var password1 = $("#password").val();
			var password2 = $("#password2").val();
			if (password1 != "" || password2 != "") {
				if (password1 == password2) {
					$("#pwdMsg1").show();
					$("#pwdMsg2").hide();
					joinanable();
				} else {
					$("#pwdMsg1").hide();
					$("#pwdMsg2").show();
					joindisable();
				}
			}
		});
	});

	


	


</script>

</html>