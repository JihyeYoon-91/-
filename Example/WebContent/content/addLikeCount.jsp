<%@page import="imgDao.ImgDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int likeCount=Integer.parseInt(request.getParameter("likeCount"));
	int num=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess=ImgDao.getInstance().addLikeCount(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/content/addLikeCount.jsp</title>
</head>
<body>
<div class="container">
		<script>
			location.href="${pageContext.request.contextPath }/content/detail.jsp?num=${num}";
		</script>

</div>
</body>
</html>