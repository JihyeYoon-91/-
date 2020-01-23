<%@page import="SnsuserDao.SnsuserDao"%>
<%@page import="SnsuserDto.SnsuserDto"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//목적지 정보
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath()+"/index.jsp";
	}
	//목적지 정보를 미리 인코딩 해 놓는다.
	String encodedUrl=URLEncoder.encode(url);

	//1. 폼 전송되는 아이디, 비밀번호를 읽어와서
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//2. DB 에서 유효한 정보인지를 확인해서 
	SnsuserDto dto=new SnsuserDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=SnsuserDao.getInstance().isValid(dto);
	//3. 유효한 정보이면 로그인 처리를 하고 유효한 정보가 아니면 다시 로그인을 할수 있도록 한다.
	if(isValid){
		//로그인 되었다는 의미에서 session 에 "id" 라는 키값으로 아이디를 저장한다.
		session.setAttribute("id", id);
	}
	
	//4. 아이디 비밀번호 저장 체크박스를 체크 했는지 읽어와 본다.
	String isSave=request.getParameter("isSave");
	//아이디, 비밀번호를 쿠키에 저장
	Cookie idCook=new Cookie("savedId", id);
	Cookie pwdCook=new Cookie("savedPwd", pwd);
	if(isSave != null){ // null 이 아니면 체크 한 것이다.
		//한달 동안 저장하기
		idCook.setMaxAge(60*60*24*30);
		pwdCook.setMaxAge(60*60*24*30);
	}else{
		//쿠키 지우기 
		idCook.setMaxAge(0);
		pwdCook.setMaxAge(0);
	}
	response.addCookie(idCook);
	response.addCookie(pwdCook);
	//EL,JSTL 을 활용하기 위해 필요한 모델을 request에 담는다.
	request.setAttribute("isValid", isValid);
	session.setAttribute("url", url);
	session.setAttribute("encodedUrl", encodedUrl);
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/snsuser/login.jsp</title>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<c:choose>
		<c:when test="${isValid}">
			<p>
				<strong>${id}</strong> 회원님 로그인 되었습니다.
				<a href="${pageContext.request.contextPath}/snsuser/private/mysns.jsp ">확인</a>
			</p>		
		</c:when>
		<c:otherwise>
			<p>
				아이디 혹은 비밀번호가 틀려요!
				<a href="${pageContext.request.contextPath}/snsuser/loginForm.jsp?url=${encodedUrl}">다시 로그인 하러 가기</a>
			</p>		
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>