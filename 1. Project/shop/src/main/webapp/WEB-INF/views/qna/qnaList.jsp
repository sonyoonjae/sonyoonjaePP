<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <link rel="stylesheet" href="../css/page.css">
</head>
<style>
#container{	
	width: 1180px;
	height: auto;
	margin: 0 auto 75px auto;
	color: #101010;
    top: 500px;
}
#page {
    height: 120px;
    width: 374px;
    margin: 0 auto;
    color: #101010;
    margin-bottom: 34px;
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
</style>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
<section>
    <h1 id="notice_h1">Q & A</h1>
    
  
    <div class="wrapper">
      <form action="./qnaList" name="search" method="post">
        <select name="category" id="category">
          <option value="all" ${(map.category eq 'all')? 'selected':'' }>전체</option>
          <option value="qna_title" ${(map.category eq 'qna_title')? 'selected':'' }>제목</option>
          <option value="qna_content" ${(map.category eq 'qna_content')? 'selected':'' }>내용</option>
          <option value="qna_name" ${(map.category eq 'qna_name')? 'selected':'' }>작성자</option>
        </select>

        <div class="title">
          <input type="text" size="16" name="search" id="search" value="${map.search }">
        </div>
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>
    
<div id="container">
    <table>
      <colgroup>
        <col width="10%">
        <col width="48%">
        <col width="15%">
        <col width="15%">
        <col width="12%">
      </colgroup>
      <!-- 제목부분 -->
      <tr>
        <th>No</th>
        <th>제목</th>
        <th>작성일</th>
        <th>작성자</th>
        <th>조회수</th>
      </tr>
      <!-- 내용부분 시작 -->
      <c:forEach var="qnaVo" items="${map.list }">
	      <tr>
	        <td><span class="table-notice">${qnaVo.qna_no }</span></td>
	        <td class="table-title">
	        <!-- content_view?번호를 전달 -->
	        <c:choose>
	        	<%-- 비밀글 코드 1인 경우 : 오픈글 --%>
		        <c:when test="${qnaVo.qna_secret_code == 1 }">
				    <a href="./qnaView?qna_no=${qnaVo.qna_no }&qna_original_name=${qnaVo.qna_original_name }">
				        <c:forEach begin="1" end="${qnaVo.qna_indent}">
				        <img alt="" src="../images/icon_reply.png"></c:forEach>
					    ${qnaVo.qna_title }
				    </a>
			    </c:when>
			    
			    <%-- 비밀글 코드 1이 아닌 경우 : 비밀글 --%>
			    <c:otherwise>
			    	
			    	<%-- 미로그인 시 : 볼 수 없음 --%>
			    	<c:if test="${session_flag == null || session_flag == 'fail' }">
			    		<c:if test="${qnaVo.qna_indent == 0 }">
				    		<img alt="" src="../images/ico/ico_lock.gif">&nbsp;&nbsp; 비밀글입니다.
				    	</c:if>
				    		
				    	<c:if test="${qnaVo.qna_indent != 0 }">	
				    		<c:forEach begin="1" end="${qnaVo.qna_indent}">
					        	<img alt="" src="../images/icon_reply.png">		
					        </c:forEach>
					        <img alt="" src="../images/ico/ico_lock.gif">&nbsp;&nbsp; [답변] 비밀글입니다.
				        </c:if>
			    	</c:if>
			    	
			    	<%-- 관리자 코드 1(일반유저)인 경우--%>
			    	<c:if test="${session_admin_code == 1 }">
			    		
			    		<%-- 세션의 이메일과 작성한 이메일이 일치 : 볼 수 있음 --%>
			    		<c:if test="${session_email == qnaVo.email }">
			    			<a href="./qnaView?qna_no=${qnaVo.qna_no }&qna_original_name=${qnaVo.qna_original_name }">
						        <c:forEach begin="1" end="${qnaVo.qna_indent}">
						        <img alt="" src="../images/icon_reply.png"></c:forEach>
							    ${qnaVo.qna_title }
						    </a>
			    		</c:if>
			    		
			    		<%-- 세션의 이메일과 작성한 이메일이 불일치 : 볼 수 없음 --%>
			    		<c:if test="${session_email != qnaVo.email}">
			    			
				    		<c:if test="${qnaVo.qna_indent == 0 }">
				    			<img alt="" src="../images/ico/ico_lock.gif">&nbsp;&nbsp; 비밀글입니다.
				    		</c:if>
				    		
				    		<c:if test="${qnaVo.qna_indent != 0 }">
				    			<c:if test="${qnaVo.qna_original_name != name }">
				    			<c:forEach begin="1" end="${qnaVo.qna_indent}">
					        		<img alt="" src="../images/icon_reply.png">		
					        	</c:forEach>
					        	<img alt="" src="../images/ico/ico_lock.gif">&nbsp;&nbsp; [답변] 비밀글입니다.
				    			</c:if>
				    			
				    			<c:if test="${qnaVo.qna_original_name == name }">
				    			 <a href="./qnaView?qna_no=${qnaVo.qna_no }&qna_original_name=${qnaVo.qna_original_name }">
						        <c:forEach begin="1" end="${qnaVo.qna_indent}">
						        <img alt="" src="../images/icon_reply.png"></c:forEach>
							    ${qnaVo.qna_title }
						    </a>
				    			</c:if>
				        	</c:if>
			    		</c:if>
			    	</c:if>
			    	
			    	<%-- 관리자 코드 2(관리자)인 경우 --%>
			    	<c:if test="${session_admin_code == 2 }">
			    		<a href="./qnaView?qna_no=${qnaVo.qna_no }&qna_original_name=${qnaVo.qna_original_name }">
						        <c:forEach begin="1" end="${qnaVo.qna_indent}">
						        <img alt="" src="../images/icon_reply.png"></c:forEach>
							    ${qnaVo.qna_title }
						    </a>
			    	</c:if>
			    	
			    </c:otherwise>
			    
		    </c:choose>
	        </td>
	        <td>
	        	<fmt:parseDate value="${qnaVo.qna_date}" var="parseDate"
												pattern="yyyy-MM-dd HH:mm" />
				<fmt:formatDate value="${parseDate}" pattern="yyyy/MM/dd HH:mm" />
	        </td>
	        <td>${qnaVo.qna_name}</td>
	        <td>${qnaVo.qna_hit}</td>
	      </tr>
      </c:forEach>
      <!-- 내용부분 끝 -->
    </table>
