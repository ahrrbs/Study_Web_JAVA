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
<table border="1" style="width: 80%">
	<tr height="100">
		<td colspan="2">
			<!-- 페이지 상단영역(LoginTop.jsp)  -->
			<jsp:include page="LoginTop.jsp"/>
		</td>
	</tr>
	<tr height="300">
		<td width="40%" align="center" valign="top">
			<!-- 페이지 왼쪽영역(LoginLeft.jsp)  -->
			<jsp:include page="LoginLeft.jsp"/>
		</td>
		<td align="center" valign="middle">
			<!-- c\Content 영역  -->
			<h3>메인 페이지입니다.</h3>
			2021.04.15
		</td>
	</tr>
	<tr height="70">
		<td colspan="2">
			<!-- 페이지 하단 영역(LoginBottom.jsp)  -->
			<jsp:include page="LoginBottom.jsp"/>
	</tr>
</table>
</div>
</body>
</html>