<%@page import="imgDao.ImgDao"%>
<%@page import="imgDto.ImgDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 수정할 글 정보를 파라미터에서 추출한다.
	int num=(int)session.getAttribute("num");
 	String content=request.getParameter("content");
 	//2. DB 에 수정반영하고
 	ImgDto dto=new ImgDto();
 	dto.setNum(num);
 	dto.setContent(content);
 	boolean isSuccess=ImgDao.getInstance().update(dto);
 	//3. 응답한다.
 	
 	//EL,JSTL 을 활용하기 위해 필요한 모델을 request에 담는다.
	request.setAttribute("isSuccess", isSuccess);
	request.setAttribute("num", num);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/content/update.jsp</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess}">
			<script>
				alert("${num}번 글을 수정했습니다.");
				location.href="${pageContext.request.contextPath }/content/detail.jsp?num=${num}";
			</script>		
		</c:when>	
		<c:otherwise>
			<h1>Alert</h1>
			<p class="alert alert-danger">
				글 수정 실패!
				<a class="alert-link" href="${pageContext.request.contextPath }/content/updateform.jsp?num=${num}">다시 시도</a>
			</p>		
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>