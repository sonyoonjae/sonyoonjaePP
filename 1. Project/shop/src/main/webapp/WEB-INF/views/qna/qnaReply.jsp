<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>QNA 답변</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/notice_list.css">
  <link rel="stylesheet" href="../css/read.css">
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
    margin-top: 121px;
    font-size: 51px;
    width: 274px;
    height: 76px;
}	
#radio_circle{
	top: 1px;
    margin: 0 9px 0 0px;

}
#radio_circle1{
	top: 1px;
    margin: 0 9px 0 29px;
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
}
textarea {
    padding: 5px;
    border: white;
    font-size: 15px;
    height: 167px;
}
table {
    width: 96%;
    margin-top: 1px;
    margin-left: auto;
    margin-right: auto;
    line-height: 40px;
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
</style>
 <script type="text/javascript">
	  document.addEventListener("DOMContentLoaded", function(){
		  document.getElementById("qna_secret_code${qnaVo.qna_secret_code }").checked = true;
	  });
</script>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
<section>
<div id="container">
    <h1 id="h1">QNA 답글</h1>

    <form action="./qnaReplyDo" name="qnaReply" method="post">
      <table>
      <input type="hidden" name="qna_no" value="${qnaVo.qna_no }">
      <input type="hidden" name="qna_group" value="${qnaVo.qna_group }">
      <input type="hidden" name="qna_step" value="${qnaVo.qna_step }">
      <input type="hidden" name="qna_indent" value="${qnaVo.qna_indent }">
      <input type="hidden" name="qna_original_name" value="${qnaVo.qna_original_name }">
      
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="qna_name" value="${name }">
            <input type="hidden" name="email" value="${session_email }">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="qna_title" value="[답글] ${qnaVo.qna_title }">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
<textarea name="qna_content" cols="50" rows="10">


---------------------------
[답글]
${qnaVo.qna_content }
</textarea>
          </td>
        </tr>
        <tr>
        	<th>비밀글 체크</th>
        	<td>
		        <div id="radiobox">
		        	<input type="radio" id ="radio_circle" name="qna_secret_code" value="1" checked>오픈글
					<input type="radio" id ="radio_circle1" name="qna_secret_code" value="2">비밀글   
		        </div>
        	</td>
        </tr>
        
      </table>
        <button type="button" class="list" onclick="javascript:location.href='./qnaList'">취소</button>
        <button type="submit" class="list">답변완료</button>
    </form>
	</div>
  </section>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>