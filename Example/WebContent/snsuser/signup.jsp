<%@page import="SnsuserDao.SnsuserDao"%>
<%@page import="SnsuserDto.SnsuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id=(String)request.getParameter("id");
	String email=(String)request.getParameter("email");
	String pwd=(String)request.getParameter("pwd");
	boolean isSuccess=SnsuserDao.getInstance().insert(id,email,pwd);
	session.setAttribute("isSuccess", isSuccess);
	session.setAttribute("id", id);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/signup.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess}">
		<script>
		alert(" ${id}님 회원가입되셨습니다. ");
		location.href="${pageContext.request.contextPath}/index.jsp";
		</script>
	</c:when>
	<c:otherwise>
		ALERT
		추가 실패!
	<a href="${pageContext.request.contextPath}/snsuser/signupForm.jsp">다시 추가하러가기</a>
	<a href="${pageContext.request.contextPath}/index.jsp">인덱스 페이지로 가기</a>
	</c:otherwise>
</c:choose>
</body>
</html>