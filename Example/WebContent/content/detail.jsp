<%@page import="imgDao.ImgDao"%>
<%@page import="imgDto.ImgDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

	int num=Integer.parseInt(request.getParameter("num"));
	ImgDto dto=ImgDao.getInstance().getData(num);	
	session.setAttribute("imgDto", dto);
	session.setAttribute("num", num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/content/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
</head>
<body>
<div class="container">
	<h1>이미지 상세보기</h1>
		<table>
			<tr>
				<th>글번호</th>
				<td>${num}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${imgDto.writer}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${imgDto.regdate}</td>
			</tr>
			<tr>				
				<th>
					추천수
				</th>
				<td>
					${imgDto.likeCount}
				</td>
			</tr>
			<tr>	
				<td>
					<a href="${pageContext.request.contextPath}/content/addLikeCount.jsp?likeCount=${imgDto.likeCount}&num=${num}"><button>좋아요</button></a>
				</td>	
			</tr>
		</table>

	<div class="contents">${imgDto.content}</div>
	<a href="${pageContext.request.contextPath}/snsuser/private/mysns.jsp">뒤로가기</a>
	<c:choose>
		<c:when test="${imgDto.writer eq id}">
			<a href="${pageContext.request.contextPath}/content/updateform.jsp?num=${num}">수정</a>
			<a href="javascript:deleteConfirm()">삭제</a>
		</c:when>	
	</c:choose>
</div>
<script>
	function deleteConfirm(){
		var isDelete=confirm("글을 삭제 하시 겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/content/delete.jsp?num=${num}";
		}
	}
</script>
</body>
</html>