<%@page import="friendDto.pac.FriendDto"%>
<%@page import="java.util.List"%>
<%@page import="friendDao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 List<FriendDto> list=FriendDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>친구 목록 입니다.</h1>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>핸드폰번호</th>
		</tr>
	</thead>
	<tbody>
		<% for(FriendDto tmp:list){%>
		<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getName() %></td>
			<td><%=tmp.getPhNum() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
</body>
</html>