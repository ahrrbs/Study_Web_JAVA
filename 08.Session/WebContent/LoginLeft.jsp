<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
로그인이 되어 있는 상태
	- 세션객체에 id 속성이 있다. : session.setAttribute("id", id);
	-해강값(id)을 가져와서 로그인 유지 상태를 보여준다.
로그인이 되어 있지 않은 상태
	- 세션 객체에 id 속성이 없다
	- 로그인 할 수 있는 화면을 보여준다.

 --%>
<%
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Left</title>
</head>
<body>
<%if(id != null){ //세션에 id 값이 있다. : 로그인 상태를 유지하는%>
	<%=id %>님 방문을 환영합니다.<br/>
	<a href="Logout.jsp">로그 아웃</a>
<%} else { // 서션에 id값이 없다 : 로그인하는 화면을 보여준다.%>
<form action="LoginProcess.jsp" method="post">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" required="required"/></td>
		<td rowspan="2"><input type="submit" value="로그인"/></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" required="required"/></td>
	</tr>
</table>
</form>
<%} %>
</body>
</html>