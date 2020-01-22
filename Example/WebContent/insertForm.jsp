<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/insertForm.jsp</title>
</head>
<body>
<h1>친구 추가폼 입니다.</h1>
<div class="container">
<form action="insert.jsp" method="post">
	<label for="name">이름</label>
	<input type="text" name="name" id="name"  />
 	<label for="phNum">핸드폰 번호</label>
	<input type="text" name="phNum" id="phNum"  />
	<button type="submit">추가</button>
</form>
</div>
</body>
</html>