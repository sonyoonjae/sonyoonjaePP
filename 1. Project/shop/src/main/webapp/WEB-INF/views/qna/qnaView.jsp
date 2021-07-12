<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>뷰페이지</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/read.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <script type="text/javascript">
    function qnaDelete_check(qna_no){
    	alert("test : " + qna_no);
    	if(confirm("삭제하시겠습니까?")){
    		location.href="./qnaDelete?qna_no=${map.qnaVo.qna_no}";
    	}else{
    		return false;
    	}
    }
  </script>
</head>
<style>
#container{	
	width: 1180px;
	height: auto;
	margin: 0 auto 163px auto;
	color: #101010;
    top: 500px;
}

#h1 {
    margin-top: 54px;
    font-size: 51px;
    width: 166px;
    height: 76px;
}
table {
    width: 96%;
    margin-top: 1px;
    margin-left: auto;
    margin-right: auto;
    line-height: 40px;
}
.list {
    float: right;
    width: 120px;
    height: 50px;
    line-height: 50px;
    margin: 7px 24px 50px 0;
    border: 1px #d8d6ec solid;
    color: black;
    font-size: 13px;
}

</style>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>

<div id="container">
<section>
	<input type="hidden" name="qna_secret_code" value="${map.qnaVo.qna_secret_code }">
    <h1 id="h1">QNA</h1>
    

    <table>
      <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
        
      </colgroup>
      <tr>
        <th colspan="3">&nbsp;제목&nbsp;&nbsp;<span class="separator">|</span> ${map.qnaVo.qna_title }</th>
      </tr>
      <tr>
        <td colspan="3"><strong>작성일</strong><span class="separator">|</span> ${map.qnaVo.qna_date }</td>
      </tr>
      <tr>
        <td><strong>작성자</strong><span class="separator">|</span> ${map.qnaVo.qna_name }</td>
        <td><strong>조회수</strong></td>
        <td>${map.qnaVo.qna_hit }</td>
      </tr>
      <tr>
        <td colspan="3" class="article">${map.qnaVo.qna_content }</td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong> <span class="separator">|</span> [공지] ${map.qnaPre.qna_title }</td>
      </tr>
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span> [공지] ${map.qnaNext.qna_title }</td>
      </tr>
    </table>

    <a href="./qnaList"><div class="list">목록</div></a>

    	<c:if test="${session_email == map.qnaVo.email }">
	    	<a href="#" onclick="qnaDelete_check()"><div class="list">삭제</div></a>
	    	<a href="./qnaModify?qna_no=${map.qnaVo.qna_no}"><div class="list">수정</div></a>
    	</c:if>
    <c:if test="${session_admin_code == 2 }">    	
    	<a href="./qnaReply?qna_no=${map.qnaVo.qna_no}&qna_secret_code=${map.qnaVo.qna_secret_code}&qna_original_name=${map.qnaVo.qna_original_name }"><div class="list">답변달기</div></a>
    </c:if>
  </section>
</div>  
  <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>