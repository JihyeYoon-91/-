<%@page import="imgDao.ImgDao"%>
<%@page import="imgDto.ImgDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//1. 폼 전송되는 파라미터 읽어오기 (글제목, 내용)
	String content=request.getParameter("content");
	//글 작성자
	String writer=(String)session.getAttribute("id");
	//2. DB 에 글 정보를 저장하고
	boolean isSuccess=ImgDao.getInstance().insert(writer,content);
	//3. 응답하기
	
	session.setAttribute("isSuccess", isSuccess);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/snsuser/private/imgInsert.jsp</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess}">
			<script>
				alert("저장 하였습니다.");
				location.href="${pageContext.request.contextPath }/snsuser/private/mysns.jsp";
			</script>
		</c:when>
		<c:otherwise>
		<h1>Alert</h1>
			<p>
				글 정보 저장 실패!
				<a href="${pageContext.request.contextPath }/snsuser/insertform.jsp">다시 작성 하기</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>