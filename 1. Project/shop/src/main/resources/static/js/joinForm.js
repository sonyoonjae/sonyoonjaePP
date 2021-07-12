/**
 * 
 */

function form_check() {

	if ($("#email").val().length == 0) {
		$("#email").focus();
		return null;

	}
	if  $("#password").val().length == 0) {
		$("#password").focus();
		return null;
	}
	if ($("#name").val().length == 0) {
		$("#name").focus();
		return null;
	}
	if ($("#zipcode").val().length == 0) {
		$("#zipcode").focus();
		return null;
	}
	if ($("#address1").val().length == 0) {
		$("#address1").focus();
		return null;
	}
	if ($("#address2").val().length == 0) {
		$("#address2").focus();
		return null;
	}

	if ($("#phone_no").val().length == 0) {
		$("#phone_no").focus();
		return null;

	}
	if ($("#birth").val() == null) {
		$("#birth").focus();
		return null;

	}
	else {
		alert('회원가입이 완료되었습니다. 로그인해주세요');
		$('#joinDo').submit();
	}

}

//이메일 중복검사
$('.email_input').on("propertychange change keyup paste input", function() {

	var email = $('.email_input').val();
	var data = {
		email: email
	}

	$.ajax({
		type: "post",
		url: "./emailChk",
		data: data,
		success: function(result) {
			if (result != 'fail') {
				$("#joinPossible").css("display", "inline-block");
				$("#joinImPossible").css("display", "none");
				joinanable();
				emailPatternChk();

			} else {
				$("#joinImPossible").css("display", "inline-block");
				$("#joinPossible").css("display", "none");
				joindisable();

			}//success 종료
		}//success 종료
	}); //ajax 종료

}); //function 종료

//가입가능	
function joinanable() {
	$('#joinbutton').prop("disabled", false);
	$('#joinbutton').val("가입가능");
}
//가입불가
function joindisable() {
	$('#joinbutton').prop("disabled", true);
	$('#joinbutton').val("가입불가");
}
//이메일 정규표현식
function emailPatternChk() {
	var emailPattern = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
	if (emailPattern.test($("#email").val()) != true) {

		$("#joinInvalidPattern").css("display", "inline-block");
		$("#joinValidPattern").css("display", "none");
		joindisable();
	} else {
		$("#joinValidPattern").css("display", "none");
		$("#joinInvalidPattern").css("display", "none");
		joinanable();

	}
}


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
//주소 api 연동
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {

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
//휴대폰번호 정규표현식
$('#phone_no').on("propertychange change keyup paste input", function() {
	var phonePattern = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/


	if (!phonePattern.test($("#phone_no").val())) {
		$("#phoneMsg2").show();
		$("#phoneMsg1").hide();
		joindisable();
	} else {
		$("#phoneMsg2").hide();
		$("#phoneMsg1").show();
		joinanable();

	};
});


function codeSend(){
	let email=document.getElementById('email').value;
	
	
	let sendData={
		"email":email
	};
	$.ajax({
		type:"post",
		url:"/user/codeSend",
		contentType:"application/json;charset=UTF-8",
		data:JSON.stringify(sendData),
		success:function(data){
			
		},
		error:function(){
			
		}
	});
	
}

function codeConfirm(){
	let code=document.getElementById().value;
	let email=document.getElementById('email').value;
	
	let sendData={
		"code":code,
		"email":email
	};
	
	$.ajax({
		
	})
}