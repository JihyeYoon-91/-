<%@page import="imgDao.ImgDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//1. 삭제할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	
	//세션의 아이디와 글 작성자를 비교해서 같을때만 삭제한다. 
	String id=(String)session.getAttribute("id");
	//글작성자
	String writer=ImgDao.getInstance().getData(num).getWriter();
	//아이디와 글 작성자와 같은지 여부
	boolean isEqual=id.equals(writer);
	if(!isEqual){
		//에러를 응답하고 
		response.sendError(HttpServletResponse.SC_FORBIDDEN,
				"남의 글 삭제 하기 없기!");
		//메소드를 종료한다.
		return;
	}
	
	//2. DB 에서 삭제 한다.
	boolean isSuccess=ImgDao.getInstance().delete(num);
	//3. 응답한다
	
	//EL,JSTL 을 활용하기 위해 필요한 모델을 request에 담는다.
	request.setAttribute("isSuccess", isSuccess);
	request.setAttribute("num", num);	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess}">
			<script>
				alert(" ${num} 번 글을 삭제 했습니다.");
				location.href="${pageContext.request.contextPath }/snsuser/private/mysns.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<h1>Alert</h1>
			<p class="alert alert-danger">
				글 삭제 실패!
				<a class="alert-link" 
					href="${pageContext.request.contextPath }/content/detail.jsp?num=${num}">돌아 가기</a>
			</p>				
		</c:otherwise>
	</c:choose>	
</div>
</body>
</html>