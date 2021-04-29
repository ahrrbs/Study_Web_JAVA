<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//jsp30.jsp에서 넘겨준 바인딩 객체를 받는다
/* String name = (String) request.getAttribute("name");
String code = (String) request.getAttribute("code");
Integer price = (Integer) request.getAttribute("price"); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP31</title>
</head>
<body>
제품명 : ${name }<br/>
제품코드 : ${code }<br/>
제품가격 : ${price }<br/>
</body>
</html>