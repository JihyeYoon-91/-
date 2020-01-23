<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/snsuser/signupForm</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
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
<h1>회원 가입 폼 입니다.</h1>
	<form action="signup.jsp" method="post">
	<input type="hidden" name="profile" id="profile" value="" ><br />
	<label for="id">아이디</label>
	<input type="text" name="id" id="id" ><br />
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd" ><br />
	<label for="pwd2">비밀번호 확인</label>
	<input type="password" name="pwd2" id="pwd2" ><br />
	<label for="email">이메일</label>
	<input type="text" name="email" id="email" ><br />
	<button type="submit">확인</button>
	<button type="reset">취소</button>
	</form>
</div>

</script>
</body>
</html>