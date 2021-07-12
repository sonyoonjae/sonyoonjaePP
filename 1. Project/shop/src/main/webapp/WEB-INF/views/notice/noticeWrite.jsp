<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<c:if test="${session_flag==null || session_flag=='fail' }">
   <script type="text/javascript">
      alert("관리자로그인을 하셔야 글쓰기가 가능합니다.");
   </script>
   <c:redirect url="./noticeList" />
</c:if>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공 지 사 항 글 쓰 기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
</head>

<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>

  <section>
    <h1>관리자 글쓰기</h1>
    <hr>

    <form action="./noticeWriteDo" name="noticeWrite" method="post" enctype="multipart/form-data">
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="email" value="${session_email }" readonly="readonly">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="notice_title">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="notice_content" cols="50" rows="10"></textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="file" id="file">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='./noticeList'">취소</button>
      </div>
    </form>

  </section>


</body>
</html>