<a href="./qnaWrite"><div class="write">작성</div></a>
</div>

 </section>
<div id="page">
    <!-- 하단 넘버링 -->
    <ul class="page-num">
   	  <c:if test="${map.page == 1 }">
		  <li style="background: white" class="first"></li>
	  </c:if>
   	  <c:if test="${map.page > 1 }">
		  <a href="./qnaList?page=1&category=${map.category}&search=${map.search}"><li class="first"></li></a>
	  </c:if>
      <!-- 이전페이지는 1이상일때 -1을 해줌, 1일때는 링크 삭제시킴 -->
      <c:if test="${map.page == 1 }">
		  <li style="background: white" class="prev"></li>
	  </c:if>
      <c:if test="${map.page > 1}">
        <a href="./qnaList?page=${map.page - 1 }&category=${map.category}&search=${map.search}"><li class="prev"></li></a>
      </c:if>
      <!-- 번호넣기 -->
      <c:forEach var="nowPage" begin="${map.startPage}" end="${map.endPage }">
        <c:if test="${map.page == nowPage }">
          <li class="num" style="cursor:default;"><div>${nowPage}</div></li>
        </c:if>
        <c:if test="${map.page != nowPage }">
          <li class="num">
            <a href="./qnaList?page=${nowPage}&category=${map.category}&search=${map.search}"><div>${nowPage}</div></a>
          </li>
        </c:if>
      </c:forEach>
      <!-- 다음페이지는 max보다 작을때 +1 증가, max보다 크거나 같을때 링크 삭제시킴 -->
      <c:if test="${map.page == map.maxPage }">
        <li style="background: white" class="next"></li>
      </c:if>
      <c:if test="${map.page < map.maxPage }">
        <a href="./qnaList?page=${map.page + 1 }&category=${map.category}&search=${map.search}"><li class="next"></li></a>
      </c:if>
      
      <!-- 마지막페이지 이동 -->
      <c:if test="${map.page < map.maxPage }">
      	<a href="./qnaList?page=${map.maxPage }&category=${map.category}&search=${map.search}"><li class="last"></li></a>
	  </c:if>
	  <c:if test="${map.page == map.maxPage }">
	    <li style="background: white" class="last"></li>
	  </c:if>
    </ul>
    <!-- 하단 넘버링 끝 -->
    
</div>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
</body>


</html>