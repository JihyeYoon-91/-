<%@page import="SnsuserDao.SnsuserDao"%>
<%@page import="SnsuserDto.SnsuserDto"%>
<%@page import="java.util.List"%>
<%@page import="imgDto.ImgDto"%>
<%@page import="imgDao.ImgDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<ImgDto> list=ImgDao.getInstance().getList();
	String id=(String)session.getAttribute("id");
	SnsuserDto dto=SnsuserDao.getInstance().getData(id);
	
	session.setAttribute("profile",dto.getProfile());
	session.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1> <strong>${profile},${id}</strong> 님의  mysns페이지</h1>
	
	<ul>
		<li><a href="${pageContext.request.contextPath}/snsuser/private/profileEdit.jsp">프로필 편집</a></li>
		<li><a href="${pageContext.request.contextPath}/snsuser/private/list.jsp">sns가입 회원목록 보러가기 </a></li>
		<li><a href="${pageContext.request.contextPath}/snsuser/private/imgInsertForm.jsp">게시물 추가하기</a></li>
	</ul>
	<table>
		<thead>
			<tr>
				<th>나의 게시물 모아보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list}" >
				<tr>
					<td>${tmp.content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>