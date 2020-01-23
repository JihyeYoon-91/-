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
	session.setAttribute("list", list);
	session.setAttribute("dto", dto);
	session.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/snsuser/private/mysns.jsp</title>
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
	<table>
		<thead>
			<tr>
				<th><a href="javascript:" id="profileLink">
					<c:choose>
						<c:when test="${empty dto.profile}">
							<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg"/>	
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}${dto.profile}"/>
						</c:otherwise>
					</c:choose>
				</a></th>
				<th><h1> <strong>${profile}${id}</strong> 님 로그인 </h1></th>			
			</tr>
		</thead>
	</table>
	<ul>
		<li><a href="${pageContext.request.contextPath}/snsuser/private/list.jsp">sns가입 회원목록 보러가기 </a></li>
		<li><a href="${pageContext.request.contextPath}/snsuser/private/imgInsertForm.jsp">게시물 추가하기</a></li>
		<li><a href="${pageContext.request.contextPath}/snsuser/private/logout.jsp">로그아웃</a></li>
	</ul>
	<table>
		<thead>
			<tr>
				<th>게시물 모아보기</th>
			</tr>
		</thead>
		<tbody>	
			<c:forEach var="tmp" items="${list}" >
				<tr>
					<td>────────────────────────────────────────────────────────────────────</td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/content/detail.jsp?num=${tmp.num}">${tmp.content}</a></td>
				</tr>
				<tr>
					<td>────────────────────────────────────────────────────────────────────</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<form action="profile_upload.jsp" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage"
		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
</form>
<%-- jquery form  플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면 
	$("#profileLink").click(function(){
		//강제로 <input type="file" /> 을 클릭해서 파일 선택창을 띄우고
		$("#profileImage").click();
	});
	//input type="file" 에 파일이 선택되면 
	$("#profileImage").on("change", function(){
		//폼을 강제 제출하고 
		$("#profileForm").submit();
	});
	
	// jquery form 플러그인의 동작을 이용해서 폼이 ajax 로 제출되도록 한다. 
 	$("#profileForm").ajaxForm(function(responseData){
		//responseData 는 plain object 이다.
		//{savedPath:"/upload/저장된이미지파일명"}
		//savedPath 라는 방에 저장된 이미지의 경로가 들어 있다.
		console.log(responseData);
		var src="${pageContext.request.contextPath }"
							+responseData.savedPath;
		// img 의 src 속성에 반영함으로써 이미지가 업데이트 되도록 한다.
		$("#profileLink img").attr("src", src);
	}); 
 </script>	

</body>
</html>