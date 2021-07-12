<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<c:if test="${session_flag == null || session_flag == 'fail' || session_admin_code == 1 }">
	   <script type="text/javascript">
	      alert("접근권한이 없습니다.");
	      window.location = "../index";
	   </script>
	   <%-- <c:redirect url="../index" /> --%>
	</c:if>
<title> 상품 등록하기 </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/content.css" />
<link rel="stylesheet" href="../css/notice_list.css">
 <link rel="stylesheet" href="../css/read.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
</script>
<style>
#container{	
	width: 1180px;
    height: auto;
    margin: 0 auto 30px auto;
    color: #101010;
    padding-top: 0px;
}
#h1 {
    margin-top: 100px;
    margin-left: 16px;
    font-size: 31px;
    width: 266px;
    height: 100px;
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
table {
    width: 96%;
    margin-top: 0px;
    margin-left: auto;
    margin-right: auto;
    line-height: 40px;
}
section {
    text-align: center;
    top: 15px;
}
textarea {
    padding: 5px;
    border: white;
    font-size: 15px;
    height:182px;
    width:659px
}
table tr {
    height: 100px;
}
table th {
    text-align: center;
    padding: 0px;
    /* margin: 25px; */
}
input {
    position: relative;
    top: 0px;
    left: 0px;
    border: none;
    font-size: 20px;
    width: 100%;
}
#product_total_stock input {
    position: relative;
    top: 0px;
    left: 0px;
    border: none;
    font-size: 20px;
    width: 17%;
    background: #ffffff;
    border: 1px #cca8a8 solid;
    border-bottom: none;
    border-top: none;
    text-align: center;
}
#product_total_stock  {
    font-size: 20px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>

<div id="container">


		
	<div class="inputBody">
	   <h1 id="h1">🎁상품 등록</h1>
		
			<form action="./productInsertDo" name="productInsert" method="post" enctype="multipart/form-data">
		      <table>
		        <colgroup>
		          <col width="20%">
		          <col width="80%">
		        </colgroup>
		        
		        <tr>
		          <th>스타일번호</th>
		          <td>
		            <input type="text" name="st_no" >
		          </td>
		        </tr>
		        
		        <tr>
		          <th>상품명</th>
		          <td>
		            <input type="text" name="product_name">
		          </td>
		        </tr>
		        
		        <tr>
		          <th>이미지</th>
		          <td>
		            <input multiple="multiple" type="file" name="files" class="file">
		          </td>
		        </tr>
		        
		        
		        
		        
		        
		        <tr>
		          <th>가격</th>
		          <td id="product_price">
		            <input type="text" name="product_price">
		          </td>
		        </tr>
		        
				<tr>
		          <th>재고</th>
		          	<td id="product_total_stock">
		          		<c:set var="sum" value="0" />
		          		<c:forEach var="i" begin="230" end="300" step="10">
		            		${i } : <input type="text" name="product_size_${i }">
		          		</c:forEach>
		            	<c:set var="sum" value="${sum + i}" />
		          
		          	</td>
		        </tr>
				
		        
		        <tr>
		          <th>설명</th>
		          <td>
		            <textarea name="product_description" cols="50" rows="10"></textarea>
		          </td>
		        </tr>
		        
		      </table>
		        <button type="button" class="list" onclick="javascript:location.href='../user/adminList'">취소</button>
		        <button type="submit" class="list">등록하기</button>
		    </form>
		</div>

	</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>