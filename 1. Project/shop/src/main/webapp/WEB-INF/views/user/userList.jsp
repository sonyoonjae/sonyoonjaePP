<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 리스트</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <link rel="stylesheet" href="../css/page.css">
</head>
<style>
#container{	
	width: 1180px;
	height: auto;
	margin: 0 auto 0 auto;
	color: #101010;
    top: 500px;
}
#h1 {
    margin-top: 54px;
    font-size: 51px;
    width: 291px;
    height: 48px;
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
.title {
    border-radius: 4px;
}
input {
    position: relative;
    top: 5px;
    left: 0.5px;
    border: none;
    font-size: 19px;
	width:180px;
}
button {
    position: absolute;
    width: 47px;
    height: 40px;
    margin-left: 107px;
    margin-top: -19.5px;
    border-radius: 4px;
    border: #e49f43;
    cursor: pointer;
}
#page {
    height: 120px;
    width: 324px;
    margin: 0 auto;
    color: #101010;
    margin-top: 30px;
}
.wrapper {
    position: relative;
    margin-bottom: 26px;
    align-items: right;
    margin-left: 822px;
}
</style>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
  <section>
	<div id="container">
    <h1 id="h1">회원 리스트</h1>
    <div class="wrapper">
      <form action="./userList" name="search" method="post">
        <select name="category" id="category">
          <option value="all" ${(map.category eq 'all')? 'selected':'' }>전체</option>
          <option value="name" ${(map.category eq 'name')? 'selected':'' }>이름</option>
          <option value="email" ${(map.category eq 'email')? 'selected':'' }>이메일</option>
          <option value="phone_no" ${(map.category eq 'phone_no')? 'selected':'' }>전화번호</option>
        </select>

        <div class="title">
          <input type="text" size="16" name="search" id="search" value="${map.search }">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

   <table>
      <colgroup>
        <col width="12%">
        <col width="22%">
        <col width="22%">
        <col width="22%">
        <col width="22%">
      </colgroup>
      <tr>
        <th>No.</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>생년월일</th>
      </tr>
     <c:forEach var="userVo" items="${map.list }">
	      <tr>
	        <td>${userVo.user_no }</td>
	        <td>${userVo.name }</td>
	        <td>${userVo.email }</td>
	        <td>${userVo.phone_no }</td>
	        <td>${userVo.birth }</td>
	      </tr>
   
    </c:forEach>
   </table>
<div id="page">
    <!-- 하단 넘버링 -->
    <ul class="page-num">
      <c:if test="${map.page == 1 }">
		  <li style="background: white" class="first"></li>
	  </c:if>
      <c:if test="${map.page > 1 }">
     	 <a href="./userList?page=1"><li class="first"></li></a>
      </c:if>
      
      <!-- 이전페이지는 1이상일때 -1을 해줌, 1일때는 링크 삭제시킴 -->
      <c:if test="${map.page == 1 }">
        <li style="background: white" class="prev"></li>
      </c:if>
      <c:if test="${map.page > 1}">
        <a href="./userList?page=${map.page - 1 }"><li class="prev"></li></a>
      </c:if>
      
      <!-- 번호넣기 -->
      <c:forEach var="nowPage" begin="${map.startPage }" end="${map.endPage }">
        <c:if test="${map.page == nowPage }">
          <li class="num"><div>${nowPage}</div></li>
        </c:if>
        <c:if test="${map.page != nowPage }">
          <li class="num">
            <a href="./userList?page=${nowPage}"><div>${nowPage}</div></a>
          </li>
        </c:if>
      </c:forEach>
      
      <!-- 다음페이지는 max보다 작을때 +1 증가, max보다 크거나 같을때 링크 삭제시킴 -->
      <c:if test="${map.page == map.maxPage }">
        <li style="background: white" class="next"></li>
      </c:if>
      <c:if test="${map.page < map.maxPage }">
        <a href="./userList?page=${map.page + 1 }"><li class="next"></li></a>
      </c:if>
      
      <!-- 마지막페이지 이동 -->
      <c:if test="${map.page < map.maxPage }">
      	<a href="./userList?page=${map.maxPage }"><li class="last"></li></a>
      </c:if>
      <c:if test="${map.page == map.maxPage }">
	    <li style="background: white" class="last"></li>
	  </c:if>
    </ul>
    <!-- 하단 넘버링 끝 -->
    </div>
</div>
  </section>

  <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>	
</body>
</html>