<%@page import="com.hanul.study.SumResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
SumResultDTO dto = (SumResultDTO) request.getAttribute("dto");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result JSP</title>
</head>
<body>
<div align="center">
	첫 번째 정수 : <%=dto.getNum1() %> </br>
	두 번째 정수 : <%=dto.getNum2() %> </br>
	두 수 사이의 누적합 : <%=dto.getSum() %>
</div>
</body>
</html>