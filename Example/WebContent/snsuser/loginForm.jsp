<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginForm</title>
</head>
<body>
<%
	// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
	String url=request.getParameter("url");
	if(url==null){//만일 없으면 
		//로그인 성공후에 index.jsp 페이지로 보낼수 있도록 구성한다. 
		url=request.getContextPath()+"/index.jsp";
	}
	//아이디, 비밀번호가 쿠키에 저장되었는지 확인해서 저장 되었으면 폼에 출력한다.
	Cookie[] cookies=request.getCookies();
	//저장된 아이디와 비밀번호를 담을 변수 선언하고 초기값으로 빈 문자열 대입 
	String savedId="";
	String savedPwd="";
	if(cookies != null){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("savedId")){
				savedId=tmp.getValue();
			}else if(tmp.getName().equals("savedPwd")){
				savedPwd=tmp.getValue();
			}
		}
	}
	session.setAttribute("url", url);
	session.setAttribute("savedId", savedId);
	session.setAttribute("savedPwd", savedPwd);
%>
</body>
<div class="container">
	<form action="login.jsp" method="post">
		<input type="hidden" name="url" value="${url}" />
		<h2 class="form-signin-heading">로그인 정보 입력</h2>
		<label for="id">아이디</label>
		<input type="text" id="id" name="id"" 
			placeholder="아이디" value="${savedId}"/>
		<label for="pwd">비밀번호</label>
		<input type="password" id="pwd" name="pwd" 
			placeholder="비밀번호" value="${savedPwd}">
		<div class="checkbox">
			<label>
				<input type="checkbox" name="isSave" value="yes"/>아이디, 비밀번호 저장
			</label>
		</div>
		<button type="submit">로그인</button>	
	
	
	</form>
</div>
</html>