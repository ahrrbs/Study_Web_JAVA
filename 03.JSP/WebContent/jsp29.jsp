<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL core문을 사용하기 위해서는 반드시 문서 상단에 지시자를 기술 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1. 프로그래밍 Tag : 변수, 배열, if, switch~case, for 등 => core<br/>
<%
int num1 = 100;
%>
JAVA num1 : <%=num1 %>
<br/>
<%-- JSTL 변수 선언 : <c:set ~~> --%>
<c:set var="num2" value="200"></c:set>
JSTL num2 : ${num2 }<br/>

<c:set  var="num3" value="<%=num1 %>"></c:set>
JSTL num3 : ${num3 }<br/>

<c:set var="result" value="${num2 + num3 }"></c:set>
JSTL result = ${result }
</body>
</html>