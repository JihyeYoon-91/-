<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1> <strong>${id}</strong> 님 mysns페이지 입니다.</h1>
	
	<a href="${pageContext.request.contextPath}/snsuser/private/list.jsp">sns가입 회원목록 보러가기 </a>
	<a href="${pageContext.request.contextPath}/snsuser/private/myimages.jsp">나의 이미지들 보러가기</a>
</div>
</body>
</html>