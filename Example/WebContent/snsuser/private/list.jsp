<%@page import="SnsuserDto.SnsuserDto"%>
<%@page import="java.util.List"%>
<%@page import="SnsuserDao.SnsuserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
 	List<SnsuserDto> list=SnsuserDao.getInstance().getList();
	session.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/snsuser/list.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지가 가로 세로 50px 인 원형으로 표시 될수 있도록  */
	#profileLink img{
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
	
	#profileForm{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h3>회원목록 입니다.</h3>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>프로필사진<th>
				<th>가입날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list}">
			<tr>
				<td>${tmp.id}</td>
				<td>
					<a href="javascript:" id="profileLink">
						<c:choose>
							<c:when test="${empty tmp.profile}">
								<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg"/>
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath }${tmp.profile}"/>
							</c:otherwise>
						</c:choose>
					</a>
				</td>
				<td>${tmp.regdate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%-- jquery form  플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면 
	$("#profileLink").click(function(){
	});

</script>
</body>
</html>