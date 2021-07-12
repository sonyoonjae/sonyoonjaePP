<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title> ID 찾기 발송 </title>

<style type="">
#find{margin:-20px 0 0 12px;}
#find1{margin: 57px 0 0 0;}
#request{margin: -19px 0 -15px 0;}
</style>

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="margin:0; padding:0; font:normal 12px/1.5 돋움;">


<table width="700" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td style="width:700px;height:175px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;">
		<img src="../images/email/SEARCH1.png" alt="RUNNER'Z"  width="700px" height="175px" id="find1"/>					
	</td>
</tr>
<tr>
	<td style="width:700px;height:78px;padding:0;margin:0;vertical-align:top;">
		<p style="width:620px;margin:50px 0 40px 38px;text-align:center;font-size:0;line-height:0;">
		<img src="../images/email/find1.png" alt="문의하신 회원님 EMAIL " width="620px" margin="0px 20px 40px 38px" id="find"/></p>
	</td>
</tr>
<tr>
	<td style="width:700px;height:179px;padding:0;margin:0;vertical-align:top;">
		<table width="618" height="177" cellpadding="0" cellspacing="0" align="center" style="margin:0 0 0 40px;border:1px #d9d9d9 solid;">
		<tr>
			<td style="width:618px;height:235px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;background:#f9f9f9;">
				<p style="width:620px;margin:30px 0 0 0;padding:0;text-align:center;">
				<img src="../images/email/request3.png" alt="EMAIL찾기를 요청하셨습니다." width="620px"margin="30px 0 0 0"padding="0" text-align="center" id="request"/></p>
				<!-- <p style="width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#333;font-size:20px;line-height:1.4;"><strong>RUNNER'Z</strong>에서 <STRONG>EMAIL</STRONG>찾기를 요청하셨습니다.</p> -->
				<p style="width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#666666;font-size:15px;line-height:1;"><strong>EMAIL : <span style="color:darkblue;line-height:1;font-size:20px;">${session_email }</span></strong></p>
				<p style="width:620px;margin:30px 0 5px 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;">RUNNER'Z에서는 고객님께 보다 나은 서비스를 제공하기 위해 항상 노력하고 있습니다.<br/>앞으로 많은 관심 부탁드립니다.</p>
				<p></p>
			</td>
		</tr>
		</table>	
	</td>
</tr>
<tr>
	<td style="width:700px;height:120px;padding:0;margin:0;vertical-align:top;">
		<p style="width:700px;margin:30px 0 50px 0;text-align:center;"><a href="/index"><img src="../images/email/btn_main.PNG" alt="메인 페이지 바로가기" /></a></p>
	</td>
</tr>
<tr>
	<td style="width:700px;height:50px;padding:0;vertical-align:top;font-size:0;line-height:0;text-align:center;">
		<img src="../images/email/img_email_bottom.jpg" alt="" />
	</td>
</tr>
<tr>
	<td style="width:700px;height:140px;padding:0;margin:0;vertical-align:top;background-color:#5a524c;">
		<p style="width:620px;margin:20px 0 0 40px;padding:0;text-align:center;line-height:1.5;color:#b2aeac;">메일수신을 원치 않으시는 분은 로그인 후. <span style="color:#ffffff">메일 수신 여부</span>를 변경해주시기 바랍니다.<br/>IF YOU DO NOT WISH TO RECEIVE EMAILS FROM US, PLEASE LOG-IN AND UPDATE<br/> YOUR MEMBERSHIP INFORMATION.</p>

		<p style="width:620px;margin:15px 0 0 40px;padding:0;text-align:center;line-height:1.5;color:#b2aeac;"><span style="color:#ffffff">본 메일에 관한 문의사항은 사이트 내 고객센터를 이용해주시기 바랍니다.</span><br/>COPYRIGHT ©  2014 RUNNER'Z ALL RIGHTS RESERVED.</p>
	</td>
</tr>
</table>



</div>
</body>
</html>