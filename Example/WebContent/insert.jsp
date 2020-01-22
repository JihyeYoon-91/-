<%@page import="friendDto.pac.FriendDto"%>
<%@page import="friendDao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
  	String name=request.getParameter("name");
  	String phNum=request.getParameter("phNum");
  	FriendDto dto=new FriendDto(name,phNum);
  	boolean isSuccess=FriendDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/insert.jsp</title>
</head>
<body>
<%if(isSuccess){%>
	<script>
		alert("추가 성공!");
		location.href="index.jsp";
	</script>
<%}else{ %>
	ALERT
	추가 실패!
	<a href="${pageContext.request.contextPath}/insertForm.jsp">다시 추가하러가기</a>
	<a href="${pageContext.request.contextPath}/index.jsp">인덱스 페이지로 가기</a>
<%} %>
</body>
</html>