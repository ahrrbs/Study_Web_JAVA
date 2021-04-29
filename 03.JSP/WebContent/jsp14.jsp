<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<table border="1">
		<tr align="center">
			<td colspan="2" height="150">회사로고/네이게이션 메뉴</td>
		</tr>
		<tr align="center">
			<td width="30%" height="300">로그인 들어갈 부분</td>
			<td width="70%" >본문영역이 들어갈 부분</td>
		</tr>
		<tr align="center">
			<td colspan="2">
			<!-- 회사로고/네이게이션 메뉴 -->
			<%@ include file="jsp13.jsp" %>
			<br/>
			<jsp:include page="jsp13.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</div>
</body>
</html>