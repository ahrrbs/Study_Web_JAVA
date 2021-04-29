<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//jsp03.jsp 에서 넘겨준 바인딩 객체를 받는다 =>  Class Type, Casting
Integer num1 = (Integer) request.getAttribute("num1");
Integer num2 = (Integer) request.getAttribute("num2");
Integer sum = (Integer) request.getAttribute("sum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP04</title>
</head>
<body>
첫 번째 정수 : <%=num1 %></br>
두 번째 정수 : <%=num2 %></br>
첫 번째 정수부터 두 번째 정수까지의 누적합 : <%=sum %>
</body>
</html>