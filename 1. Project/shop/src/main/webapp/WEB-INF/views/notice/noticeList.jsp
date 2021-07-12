<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공 지 사 항</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <link rel="stylesheet" href="../css/page.css">
</head>
<style>
#container{	
	width: 1180px;
	height: auto;
	margin: 0 auto 60px auto;
	color: #101010;
    top: 500px;
}
#page {
    height: 120px;
    width: 424px;
    margin: 0 auto;
    color: #101010;
}

.write {
    float: right;
    width: 120px;
    height: 50px;
    line-height: 50px;
    margin: 7px 24px 50px 0;
    border: 1px #d8d6ec solid;
    color: black;
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
table {
    width: 96%;
    margin-top: 75px;
    margin-left: auto;
    margin-right: auto;
    line-height: 40px;
    border-collapse: collapse;
}
</style>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>

  <section>
    <h1 id="notice_h1">NOTICE</h1>

<div id="container">
   <table>
      <colgroup>
        <col width="18%">
        <col width="40%">
        <col width="28%">
        <col width="10%">
      </colgroup>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
     <c:forEach var="noticeVo" items="${map.list }">
	      <tr>
	        <td><span class="table-notice">${noticeVo.notice_no }</span></td>
	        <td class="table-title">
	        <!-- content_view?번호를 전달 -->
		    <a href="./noticeView?notice_no=${noticeVo.notice_no }">${noticeVo.notice_title }</a>
	        </td>
	        <td>${noticeVo.notice_date}</td>
	        <td>${noticeVo.notice_hit}</td>
	      </tr>
    </c:forEach>
   </table>
   <c:if test="${session_admin_code==2 }">
    	<a href="./noticeWrite"><div class="write">쓰기</div>
    </c:if> 
   <div id="page">
	 		<!-- 하단 넘버링 -->
		    <ul class="page-num">
		      <c:if test="${map.page == 1 }">
		      	<li style="background: white" class="first"></li>
		      </c:if>
		      <c:if test="${map.page >1 }">
		      	<a href="./noticeList?page=${map.search}&sort=${map.sort}"><li class="first"></li></a>
		      </c:if>
		      <!-- 이전페이지는 1이상일때 -1을 해줌, 1일때는 링크 삭제시킴 -->
		      <c:if test="${map.page == 1 }">
		        <li style="background: white" class="prev"></li>
		      </c:if>
		      <c:if test="${map.page>1}">
		        <a href="./noticeList?page=${map.page - 1 }&search=${map.search}&sort=${map.sort}"><li class="prev"></li></a>
		      </c:if>
		      
		      <!-- 번호넣기 -->
		      <c:forEach var="nowPage" begin="${map.startPage}" end="${map.endPage }">
		        <c:if test="${map.page == nowPage }">
		          <li class="num"><div>${nowPage}</div></li>
		        </c:if>
		        <c:if test="${map.page != nowPage }">
		          <li class="num">
		            <a href="./noticeList?page=${nowPage}&search=${map.search}&sort=${map.sort}"><div>${nowPage}</div></a>
		          </li>
		        </c:if>
		      </c:forEach>
		      <!-- 다음페이지는 max보다 작을때 +1 증가, max보다 크거나 같을때 링크 삭제시킴 -->
		      <c:if test="${map.page < map.maxPage }">
		        <a href="./noticeList?page=${map.page + 1 }&search=${map.search}&sort=${map.sort}"><li class="next"></li></a>
		      </c:if>
		      <c:if test="${map.page == map.maxPage }">
		       <li style="background: white" class="next"></li>
		      </c:if>
		        <!-- 마지막페이지 이동 -->
		      <c:if test="${map.page < map.maxPage }">
		        <a href="./noticeList?page=${map.maxPage }&search=${map.search}&sort=${map.sort}"><li class="last"></li></a>
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